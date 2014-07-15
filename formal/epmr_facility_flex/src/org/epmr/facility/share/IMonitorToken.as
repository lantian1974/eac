package org.epmr.facility.share
{
	public interface IMonitorToken
	{
		function get target():Object;
		
		function update(minValue:Number,value:Number,maxValue:Number):Boolean;
		
		function stop():void;
	}
}