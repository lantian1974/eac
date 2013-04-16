package org.epmr.facility.remoting
{
	public class CallbackDescriptor implements ICallbackDescriptor
	{
		private var _handler:Function;
		private var _args:Array;
		public function CallbackDescriptor(handler:Function,args:Array)
		{
			this._handler=handler;
			this._args=args?args:[];
		}
		
		public function get handler():Function{
			return _handler;
		}
		
		public function get arguments():Array{
			return _args.concat();
		}
	}
}