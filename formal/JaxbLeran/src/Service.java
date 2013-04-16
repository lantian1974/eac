import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.JAXBElement;
@XmlRootElement(name="services-config")
public final class Service 
{
	
	private ArrayList<Channel> channels;
	
	
	@XmlElementWrapper(name="channels")
	@XmlElement(name="channel-definition")
	public ArrayList<Channel> getChannels() {
		return channels;
	}

	public void setChannels(ArrayList<Channel> channels) {
		this.channels = channels;
	}
	
	
	

}
