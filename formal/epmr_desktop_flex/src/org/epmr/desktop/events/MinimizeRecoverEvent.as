package org.epmr.desktop.events
{
	import flash.events.Event;
	
	import mx.core.UIComponent;

	public class MinimizeRecoverEvent extends Event
	{
		public static const MINIMIZE_RECOVER:String="org.epmr.core.minimizeRecover";
		private var  _minimizedObject:UIComponent;
		public function MinimizeRecoverEvent(type:String,minimizedObject:UIComponent,bubbles:Boolean=false, cancelable:Boolean=false)
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
           return new MinimizeRecoverEvent(type, this._minimizedObject,bubbles, cancelable);
        }
	}
}