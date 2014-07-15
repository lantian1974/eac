package org.epmr.facility.share
{
	public class FinalizeMonitor implements IProgressMonitor
	{
		private var _handler:Function;
		public function FinalizeMonitor(handler:Function)
		{
			this._handler=handler;
		}

		public function begin(target:Object,cancellable:Boolean=false):IMonitorToken{
			return new SimpleMonitorToken(this,target);
		}
		
		public function update(token:IMonitorToken,minValue:Number,value:Number,maxValue:Number):Boolean{
			return false;
		}
		
		public function stop(token:IMonitorToken):void{
			if(_handler!=null)
				_handler.call(null);			
		}
	}
}