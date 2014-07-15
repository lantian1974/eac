package org.epmr.desktop.service
{
	import org.epmr.desktop.model.FrameWorkModel;
	import org.epmr.facility.remoting.AbstractRemotingProxy;
	import org.epmr.facility.remoting.IInvokeResponder;
	
	public class FrameWorkServiceRoImpl extends AbstractRemotingProxy implements IFrameWorkService
	{
		
		private static const frameworkServiceDestination:String="frameworkService";
		public function FrameWorkServiceRoImpl()
		{
			 super(frameworkServiceDestination);
		}
	   
	    public function getCurrentPerspective():IInvokeResponder
		{
		    if(FrameWorkModel.getInstance().loginAccountCode==null)
		    {
		     throw new Error("您还没有登录，请先登录再获取您的用户透视图！");
		    }
		   return super.invoke("getCurrentPerspectiveByCode",FrameWorkModel.getInstance().loginAccountCode);
		}
		public function savePerspective():IInvokeResponder
		{
		   return  super.invoke("savePerspective",FrameWorkModel.getInstance().currentUserPerspective);
		}
	}
}