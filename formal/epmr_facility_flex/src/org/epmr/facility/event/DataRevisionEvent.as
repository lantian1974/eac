package org.epmr.facility.event
{
	import flash.events.Event;

	public class DataRevisionEvent extends Event
	{
		public static const REVISED:String="dataReviseTraced";
		public static const KIND_INIT:String="initialize";
		public static const KIND_ACCEPT:String="accept";
		public static const KIND_DISCARD:String="cancel";
		public static const KIND_MODIFY:String="modify";
		
		private var _kind:String;
		public function DataRevisionEvent(type:String,kind:String,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._kind=kind;
		}
		
		public function get kind():String{
			return _kind;
		}
		
		override public function clone():Event{
			return new DataRevisionEvent(type,kind,bubbles,cancelable);
		}
		
	}
}