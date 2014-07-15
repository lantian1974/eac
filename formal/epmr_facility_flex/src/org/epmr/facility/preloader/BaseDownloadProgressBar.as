package org.epmr.facility.preloader
{
	import flash.display.Sprite;
	import mx.preloaders.SparkDownloadProgressBar;
	import org.epmr.facility.remoting.ChannelsConfigManager;
	public class BaseDownloadProgressBar extends SparkDownloadProgressBar
	{
		private static const DEFAULT_CHANNELS_CONFIG_URL:String="FlexChannelsConfig";
		public function BaseDownloadProgressBar()
		{
			super();
		}
		protected function getChannelsConfigUrl():String
		{
		    return DEFAULT_CHANNELS_CONFIG_URL;
		}
		override public function set preloader(value:Sprite):void
		{
			super.preloader=value;
			var url:String=this.getChannelsConfigUrl();
			ChannelsConfigManager.loadChannelsConfig(value,url);
		}
	}
}