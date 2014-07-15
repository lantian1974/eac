package org.epmr.facility.recorder
{
	import flash.net.SharedObject;
	
	public class LocalMedium extends AbstractRecorderMedium
	{
		private static const ROOT:String="/com/xdfsoft/recorder/LocalRecorder";
		
		private var _so:SharedObject;
		public function LocalMedium(name:String)
		{
			super(name)
			_so=SharedObject.getLocal(ROOT,"/");
		}

		override protected function get disk():Object{
			return _so.data;
		}
		
		override public function flush():void{
			_so.flush();
		}
		
		public static function deleteAll():void{
			SharedObject.getLocal(ROOT).clear();
		}
		
		public static function get partitions():Object{
			var tmp:Object=SharedObject.getLocal(ROOT).data;
			var result:Object=new Object();
			for(var name:String in tmp){
				result[name]=tmp[name].label;
			}
			return result;
		}
		
		public static function deletePartition(name:String):void{
			var tmp:Object=SharedObject.getLocal(ROOT).data;
			delete tmp[name];
		}
	}
}