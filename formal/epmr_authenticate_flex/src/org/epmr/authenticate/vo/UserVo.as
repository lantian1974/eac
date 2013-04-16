package org.epmr.authenticate.vo
{
	[Bindable]
	[RemoteClass(alias="org.epmr.authenticate.dto.UserDTO")]
	public class UserVo
	{
		public var loginCode:String;
		public var prefix:String;
		public var firstName:String;
		public var lastName:String;
		public var erpPersonId:String;
		public var email:String;
		public var officePhone:String;
		public var mobilePhone:String;
		public var qqNumber:String;
		public var userType:int;
		public var userTypeName:String;
		public var enabled:Boolean;
	}
}