package org.epmr.facility.remoting
{
	public interface IResponderInterceptor
	{
		/**
		 * result事件发生，调用任何callback之前的通知函数
		 * @param responder
		 * @param data
		 * @return Boolean 返回true则阻止对所有callback的调用，并且afterResult也不会被通知
		 */
		function beforeResult(responder:IInvokeResponder,data:Object,callbacks:Array):Boolean;
		
		/**
		 * result事件发生，调用所有callback之后的通知函数 
		 * @param responder
		 * @param data
		 */
		function afterResult(responder:IInvokeResponder,data:Object,callbacks:Array):void;
		
		/**
		 * fault事件发生，调用任何callback之前的通知函数
		 * @param responder
		 * @param info
		 * @return Boolean 返回true则阻止对所有callback的调用，并且afterFault也不会被通知
		 * 
		 */
		function beforeFault(responder:IInvokeResponder,info:Object,callbacks:Array):Boolean;
		
		/**
		 * fault事件发生，调用所有callback之后的通知函数 
		 * @param responder
		 * @param info
		 */
		function afterFault(responder:IInvokeResponder,info:Object,callbacks:Array):void;
	}
}