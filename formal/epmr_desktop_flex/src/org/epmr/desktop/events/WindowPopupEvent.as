package org.epmr.desktop.events
{
	import org.epmr.desktop.controls.MinizableTitleWindow;
	
	import flash.events.Event;
	public class WindowPopupEvent extends Event
	{
		public static const WINDOW_POPUP_EVENT:String="org.epmr.core.windowPupup"
		public var window:MinizableTitleWindow;
		public function WindowPopupEvent(type:String, window:MinizableTitleWindow,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.window=window;
		}
		
	}
}