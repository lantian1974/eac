package org.epmr.authenticate.vo
{
	[Bindable]
	[RemoteClass(alias="org.epmr.authenticate.dto.AuthTokenDTO")]
	public class AuthTokenVo
	{
		public function AuthTokenVo()
		{
		  	
		}
		public var user:UserVo;
		public var loginTime:Date;
		public var sessionId:String;
		public var authServerIp:String;
		public var authenticatorClassName:String;
		public var info:String;
		public var authenticated:Boolean;
	}
}