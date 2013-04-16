package org.epmr.facility.recorder
{
	import flash.events.EventDispatcher;
	
	[Event(name="record",type="org.epmr.facility.recorder.RecorderEvent")]
	[Event(name="replay",type="org.epmr.facility.recorder.RecorderEvent")]
	public class Recorder extends EventDispatcher implements IRecorder
	{
		private var _medium:IRecorderMedium;
		public function Recorder(medium:IRecorderMedium)
		{
			this._medium=medium;
		}
		protected function get medium():IRecorderMedium{
			return this._medium;
		}
		public function record(content:Object):void
		{
			var event:RecorderEvent=new RecorderEvent(RecorderEvent.RECORD,content,false,true);
			if(dispatchEvent(event)){
				content=event.content;
				_medium.seek(_medium.length);
				_medium.write(content);
			}	
		}
		
		public function replay():void
		{
			for(var i:int=0;i<_medium.length;i++){
				if(_medium.seek(i)){
					var content:Object=_medium.read();
					var event:RecorderEvent=new RecorderEvent(RecorderEvent.REPLAY,content,false,true);
					if(dispatchEvent(event)){
						playHandler(event.content);
					}
				}
			}
		}
		protected function playHandler(content:Object):void{
			
		}
		public function clear():void{
			_medium.clear();
		}
		public function flush():void{
			_medium.flush();
		}
	}
}