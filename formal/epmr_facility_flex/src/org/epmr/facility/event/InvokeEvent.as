package org.epmr.facility.event
{
	import flash.events.Event;

	public class InvokeEvent extends Event
	{
		public static const INVOKE:String="methodInvoke";
		
		public static const STATE_START:int=1;
		public static const STATE_ERROR:int=2; 
		public static const STATE_RESULT:int=4;
		public static const STATE_FAULT:int=8;
		public static const STATE_CANCEL:int=16;
		
		private var _method:String;
		private var _state:int;
		public function InvokeEvent(type:String,method:String,state:int,bubbles:Boolean=false,cancelable:Boolean=false)
		{
			super(type,bubbles, cancelable);
			_state=state;
			_method=method;
		}
		
		public function get state():int{
			return _state;
		}
		public function get method():String{
			return _method;
		}
		override public function clone():Event{
			return new InvokeEvent(type,_method,_state,bubbles,cancelable);
		}
	}
}