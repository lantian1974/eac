package org.epmr.desktop.controls
{
	import org.epmr.desktop.events.WindowPopupEvent;
	import org.epmr.desktop.managers.OpenedWindowManager;
	import org.epmr.desktop.model.FrameWorkModel;
	import org.epmr.desktop.model.WebUIResourceVo;
	import org.epmr.desktop.managers.MemoryManager;
	import org.epmr.right.managers.FunctionRightLoader;
	import org.epmr.right.model.FunctionGrantInfo;
	import org.epmr.right.model.IFunctionalUI;
	import flash.display.DisplayObjectContainer;
	import mx.events.FlexEvent;
	import mx.modules.Module;
	public class FunctionModuleContainer extends ModuleContainer implements IFunctionalUI
	{
		public function FunctionModuleContainer(parent:DisplayObjectContainer=null,modal:Boolean=false)
		{
			super(parent,modal);
	
		}
		private var _webUi:WebUIResourceVo;
		private var rightLoaded:Boolean=false;
		private var capturedModuleCreateEvent:Boolean=false;
		
		protected override function get injection():IPopUpWindow
		{
			return this as  MinizableTitleWindow;
		}
        public function get webUIResource():WebUIResourceVo
        {
           return this._webUi;
        }
        public function set webUIResource(webUi:WebUIResourceVo):void
        {
           if (webUi==null) throw new Error("webUIResource can not be null");
           this._webUi=webUi;
           this.setUrl(this._webUi.url);
        }
        private var _fgi:FunctionGrantInfo;
        public function get functionGrantInfo():FunctionGrantInfo
        {
        	return this._fgi;
        }
        public function set functionGrantInfo(fgi:FunctionGrantInfo):void
        {
        	this._fgi=fgi;    
        }
		protected override function doInitialize():void
		{
		    super.doInitialize();
		    var accountCode:String=FrameWorkModel.getInstance().loginAccountCode;
		    var url:String=this.webUIResource.url;
 	        var frl:FunctionRightLoader=new FunctionRightLoader(accountCode,url,this.onRightLoaded);	
		    frl.load();
		    this.module.addEventListener(FlexEvent.CREATION_COMPLETE,doOnModuleCreationComplete,false,99);
		}
		private function doOnModuleCreationComplete(event:FlexEvent):void
		{
		     this.module.removeEventListener(FlexEvent.CREATION_COMPLETE,doOnModuleCreationComplete,false);
		     if (this.rightLoaded) return;
		     event.stopImmediatePropagation();
		     capturedModuleCreateEvent=true;
		      
		}
		protected override function doClose(content:Module, parent:DisplayObjectContainer):void
		{
		    super.doClose(content,parent);
		    OpenedWindowManager.getInstance().remove(this.webUIResource.url);
		    MemoryManager.garbageCollect();
		  
		}
		protected override function doOpen(content:Module, parent:DisplayObjectContainer, modal:Boolean):void
		{
		    super.doOpen(content,parent,modal);
		    this.title=this.webUIResource.label;
		    OpenedWindowManager.getInstance().put(this.webUIResource.url,this);
		    var windowOpen:WindowPopupEvent=new WindowPopupEvent(WindowPopupEvent.WINDOW_POPUP_EVENT,this);
            FrameWorkModel.getInstance().topApplication.dispatchEvent(windowOpen);
		   
		}
		protected override function   doFinalize():void
		{
		  super.doFinalize();
		}
		private function onRightLoaded(fgi:FunctionGrantInfo):void
		{
		  if (fgi.functionVo!=null)
		  {
		    if (!fgi.granted)
		    {
		       throw new Error("您正在访问未授权的功能,请先让管理员为您授权！");
		    }
		    if(!fgi.grantOk)
		    {
		      throw new Error("您在本功能的授权工作尚未全部完成,请先让管理员为您完成授权再使用！");
		    }
		    if ((this.module!=null)&&(this.module is IFunctionalUI))
		    {
		       (this.module as IFunctionalUI).functionGrantInfo=fgi;
		    }
		    this._fgi=fgi;
		    this.rightLoaded=true;
		  }
		  if (this.capturedModuleCreateEvent)
		  {
		     var creationComplete:FlexEvent=new FlexEvent(FlexEvent.CREATION_COMPLETE);
		     this.module.dispatchEvent(creationComplete);s
		  }
		}
	}
}