package org.epmr.desktop.model
{
	import flash.geom.Point;
	
	[Bindable]
	[RemoteClass(alias="org.epmr.desktop.dto.ShortCutDto")]
	public class ShortCutVo
	{
		public var webUiResource:WebUIResourceVo;
	    public var position:String;
	    public var empId:String;
	    public function get x():int
	    {
	    	if (position==null) return 0;
	    	var dotPos:int=this.position.indexOf(",");
	    	var xStr:String=this.position.substring(0,dotPos);
	    	try
	    	{
	    	   var result:int= parseInt(xStr) ;  
	    	}
	    	catch(e:Error)
	    	{
	    		result=0;
	    	}
	    	return result;	
	    }
	    public function get y():int
	    {
	        if (position==null) return 0;
	    	var dotPos:int=this.position.indexOf(",");
	    	var yStr:String=this.position.substring(dotPos+1,this.position.length);
	    	try
	    	{
	    	   var result:int= parseInt(yStr) ;  
	    	}
	    	catch(e:Error)
	    	{
	    		result=0;
	    	}
	    	return result;
	    }
	}
}