import java.io.IOException;

import java.io.InputStream;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;


public class FlexChannelsConfig extends HttpServlet
{
	private String configFileUrl=null;
	private final String SERVICES_CONFIG_FILE_PATH_PARAMETER="services.configuration.file";
	public void init(ServletConfig servletConfig) throws ServletException
    {
        super.init(servletConfig);
        this.configFileUrl=servletConfig.getInitParameter(SERVICES_CONFIG_FILE_PATH_PARAMETER);
    }
	
	 public void service(HttpServletRequest req, HttpServletResponse res)
	 {
		 if (this.configFileUrl==null) 
	        {
	        	throw new RuntimeException("Servlet : "+FlexChannelsConfig.class.getName()+" has no init-param named "+ SERVICES_CONFIG_FILE_PATH_PARAMETER);
	        }
	    	ServletContext cx=req.getServletContext();
	        InputStream is= cx.getResourceAsStream(configFileUrl);
	        String serverInfo=cx.getServerInfo();
	        System.out.println(serverInfo);
	        if (is==null)
	        {
	        	throw new RuntimeException("the value of servet initialize paramter named  "
	                      +SERVICES_CONFIG_FILE_PATH_PARAMETER+" for Servlet : "+FlexChannelsConfig.class.getName()
	                      +" is not valid!");
	        	
	        }
	        ServletOutputStream sos=null;
	        res.setContentType("text/xml");
	        int readByteCount;
			try
			{
				sos = res.getOutputStream();
			     byte[] xml=new byte[1024];
	             while((readByteCount=is.read(xml,0,xml.length))>0)
	             {
	                sos.write(xml,0,readByteCount);
	             }
	             res.flushBuffer();
			}
			catch (IOException e) 
			{
				e.printStackTrace();
			}
			finally
			{
			   try 
			   {
				   if (is!=null) is.close();
				   if(sos!=null) sos.close();
				} catch (IOException e)
				{
						e.printStackTrace();
				}
			}
	    }
}
