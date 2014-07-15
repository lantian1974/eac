package org.epmr.facility.remoting
{
	
	public class MediateResponder extends LocalResponder
	{
		private var _source:IInvokeResponder;
		private var _intercepter:Function;
		private var _params:Array;
		public function MediateResponder(source:IInvokeResponder,intercepter:Function,...params)
		{
			_source=source;
			_intercepter=intercepter;
			_params=params;			
			_source.setResultCallback(intercept);
			_source.setFaultCallback(onFault);
		}
		
		private function intercept(data:Object):void{
			var result:Object=data;
			if(_intercepter!=null){
				_params.unshift(result);
				var tmp:*=_intercepter.apply(null,_params);
				if(tmp)
					result=tmp;
			}
			super.invokeResult(result);
		}
		
		private function onFault(info:Object):void{
			super.invokeFault(info);
		}
	}
}