package org.epmr.desktop.service
{
	public class FrameWorkServiceFactory
	{
		private static var  instance:FrameWorkServiceFactory=null;
		public static function getInstance():FrameWorkServiceFactory
		{
		  if (instance==null)
		  {
		     instance=new FrameWorkServiceFactory();
		  }
		  return instance; 
		}
		public function FrameWorkServiceFactory()
		{
		   if (instance!=null)
		   {
		     throw new Error("singleton类的实例已经创建!");
		   }
		}
		private static var frameWorkService:IFrameWorkService=null;
	    public function getFrameWrokService():IFrameWorkService
	    {
	       if (frameWorkService==null)
	       {
	          frameWorkService=new FrameWorkServiceRoImpl();
	       }
	       return frameWorkService;
	    }
	}
}