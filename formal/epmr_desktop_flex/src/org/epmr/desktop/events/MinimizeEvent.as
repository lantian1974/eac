package org.epmr.desktop.events
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
    
	public class MinimizeEvent extends Event
	{
		public static const MINIMIZE:String="org.epmr.core.minimize";
		private var  _minimizedObject:UIComponent;
		public function MinimizeEvent(type:String,minimizedObject:UIComponent, bubbles:Boolean=false, cancelable:Boolean=false)
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
          return new MinimizeEvent(type,this._minimizedObject, bubbles, cancelable);
        }

	}
}