package org.epmr.facility.widget.calendar
{
	import flash.events.Event;

	public class MonthChangeEvent extends Event
	{
		public static const CHANGE:String="monthChange";
		private var _year:uint;
		private var _month:uint;
		public function MonthChangeEvent(type:String, year:uint,month:uint,
							bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._year=year;
			this._month=month;
		}
		
		public function get year():uint{
			return _year;
		}
		public function get month():uint{
			return _month;
		}
		override public function clone():Event{
			return new MonthChangeEvent(type,_year,_month,bubbles,cancelable);
		}
	}
}