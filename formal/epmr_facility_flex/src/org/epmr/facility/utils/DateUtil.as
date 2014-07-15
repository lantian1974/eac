package org.epmr.facility.utils
{
	import mx.formatters.DateFormatter;
	
	public class DateUtil
	{
		private static var formater:DateFormatter=null;
		public function DateUtil()
		{
		}
		
		public static function format(value:Date,pattern:String="YYYY-MM-DD"):String{
			if(formater==null)
				formater=new DateFormatter();
			formater.formatString=pattern;	
			return formater.format(value);	
		}
	}
}