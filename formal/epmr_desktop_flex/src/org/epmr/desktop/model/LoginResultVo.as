package org.epmr.desktop.model
{
	[Bindable]
	[RemoteClass(alias="org.epmr.right.dto.LoginResultDto")]
	public class LoginResultVo
	{
		    public function LoginResultVo(){}
			public var  sessionId:String;
            public var  loginSucceed:Boolean;
            public var  info:String;
            public var  unitName:String;
	}
}