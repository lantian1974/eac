package org.epmr.desktop.events
{
	import org.epmr.desktop.model.WebUIResourceVo;
	
	import flash.events.Event;
   
	public class OpenWindowEvent extends Event
	{
		public static const OPENT_WINDOW_EVENT:String="org.epmr.core.openwindow";
		public function OpenWindowEvent(type:String, webUIResource:WebUIResourceVo,bubbles:Boolean=false, cancelable:Boolean=false,allowReOpen:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._webUIResource=webUIResource;
			this._allowReOpen=allowReOpen;
		}
		private var _webUIResource:WebUIResourceVo;
		public function get webUIResource():WebUIResourceVo
		{
		  return this._webUIResource;
		}
		private var _allowReOpen:Boolean=false;
		public function get allowReOpen():Boolean
		{
		  return this._allowReOpen;
		}

	}
}