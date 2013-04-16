package org.epmr.flex.channels;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name="services")
public class ServiceConfigOnClient 
{
	private ArrayList<ChannelOnClient> channels;
	@XmlElementWrapper(name="channels")
	@XmlElement(name="channel")
	public ArrayList<ChannelOnClient> getChannels()
	{
		return channels;
	}

	public void setChannels(ArrayList<ChannelOnClient> channels) {
		this.channels = channels;
	}
}
