package org.epmr.facility.remoting
{
	import flash.events.IEventDispatcher;
	
	import mx.rpc.IResponder;
	
	//[Deprecated(replacement="org.epmr.remoting.IInvokeResponder")]
	/**
	 * this interface is Deprecated,use "org.epmr.remoting.IInvokeResponder" instead
	 **/
	public interface IInvokeInfo extends IInvokeResponder
	{
//		function get sign():Object;
//		
//		function set sign(value:Object):void;
//		
//		function get responders():Array;
//		
//		function get result():Object;
//		
//		function addResponder(resp:IResponder):void;
		
		function set resultHandler(value:Function):void;
		
		function set faultHandler(value:Function):void;
	}
}