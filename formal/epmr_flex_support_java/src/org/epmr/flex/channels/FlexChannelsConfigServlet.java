package org.epmr.flex.channels;

import java.util.List;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
public class FlexChannelsConfigServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5853574451094500560L;
	/**
	 * 
	 */
	private String configFileUrl=null;
	private final String SERVICES_CONFIG_FILE_PATH_PARAMETER="services.configuration.file";
	private ServiceConfigOnServer serviceConfigOnServer=null;
	private byte[]  serviceConfigOnClientXml=null;
	/**
	 * 在Servlet初始化，由于没有请求，无法获得
	 * 服务的端口，上文路径以及服务器的名字，只能将Flex服务的配置文件原样转化为Java类。
	 */
	public void init(ServletConfig servletConfig) throws ServletException
    {
        super.init(servletConfig);
        serviceConfigOnServer=this.readFlexServiceConfigOnServer(servletConfig);
    }
	
	 public void service(HttpServletRequest req, HttpServletResponse res)
	 {
		 if (this.serviceConfigOnClientXml==null)
		 {
			 synchronized(this)
			 {
				 if(this.serviceConfigOnClientXml==null)
				 {
					 ByteArrayOutputStream buffer=new ByteArrayOutputStream();
					 try 
					 {
						 ServiceConfigOnClient serviceConfigOnClient=this.generateServiceConfigOnClient(req);
						 JAXBContext context = JAXBContext.newInstance(ServiceConfigOnClient.class);
						 Marshaller m=context.createMarshaller();
						 m.marshal(serviceConfigOnClient,buffer);
						 //ByteArrayOutputStream 类的toByteArray()方法创建了一个新数组，
						 //并将数据拷贝到该数组中，对该数组的引用不会阻止对ByteArrayOutputStream实例的垃圾回收。
						 this.serviceConfigOnClientXml=buffer.toByteArray();
					 }
					 catch (Exception e) 
					 {
						e.printStackTrace();
					 } 
					 finally
					 {
						 try
						 {
							buffer.close();
						 }
						 catch (IOException e) 
						{
							e.printStackTrace();
						}
					 }
				 }
			 }
		 }
		try
		{
		    res.setContentType("text/xml");
		    res.setCharacterEncoding("UTF-8");
		    res.getOutputStream().write(this.serviceConfigOnClientXml);
		    res.flushBuffer();
		 } 
		 catch (IOException e)
		 {
			e.printStackTrace();
		 }
	 }
	 private ServiceConfigOnServer readFlexServiceConfigOnServer(ServletConfig servletConfig)
	 {
		 this.configFileUrl=servletConfig.getInitParameter(SERVICES_CONFIG_FILE_PATH_PARAMETER);
		 if (this.configFileUrl==null) 
		 {
		         throw new RuntimeException("Servlet : "+FlexChannelsConfigServlet.class.getName()+" has no init-param named "+ SERVICES_CONFIG_FILE_PATH_PARAMETER);
		 }
		 ServletContext cx=servletConfig.getServletContext();  
		 InputStream is= cx.getResourceAsStream(configFileUrl);
		 if (is==null)
         {
        	throw new RuntimeException("the value of servet initialize paramter named  "
                      +SERVICES_CONFIG_FILE_PATH_PARAMETER+" for Servlet : "+FlexChannelsConfigServlet.class.getName()
                      +" is not valid!");
         }
		 try
	     {
	        JAXBContext context = JAXBContext.newInstance(ServiceConfigOnServer.class);
	        Unmarshaller um = context.createUnmarshaller();
	        ServiceConfigOnServer sc=(ServiceConfigOnServer)um.unmarshal(is);
	        return sc;
	     }
	     catch (Exception e)
	     {
		    e.printStackTrace();
		    throw new RuntimeException(e);
	     }
		 finally
		 {
			 try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
	 }
	 private  ServiceConfigOnClient generateServiceConfigOnClient(HttpServletRequest req) throws ParserConfigurationException, SAXException, IOException, XPathExpressionException
	 {
		 String serverName=req.getServerName();
		 int serverPort=req.getServerPort();
		 String contextRoot=req.getContextPath();
		 ServiceConfigOnClient result=new ServiceConfigOnClient();
		 ArrayList<ChannelOnClient> channelsForClient=new ArrayList<ChannelOnClient>();
		 result.setChannels(channelsForClient);
		 DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		 dbf.setNamespaceAware(true);
		 DocumentBuilder db = dbf.newDocumentBuilder();
		 InputStream is=req.getServletContext().getResourceAsStream(this.configFileUrl);
		 try
		 {
		    Document doc = db.parse(is);
  	        XPathFactory factory = XPathFactory.newInstance();
		    XPath xpath = factory.newXPath();
		    for(ChannelOnServer channelOnServer:this.serviceConfigOnServer.getChannels())
		    {
			   ChannelOnClient channelOnClient=new ChannelOnClient();
			   channelsForClient.add(channelOnClient);
			   channelOnClient.setId(channelOnServer.getId());
			   channelOnClient.setType(channelOnServer.getClassName());
			   EndpointOnServer endpointOnServer=channelOnServer.getEndpoint();
			   if (endpointOnServer!=null)
			   {
			       EndpointOnClient endpointOnClient=new EndpointOnClient();
			       String uri=endpointOnServer.getUrl();
			       uri=uri.replace("{server.name}",serverName);
			       uri=uri.replace("{server.port}",Integer.toString(serverPort));
			       uri=uri.replace("/{context.root}",contextRoot);
			       endpointOnClient.setUri(uri);
			       channelOnClient.setEndpoint(endpointOnClient);
			    }
			    if (channelOnServer.getProperties()==null) continue;
        	    List<JAXBElement<String>> properties=new ArrayList<JAXBElement<String>> ();
        	    channelOnClient.setProperties(properties);
        	    String expression="//services-config/channels/channel-definition[@id='"+channelOnServer.getId()+"']/properties/*" ;
        	    NodeList propNodes=(NodeList)xpath.evaluate(expression, doc, XPathConstants.NODESET);
        	    for(int i=0;i<propNodes.getLength();i++)
        	    {
        	        Node propNode=propNodes.item(i);
        		    String propNodeName=propNode.getNodeName();
        		    String propNodeValue=propNode.getTextContent();
        		    JAXBElement<String> element=new JAXBElement<String>(new QName(propNodeName),String.class,propNodeValue);
        		    properties.add(element);
        	    }
		     }
		 }
		 finally
		 {
			 is.close();
		 }
		 return result; 
	 }
}
