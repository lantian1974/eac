package org.epmr.facility.remoting
{
	import org.epmr.facility.event.RespondEvent;
	import org.epmr.utils.reflect.Field;
	import org.epmr.facility.share.IMonitorToken;
	import org.epmr.facility.share.IProgressMonitor;
	import org.epmr.facility.utils.PrimitiveUtil;
	
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LocalResponder extends AbstractInvokeResponder
	{
		public function LocalResponder()
		{
			
		}
		
		public function invokeResult(data:Object):void
		{
			var result:Object=normalizeResult(data);
			super.invokeCallbacks(result,RespondEvent.TYPE_RESULT);
		}
		
		public function invokeFault(info:Object):void
		{
			var fault:Object=normalizeFault(info);
			invokeCallbacks(fault,RespondEvent.TYPE_FAULT);
		}
		
		override protected function customizeResult(value:Object):Object{
			return value==null?null:ResultEvent(value).result;
		}
		override protected function normalizeResult(value:Object):Object{
			if(value is ResultEvent)
				return value as ResultEvent;
			return new ResultEvent(ResultEvent.RESULT,false,false,value);
		}
		override protected function normalizeFault(value:Object):Object{
			if(value is FaultEvent)
				return value as FaultEvent;
			else{
				var fault:Fault=null
				if(value is Fault)
					fault=value as Fault;
				else if(value!=null){
					fault=new Fault("",value.toString());
					fault.rootCause=value;
				}		
				return new FaultEvent(FaultEvent.FAULT,false,false,fault);
			} 	
		}
	}
}
