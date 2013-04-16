package org.epmr.facility.share
{
	public interface IProgressMonitor
	{
//		function get label():String;
//		
//		function set label(value:String):void; 
//		
//		function get delay():uint;
//		
//		function set delay(value:uint):void;
		
		function begin(target:Object,cancellable:Boolean=false):IMonitorToken;
		
		function update(token:IMonitorToken,minValue:Number,value:Number,maxValue:Number):Boolean;
		
		function stop(token:IMonitorToken):void;
	}
}