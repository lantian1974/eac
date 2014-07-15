package
{
	import mx.managers.ISystemManager;
	import mx.messaging.config.ServerConfig;
	import mx.managers.SystemManager;
	[Mixin]
	public class ServerConfigInitializeMixin
	{
		public static function init (systemManager : ISystemManager):void
		{
			var serverConfig:XML=ServerConfig.xml;
			var server:String=systemManager.loaderInfo.parameters.server;
			var port:String=systemManager.loaderInfo.parameters.port;
			var conntextPath:String=systemManager.loaderInfo.parameters.conntextPath;
			
		}
	}
}