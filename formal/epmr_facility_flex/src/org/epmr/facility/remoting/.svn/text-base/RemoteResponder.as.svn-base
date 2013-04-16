package org.epmr.facility.remoting
{
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	public class RemoteResponder extends LocalResponder implements IResponder
	{
		private var _token:AsyncToken;
		private var _oper:AbstractOperation;
		public function RemoteResponder(token:AsyncToken,oper:AbstractOperation=null)
		{
			super();
			_token=token;
			_oper=oper;
			if(token){
				token.addResponder(this);
			}					
		}
		public function get token():AsyncToken{
			return _token;
		}
		override public function cancel():Boolean{
			if(_oper && _token){
				var msg:RemotingMessage=_token.message as RemotingMessage;
				if(msg)
					_oper.cancel(msg.messageId);
			}
			return super.cancel();
		}
		public function result(data:Object):void
		{
			super.invokeResult(data);
			if(_oper)
				_oper.clearResult(false);
		}
		
		public function fault(info:Object):void
		{
			super.invokeFault(info);
		}
		
	}
}

