package org.epmr.facility.event
{
	import flash.events.Event;
	
	import mx.rpc.remoting.RemoteObject;
	public class RespondEvent extends Event
	{
		public static const TYPE_RESULT:String="result";		
		public static const TYPE_FAULT:String="fault";
		
		public static const PHASE_BEFORE:String="before";
		public static const PHASE_AFTER:String="after";
		
		private var _phase:String;
		private var _data:Object;
		private var _callbacks:Array;
		public function RespondEvent(type:String,phase:String,data:Object, callbacks:Array,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._phase=phase;
			this._data=data;
			this._callbacks=callbacks;new RemoteObject
		}
		
		public function get callbacks():Array{
			return _callbacks;
		}
		public function get data():Object{
			return _data;
		}
		public function get phase():String{
			return _phase;
		}
		override public function clone():Event{
			return new RespondEvent(type,_phase,_data,_callbacks,bubbles,cancelable);
		}
		
	}
}