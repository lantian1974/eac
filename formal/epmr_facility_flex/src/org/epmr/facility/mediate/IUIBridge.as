package org.epmr.facility.mediate
{
	import flash.events.IEventDispatcher;
	
	public interface IUIBridge extends IEventDispatcher
	{
		function toUIData(context:Object,property:String,modelValue:*):*;
		
		function fromUIData(context:Object,property:String,viewValue:*):*;
		
		function modelUpdated(context:Object,property:String,origin:*,current:*):void;
	}
}