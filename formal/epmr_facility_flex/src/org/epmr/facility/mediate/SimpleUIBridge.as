package org.epmr.facility.mediate
{
	import flash.events.EventDispatcher;
	
	public class SimpleUIBridge extends EventDispatcher implements IUIBridge
	{
		public static const INSTANCE:IUIBridge=new SimpleUIBridge();
		public function SimpleUIBridge()
		{
		}

		public function toUIData(context:Object,property:String, modelValue:*):*
		{
			return modelValue;
		}
		
		public function fromUIData(context:Object,property:String,viewValue:*):*
		{
			return viewValue?viewValue:undefined;
		}
		public function modelUpdated(context:Object,property:String,origin:*,current:*):void{
			
		}
	}
}