package org.epmr.facility.event
{
	
	import flash.events.Event;

	public class ListDataEvent extends Event
	{
		public static const SELECTED:String="item_selected";
		public static const ACTIVATED:String="item_activated";
		
		private var _item:Object;
		public function ListDataEvent(type:String,item:Object)
		{
			super(type, bubbles, cancelable);
			this._item=item;
		}
		
		public function get item():Object{
			return _item;
		}
		
		override public function clone():Event{
			return new ListDataEvent(type,_item);
		}
	}
}