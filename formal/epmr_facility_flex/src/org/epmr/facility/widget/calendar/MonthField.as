package org.epmr.facility.widget.calendar
{
	import org.epmr.facility.utils.DateUtil;
	import org.epmr.facility.widget.DropdownField;
	
	import mx.core.UIComponent;
	
	
	public class MonthField extends DropdownField
	{
		[Embed("month.png")]
		private var _dropdownImg:Class;
		
		private var _year:uint;
		private var _month:uint;
		
		private var _pattern:String;
		private var _minDate:Date;
		private var _maxDate:Date;
		private var _rangeChanged:Boolean;
		
		private var _chooser:MonthChooser
		public function MonthField()
		{
			super();
			_pattern="YYYYMM";
		}
		override protected function get dropdownIndicator():Class{
			return _dropdownImg;
		}
		
		override protected function createDropdown():UIComponent{
			_chooser=new MonthChooser();
			_chooser.addEventListener(MonthChangeEvent.CHANGE,onMonthChanged);
			return _chooser;
		}
		public function get minDate():Date{
			return _minDate;
		}
		public function set minDate(value:Date):void{
			if(_minDate!=value){
				_minDate=value;
				_rangeChanged=true;
				invalidateDisplayList();
			}
		}
		public function get maxDate():Date{
			return _maxDate;
		}
		public function set maxDate(value:Date):void{
			if(_maxDate!=value){
				_maxDate=value;
				_rangeChanged=true;
				invalidateDisplayList();
			}
		}
		public function get year():uint{
			return _year;
		}
		public function set year(value:uint):void{
			if(_year!=value){
				_year=value;
				rebuildText();
			}
		}
		public function get month():uint{
			return _month;
		}
		public function set month(value:uint):void{
			if(_month!=value){
				_month=value;
				rebuildText();
			}
		}
		override protected function commitProperties():void{
			super.commitProperties();
		}
		private function onMonthChanged(event:MonthChangeEvent):void{
			_year=event.year;
			_month=event.month;
			rebuildText();
			super.closeDropdown(event);
		}
		private function rebuildText():void{
			text=DateUtil.format(new Date(year,month),_pattern);	
		}
		override protected function updateDropdown(wnd:UIComponent):void{
//			_chooser
		}
	}
}