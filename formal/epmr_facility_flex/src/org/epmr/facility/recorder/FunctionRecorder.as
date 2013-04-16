package org.epmr.facility.recorder
{
	import flash.utils.getQualifiedClassName;
	
	public class FunctionRecorder 
	{
		private static var counter:int=0;
		private var _recorder:FunctionInnerRecorder;
		private var _owner:Object;
		public function FunctionRecorder(owner:Object,label:String)
		{
			_owner=owner;
			var className:String=flash.utils.getQualifiedClassName(owner);
			_recorder=new FunctionInnerRecorder(className,_owner);
			_recorder.label=label;
		}
		
		public function record(method:String,params:Array):void
		{
			_recorder.recordFunction(method,params);
		}
		
		public function replay():void{
			_recorder.replay();
			_recorder.clear();
		}
		
		public function clear():void{
			_recorder.clear();
		}
	}
}
	import org.epmr.facility.recorder.Recorder;
	import org.epmr.facility.recorder.LocalMedium;
	

class FunctionInnerRecorder extends Recorder{
	private var _owner:Object;
	public function FunctionInnerRecorder(id:String,owner:Object)
	{
		super(new LocalMedium(id));
		this._owner=owner;
	}
	public function recordFunction(method:String,params:Array):void{
		super.record([method,params]);
	}
	override protected function playHandler(content:Object):void{
		var method:String=content[0] as String;
		var params:Array=content[1] as Array;
		_owner[method].apply(_owner,params);
	}
	public function get label():String{
		return medium.label;
	}
		
	public function set label(value:String):void{
		medium.label=value;
	}
}