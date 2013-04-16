package org.epmr.desktop.controls
{
	import org.epmr.desktop.managers.ModuleManagerExt;
	import org.epmr.desktop.managers.SimpleCacheManager;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import spark.components.Application;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;
	import mx.events.ModuleEvent;
	import mx.events.ResizeEvent;
	import mx.managers.PopUpManager;
	import mx.modules.IModuleInfo;
	import mx.modules.Module;
	
	import spark.components.SkinnableContainer;

	[Event(name="contentChange", type="flash.events.Event")]
	[Event(name="close", type="flash.events.Event")]
	/**
	 *这个类是可最小化化的TitleWIndow的一个子类。
	 */
	public class ModuleContainer extends MinizableTitleWindow
	{
		public static var loader:ModuleManagerExt=new ModuleManagerExt(new SimpleCacheManager());
		
		public static const CLOSE:String="close";
		public static const CONTENT_CHANGE:String="contentChange";
		private var _parent:DisplayObjectContainer;
		private var _modal:Boolean;
		private var _url:String;
		private var _module:Module;
		private var _window:SkinnableContainer;
		private var _opened:Boolean;
		private var _openDelayed:Boolean;
		private var _info:IModuleInfo;
		public function ModuleContainer(parent:DisplayObjectContainer=null,modal:Boolean=false)
		{
			_parent=parent==null?FlexGlobals.topLevelApplication as DisplayObjectContainer:parent;
			_modal=modal; 
			_opened=false;
			this.addEventListener(ResizeEvent.RESIZE,onResize,false,0,true);
			if(stage)
				onAddToStage(null);
			else
				this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage,false,0,true);	
		}
		private function onAddToStage(event:Event):void{
			this.stage.addEventListener(Event.RESIZE,onResize,false,0,true);
		}
		protected function onResize(event:Event):void{
			if(super.windowMinimized) return;
			if(_window && _opened && _openDelayed==false)
				PopUpManager.centerPopUp(_window);
		}
		protected function getUrl():String{
			return _url;
		}
		
		protected function setUrl(value:String):void{
			if(value==null) throw new Error("url can not be null");	
			if(_window){
				dispatchEvent(new Event(CONTENT_CHANGE));
			}	
			doFinalize();	
			_url=value;
			loadModule();
		}
		
		public function get module():Module{
			return _module;
		}
		public function get window():SkinnableContainer{
			return _window;
		}
		
		public function open():void{
			if(_opened && _module!=null){
				bringFront(_module);
				return;
			}
			_opened=true;
			if(_module){
				doOpen(_module,_parent,_modal);
				_openDelayed=false;				
			}	
			else
				_openDelayed=true;
		}
		override public function close():void{
			if(_opened){
				doFinalize();
				doClose(_module,_parent);
				_opened=false;
			}
		}
		
		private function loadModule():void{
			_info=loader.loadModule(_url);
			if(_info.ready)
				processModule();
			else{
				_info.addEventListener(ModuleEvent.READY,onModuleReady);
			}
		}
		private function onModuleReady(event:ModuleEvent):void{
			_info.removeEventListener(ModuleEvent.READY,onModuleReady);
			processModule();
		}
		private function processModule():void{
			_module=_info.factory.create() as Module;
			doInitialize();
			if(_opened && _openDelayed){
				doOpen(_module,_parent,_modal);
				_openDelayed=false;
			}	
		}
		protected function doInitialize():void{
			
			_window=this;//new MinizableTitleWindow();
			_window.addElement(_module);
			/**
			 * 凡被Popup出来的UIComponents都不能设置
			 * percentWidth，否则效果结束时会出现异常。
			 */
			//_window.percentWidth=100;
			//_window.percentHeight=100;	
			if(_module is IPopUpable){
				IPopUpable(_module).wrapperWindow=injection;
			}
		}
		protected function get injection():IPopUpWindow{
			return _window as MinizableTitleWindow;
		}
		protected function doFinalize():void{
			if(stage)
			{
			 stage.removeEventListener(Event.RESIZE,onResize);
			}
			if(_window && _module){	
				_window.removeElement(_module);
			}	
			_module=null;	
			if(_url!=null && _info!=null){
				loader.unloadModule(_url);
				_url=null;
				_info=null;
			}	
		}

		protected function doOpen(content:Module,parent:DisplayObjectContainer,modal:Boolean):void{			
			PopUpManager.addPopUp(_window,parent,modal);
			PopUpManager.centerPopUp(_window);
		}
		protected function doClose(content:Module,parent:DisplayObjectContainer):void{
			PopUpManager.removePopUp(_window);
			this.dispatchEvent(new CloseEvent(CloseEvent.CLOSE,true,true));
		}
		
		protected function bringFront(content:Module):void{
			PopUpManager.bringToFront(_window);
		}
	}
}