package org.epmr.facility.remoting
{
	import org.epmr.facility.share.IProgressMonitor;
	
	import flash.events.EventDispatcher;
	
	public class InvokeResponderAdapter extends EventDispatcher implements IInvokeInfo
	{
		private var _responder:IInvokeResponder;
		public function InvokeResponderAdapter(responder:IInvokeResponder)
		{
			_responder=responder;
		}
		public function cancel():Boolean{
			return _responder.cancel();
		}
		
		public function set resultHandler(value:Function):void
		{
			_responder.setResultCallback(value);
		}
		
		public function set faultHandler(value:Function):void
		{
			_responder.setFaultCallback(value);
		}
		public function setResultCallback(callback:Function,...params):IInvokeResponder{
			var args:Array=new Array();
			args.push(callback);
			args=args.concat(params);
			_responder.setResultCallback.apply(_responder,args);
			return this;
		}
		
		public function setFaultCallback(callback:Function,...params):IInvokeResponder{
			var args:Array=new Array();
			args.push(callback);
			args=args.concat(params);
			 _responder.setFaultCallback.apply(_responder,args);
			 return this;
		}
		
		public function setCallback(callback:Function,...params):IInvokeResponder{
			var args:Array=new Array();
			args.push(callback);
			args=args.concat(params);
			_responder.setCallback.apply(_responder,args);
			return this;
		}
		public function setMonitor(monitor:IProgressMonitor):IInvokeResponder{
			_responder.setMonitor(monitor);
			return this;
		}
		public function bindResult(site:Object,field:String):void{
			_responder.bindResult(site,field);
		}
		
		public function dumpResult(target:Object):void{
			_responder.dumpResult(target);
		}
	}
}