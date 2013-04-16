package org.epmr.desktop.model
{
	import org.epmr.desktop.controls.MessageBox;
	import org.epmr.desktop.events.UserLoginEvent;

	import org.epmr.desktop.service.FrameWorkServiceFactory;
	import org.epmr.desktop.service.IFrameWorkService;
	import org.epmr.desktop.view.LoginDialog;
	import org.epmr.desktop.view.MemManager;
	import org.epmr.remoting.Host;
	import flash.net.*;
	import mx.controls.Alert;
	import spark.components.Application;
	import mx.managers.IHistoryManager;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	[Bindable]
	public  class FrameWorkModel
	{
		private static var frameWorkModel:FrameWorkModel =new FrameWorkModel();
		public var unitName:String
	    private var historyManager:IHistoryManager;
		public static function getInstance():FrameWorkModel
		{
		  return frameWorkModel;
		}
		public function  getFullPathUrl(url:String):String
		{
		   if (url==null) return url;
		   if (!(url.substr(0,4).toLowerCase()=="http"))
           {
            	return Host.getInstance().channelUri+url;
           }
           else
           {
                return url;
           }
		}
		public function FrameWorkModel()
		{
			if (frameWorkModel!=null) 
			{
			  throw new Error("FrameWorkModel 对象已经创建！");
			}
		}
		
		private var _loginAccountCode:String=null;
		public function get loginAccountCode():String
		{
		  return this._loginAccountCode;
		}
		public function set loginAccountCode(accountCode:String):void
		{
		     if (this._loginAccountCode==accountCode) return;
		     this._loginAccountCode=accountCode;
		     var frmwkService:IFrameWorkService=FrameWorkServiceFactory.getInstance().getFrameWrokService();
		     frmwkService.getCurrentPerspective().setResultCallback(onLoadPerspective);
		}
		private function onLoadPerspective(event:ResultEvent):void
		{
		        if (event.result is  PerspectiveVo)
                {
                	this.currentUserPerspective =event.result as PerspectiveVo;
                	this.loginAccount=new Account(this.currentUserPerspective.account);
                	var loginEvent:UserLoginEvent=new UserLoginEvent(UserLoginEvent.USER_LOGIN);
                	this.topApplication.dispatchEvent(loginEvent);
                } 
                else
                {
                	Alert.show("无法获得登录用户的工作台信息，请联系系统管理人员！");
                }   
                
		}
		private function onLoadPerspectiveFault(event:FaultEvent):void
		{
		   Alert.show("无法获得登录用户的工作台信息，请联系系统管理人员！");
		}
		private var _topApplication:spark.components.Application=null;
		public function get topApplication():Application
		{
			 return this._topApplication;
		}
		public function set topApplication(app:Application):void
		{
			 this._topApplication=app;
		}
		
        public var sessionId:String=null;
        public var loginAccount:Account=null;
     
        public var currentUserPerspective:PerspectiveVo=null;
        /**
         *打开给定的Web用户人机界面资源。
         *@param webUIResource web用户人机界面资源对象。
         *@param parent 弹出的人机界面的父。
    
         *@return Web用户人机界面资源的包装窗口，通过这个返回值，可以调整窗口的位置。
        */
        public function openWebUIResource(webUIResource:WebUIResourceVo):void
        {
            if (webUIResource==null) return ;
             //打开资源是JSP或者其他基于Html的网页，则在网页后面加上SessionID，然后在浏览器中将其打开
            if (webUIResource.type==WebUIResourceVo.HTML_BASE_URL)
            {
               openHtmlBasedPage(webUIResource.url);
               return;
            }
            var fmc:FunctionModuleContainer=new FunctionModuleContainer(this.topApplication,false);
			fmc.setStyle("cornerRadius",15);
            fmc.webUIResource=webUIResource;
            fmc.open();
          
        }
      
        /**
         *打开基于html的网页，后面加上SessionID的值，确保同一个客户端打开的html页面在一个Session里面。
         */
        private function openHtmlBasedPage(url:String):void
        {
          var fullUrl:String=this.getFullPathUrl(url)+"?"+"sessionid="+this.sessionId;
          var u:URLRequest= new URLRequest(fullUrl);
          navigateToURL(u,"_blank");

        }
        public function memoryManage():void
        {
           var mm:MemManager=new MemManager();
           PopUpManager.addPopUp(mm,this.topApplication,false);
           PopUpManager.bringToFront(mm);
           PopUpManager.centerPopUp(mm);
        }
        public function verifySession():void
        {
            if (this.loginAccountCode==null)
            {
               MessageBox.warning("您还未登录，请登录后重试！","注意");
               return;
            }
             var ld:LoginDialog=new LoginDialog();
              PopUpManager.addPopUp(ld,this.topApplication,true);
              PopUpManager.centerPopUp(ld);
           // var rs:IRightService =RightServiceFactory.getInstance().getRightService();
           // rs.verifySession(this.loginAccountCode).setResultCallback(onVerifySesionResult);
        }
        
        private function onVerifySesionResult(event:ResultEvent):void
        {
            var verifyOk:Boolean=event.result as Boolean;
            if (!verifyOk)
            {
              var ld:LoginDialog=new LoginDialog();
              PopUpManager.addPopUp(ld,this.topApplication,true);
              PopUpManager.centerPopUp(ld);
            }
        }
   }
}