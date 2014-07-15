package org.epmr.desktop.model
{
	[Bindable]
	[RemoteClass(alias="org.epmr.desktop.dto.WebUIResourceDto")]
	public class WebUIResourceVo
	{	
		public static const FLASH_BASE_URL:String="FLASH_BASE_URL";
		public static const HTML_BASE_URL:String="HTML_BASE_URL";
		public var url:String;
		public var label:String;
		public var autoOpen:Boolean;
		public var view:ViewVo;
		public var multiInstance:Boolean;
	    public function get type():String
	    {
	       if (this.url==null) return HTML_BASE_URL;
	       var dotPosition:int=this.url.indexOf('.');
	       if (dotPosition<0)return HTML_BASE_URL;
	       var urlSuffix:String= this.url.substring(dotPosition+1,this.url.length ).toLowerCase();
	       if (urlSuffix=="swf")
	       {
	       	 return FLASH_BASE_URL;
	       }
	       else
	       {
	         return HTML_BASE_URL;
	       }
	    }
	}
}