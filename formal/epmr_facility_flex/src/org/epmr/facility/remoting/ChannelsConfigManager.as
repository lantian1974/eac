

package org.epmr.facility.remoting
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.display.Sprite;
	import mx.messaging.config.ServerConfig;
	import mx.events.FlexEvent;
	public class ChannelsConfigManager
	{
		private static const DEFAULT_CHANNELS_CONFIG_URL:String="FlexChannelsConfig";
		private var _channelsConfigUrl:String;
		private var _preloader:Sprite;
		private var _loader:URLLoader;
		private static var _instance:ChannelsConfigManager=null;
		private static var configXML:XML;
		/**
		 * 该方法在Application加载完毕所有RSL，准备进入第二帧之前，加载后台的channels定义。 
		 * 该方法只能在自定义的DownloadProgressBar中使用，当为DownloadProgressBar设置
		 * PreLoader时调用该方法，可参阅org.epmr.facility.preloader.BaseDownloadProgressBar
		 * 参数——preloader： 是Flex在应用程序启动之前加载RSL的PreLoader，    系统PreLoader只能在自定义的Application的加载进度条中获取。
		 * 参数——channelsConfigUrl：是后台org.epmr.flex.channels.FlexChannelsConfigServlet的URL，缺省值为"FlexChannelsConfig"
		 *       注意：该URL一定要与Flex Application的URL在一个相对路径下。比如MainApp.swf在/mywebsite/home/中，则
		 *       后台的Servlet地址映射应为：/home/FlexChannelsConfig,这里，/mywebsite是web容器的context路径。
		 */
		public  static function  loadChannelsConfig(preloader:Sprite,channelsConfigUrl:String=null):void
		{
		    if (_instance==null)
			{
				_instance=new ChannelsConfigManager(preloader,channelsConfigUrl);	
			}
			else
			{
				_instance._preloader=preloader;
				_instance._channelsConfigUrl=channelsConfigUrl;
				if (_instance._channelsConfigUrl==null) 
					_instance._channelsConfigUrl=DEFAULT_CHANNELS_CONFIG_URL;
			}
			_instance.waitForLoad();
		}
		/**
		 *该方法用来将mx.messaging.config.ServerConfig的xml属性初始化为正确的内容（更新为来自于后台的channel配置信息）。
		 * 以确保远程对象mx.rpc.remoting.RemoteObject所依赖的channel设置信息能够根据WEB服务器的Context path动态变化。
		 * 一般在Application的creationComplete事件处理器中调用该方法。 
		 */
		public static function  initializeChannelConfigs():void
		{
			if (ServerConfig.xml==null)
			{
				throw new Error("you invoke ChannelsConfigManager.initializeChannelConfigs() too early!");
			}
			var newXml:XML=configXML.copy();
			var curXmlList:XMLList=ServerConfig.xml.children();
			for(var i:int=curXmlList.length()-1;i--;i>0)
			{
				var xml:XML=curXmlList[i];
				if (xml.name!="channels")
				{
					newXml.insertChildAfter(null,xml);
				}
			}
			ServerConfig.xml=newXml;
		}       
		public  function ChannelsConfigManager(preloader:Sprite,channelsConfigUrl:String=null)
		{
			this._preloader=preloader;
			if (this._preloader==null)
			{
			  throw new Error("ChannelsConfigManager need a Preloader when create it's instance ");
			}
			this._channelsConfigUrl=channelsConfigUrl;
			if (this._channelsConfigUrl==null) 
				this._channelsConfigUrl=DEFAULT_CHANNELS_CONFIG_URL;		
		}
		private function waitForLoad():void
		{
			this._preloader.addEventListener(FlexEvent.PRELOADER_DOC_FRAME_READY, preloaderDocFrameReadyHandler, false, int.MAX_VALUE); 
		}
		private function preloaderDocFrameReadyHandler(event:FlexEvent):void
		{
			event.stopImmediatePropagation();
			this.loadChannelsConfigFromServer();
		}
		private function loadChannelsConfigFromServer():void
		{
			this._loader=new URLLoader();
			var request:URLRequest=new URLRequest();
			request.url=this._channelsConfigUrl;
			this._loader.dataFormat=URLLoaderDataFormat.TEXT;
			this._loader.addEventListener(Event.COMPLETE,doOnLoadOk);
			this._loader.addEventListener(IOErrorEvent.IO_ERROR,doOnLoadFail);
			this._loader.load(request);
		}
		private function doOnLoadOk(event:Event):void
		{
			configXML=new XML(this._loader.data);
			this._preloader.removeEventListener(FlexEvent.PRELOADER_DOC_FRAME_READY, preloaderDocFrameReadyHandler); //移除监听
			this._preloader.dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DOC_FRAME_READY)); //继续初始化Application
            this._preloader=null;
			this._loader=null;
		}
		private function doOnLoadFail(event:IOErrorEvent):void
		{
			this._preloader.removeEventListener(FlexEvent.PRELOADER_DOC_FRAME_READY, preloaderDocFrameReadyHandler); //移除监听
			this._preloader.dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DOC_FRAME_READY)); //继续初始化Application
			this._preloader=null;
			this._loader=null;
			throw new Error("load channels config from url:"+this._channelsConfigUrl+" failed,error id:"+event.errorID+
		                  "\\n details info:\\n"+event.text);
		}
	}
}