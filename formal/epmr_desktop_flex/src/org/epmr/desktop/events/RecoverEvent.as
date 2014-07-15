package org.epmr.desktop.events
{
	import flash.events.Event;
	import mx.core.UIComponent;
	
	public class RecoverEvent extends Event
	{
		public static const RECOVER:String="org.epmr.core.recover";
		private var  _minimizedObject:UIComponent;
		public function RecoverEvent(type:String,minimizedObject:UIComponent, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._minimizedObject=minimizedObject;
		}
		public function get minimizedObject():UIComponent
		{
		  return this._minimizedObject;
		}
		override public function clone():Event
        {
          return new RecoverEvent(type,this._minimizedObject, bubbles, cancelable);
        }

	}
}