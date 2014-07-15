package org.epmr.flex.channels;
import java.util.List;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

import javax.xml.bind.annotation.XmlType;
@XmlType(propOrder = { "id", "className","endpoint","properties"})
class ChannelOnServer
{
	private String id;
    private String className;
    private EndpointOnServer endpoint;
    private List<JAXBElement<String>> properties;
    @XmlAttribute
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@XmlAttribute(name="class")
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	@XmlElement(name="endpoint")
	public EndpointOnServer getEndpoint() {
		return endpoint;
	}
	public void setEndpoint(EndpointOnServer endpoint) {
		this.endpoint = endpoint;
	}
	@XmlElementWrapper(name="properties")
	@XmlAnyElement
	public List<JAXBElement<String>> getProperties() {
		return properties;
	}

	public void setProperties(List<JAXBElement<String>> properties) {
		this.properties = properties;
	}
	
	
	
}
