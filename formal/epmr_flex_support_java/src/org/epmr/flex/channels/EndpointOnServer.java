package org.epmr.flex.channels;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAttribute;
@XmlRootElement(name="endpoint")
 final class EndpointOnServer
{
    private String url;
    private String className;
    @XmlAttribute
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	} 
	@XmlAttribute(name="class")
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
   
}
