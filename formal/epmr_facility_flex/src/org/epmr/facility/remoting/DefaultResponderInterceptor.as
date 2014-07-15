package org.epmr.facility.remoting
{
	import org.epmr.facility.view.MessageBox;
	
	public class DefaultResponderInterceptor implements IResponderInterceptor
	{
		public function DefaultResponderInterceptor()
		{
		}

		public function beforeResult(responder:IInvokeResponder, data:Object, callbacks:Array):Boolean
		{
			return false;
		}
		
		public function afterResult(responder:IInvokeResponder, data:Object, callbacks:Array):void
		{
		}
		
		public function beforeFault(responder:IInvokeResponder, info:Object, callbacks:Array):Boolean
		{
			return false;
		}
		
		public function afterFault(responder:IInvokeResponder, info:Object, callbacks:Array):void
		{
			if(callbacks.length==0){
				MessageBox.error(info);
			}
		}
		
	}
}