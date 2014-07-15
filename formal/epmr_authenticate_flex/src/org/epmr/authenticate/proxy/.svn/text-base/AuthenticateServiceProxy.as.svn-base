package org.epmr.authenticate.proxy
{
	import org.epmr.facility.remoting.AbstractRemotingProxy;
	import org.epmr.facility.remoting.IInvokeResponder;
	
	public class AuthenticateServiceProxy extends AbstractRemotingProxy 
	{
		
		private static const authenticateServiceDestination:String="org.epmr.authenticate.authenticateService";
		public function AuthenticateServiceProxy()
		{
			 super(authenticateServiceDestination);
		}
		public function  authenticate(loginCode:String,password:String):IInvokeResponder
		{
		   return  super.invoke("authenticate",loginCode,password);
		}
		public function helloWorld():IInvokeResponder
		{
		  return super.invoke("helloWorld");
		}
	}
}