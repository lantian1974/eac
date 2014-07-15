package org.epmr.flex.channels;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElementWrapper;
@XmlRootElement(name="services-config")
 final class ServiceConfigOnServer
{
	
	private ArrayList<ChannelOnServer> channels;
	@XmlElementWrapper(name="channels")
	@XmlElement(name="channel-definition")
	public ArrayList<ChannelOnServer> getChannels()
	{
		return channels;
	}

	public void setChannels(ArrayList<ChannelOnServer> channels) {
		this.channels = channels;
	}
   
}
