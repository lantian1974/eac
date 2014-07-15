package org.epmr.desktop.managers
{
	import org.epmr.collection.ArrayList;
	import org.epmr.collection.HashMap;
	import org.epmr.collection.IList;
	import org.epmr.collection.IMap;
	import org.epmr.collection.ISet;
	import org.epmr.collection.Iterator;
	
	import mx.core.UIComponent;
	
	public class OpenedWindowManager
	{
		
		private static var instance:OpenedWindowManager=null;
		public static function getInstance():OpenedWindowManager
		{
		    if (instance==null)
		    {
		      instance=new OpenedWindowManager();
		    }
		    return instance;
		}
	    private  var windowsMap:IMap=null;
		public function OpenedWindowManager()
		{
			if (instance!=null)
			{
			   throw new Error("org.epmr.desktop.managers.OpenedWindowManager只能有一个实例！");
			}
			this.windowsMap=new HashMap();
		}
		public function put(url:String,window:UIComponent):void
		{
		  this.windowsMap.put(url,window);
		}
	    public function find(url:String):UIComponent
	    {
	      return this.windowsMap.find(url) as UIComponent;
	    }
		public function remove(url:String):UIComponent
		{
		   var window:UIComponent=this.windowsMap.remove(url) as UIComponent;
		   return window;
		}
		public function isOpended(url:String):Boolean
		{
		   return this.windowsMap.containsKey(url);
		}
		
		public function getAllOpendWindows():IList
		{
		    var resultLit:IList=new ArrayList();
		    var keys:ISet=this.windowsMap.keySet();
		    var keyIt:Iterator=keys.iterator();
		    while(keyIt.hasNext())
		    {
		    	var url:String=keyIt.next() as String;
		    	var window:UIComponent=this.find(url);
		    	resultLit.add(window);
		    }
		    return resultLit;
		}
		public function getAllOpenWindowUrl():IList
		{
			var resultList:IList=new ArrayList();
			var keys:ISet=this.windowsMap.keySet();
		    var keyIt:Iterator=keys.iterator();
		    while(keyIt.hasNext())
		    {
		    	var url:String=keyIt.next() as String;
		    	resultList.add(url);
		    }
		    return resultList;	
		}

	}
}