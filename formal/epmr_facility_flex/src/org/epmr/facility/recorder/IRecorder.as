package org.epmr.facility.recorder
{
	import flash.events.IEventDispatcher;
	
	public interface IRecorder extends IEventDispatcher
	{
		function record(content:Object):void;
		
		function replay():void; 
		
		function clear():void;
		
		function flush():void;
	}
}