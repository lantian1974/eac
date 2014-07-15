package org.epmr.desktop.managers
{
	import org.epmr.desktop.controls.MessageBox;
	import org.epmr.remoting.Host;
	
	import flash.external.ExternalInterface;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	
	import mx.events.ModuleEvent;
	import mx.managers.CursorManager;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleManager;
	
	public class ModuleManagerExt
	{ 
		private var _cache:ICacheManager;
		private var _reg:RegExp=new RegExp("^\\w*://","i");//匹配以http://或https://等开头的url
		private var _actives:Dictionary;
		public function ModuleManagerExt(cache:ICacheManager){
			_cache=cache;
			_actives=new Dictionary(true);
		}
		public function get moduleCache():ICacheManager
		{
			return this._cache;
		}
		public function getModule(url:String):IModuleInfo{			
			if(_cache.containsKey(url))
				return _cache.find(url) as IModuleInfo;
			var path:String=url;
			if(_reg.test(url)==false){

				path=Host.getInstance().channelUri+url;
				var result:IModuleInfo=ModuleManager.getModule(path);
				if(result){
					_cache.put(url,result);
					//result.addEventListener(ModuleEvent.UNLOAD,onModuleUnload);
				}	
			}
			
			return result;
		}
		
//		private function onModuleUnload(event:ModuleEvent):void{
//			var info:IModuleInfo=event.target as IModuleInfo;
//			_cache.remove(info.url);
//		}
		public function loadModule(url:String):IModuleInfo{
			var result:IModuleInfo=getModule(url);
			if(result in _actives) return result;
			_actives[result]=true;
			result.addEventListener(ModuleEvent.ERROR,onLoadFinish);
			result.addEventListener(ModuleEvent.READY,onLoadFinish);
			result.addEventListener(ModuleEvent.PROGRESS,onLoading);
			CursorManager.setBusyCursor(); 
			result.load(ApplicationDomain.currentDomain);
			return result;
		}
		private function onLoadFinish(event:ModuleEvent):void{
			var result:IModuleInfo=event.module;
			delete _actives[result];
			result.removeEventListener(ModuleEvent.ERROR,onLoadFinish);
			result.removeEventListener(ModuleEvent.READY,onLoadFinish);
			result.removeEventListener(ModuleEvent.PROGRESS,onLoading);
			CursorManager.removeBusyCursor();
			if(event.type==ModuleEvent.ERROR)
				MessageBox.error(event.errorText);
			else if(ExternalInterface.available){
				ExternalInterface.call("eval","window.status='"+result.factory.info().mainClassName+" is ready' ");
			}	
		}	
		private function onLoading(event:ModuleEvent):void{
			var result:IModuleInfo=event.module;
			var percent:int=100*event.bytesLoaded/event.bytesTotal;
			var msg:String="loading "+percent+"% bytes:"+event.bytesLoaded+"/"+event.bytesTotal;
			if(ExternalInterface.available){
				ExternalInterface.call("eval","window.status='"+msg+"'");
			}
		}
		public function unloadModule(url:String):IModuleInfo{
			var result:IModuleInfo=null;
			if(_cache.containsKey(url)){
				result=_cache.find(url) as IModuleInfo;
				if(result.loaded){
					result.unload();
				}
				_cache.remove(url);
			}
			return result;
		}
	}
}