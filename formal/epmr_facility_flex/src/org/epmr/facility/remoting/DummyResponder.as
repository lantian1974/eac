package org.epmr.facility.remoting
{
	import org.epmr.facility.share.IProgressMonitor;
	
	import flash.events.EventDispatcher;
	
	public class DummyResponder extends EventDispatcher implements IInvokeResponder
	{
		public function DummyResponder()
		{
		}

		public function setResultCallback(callback:Function, ...params):IInvokeResponder
		{
			return this;
		}
		
		public function setFaultCallback(callback:Function, ...params):IInvokeResponder
		{
			return this;
		}
		
		public function setCallback(callback:Function, ...params):IInvokeResponder
		{
			return this;
		}
		
		public function cancel():Boolean
		{
			return false;
		}
		public function setMonitor(monitor:IProgressMonitor):IInvokeResponder{
			return this;
		}
		public function bindResult(site:Object,field:String):void{
			
		}
		
		public function dumpResult(target:Object):void{
			
		}
	}
}