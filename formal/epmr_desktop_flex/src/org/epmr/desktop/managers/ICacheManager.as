package org.epmr.desktop.managers
{
	import org.epmr.utils.collection.ISet;
	
	public interface ICacheManager
	{
		function find(key:Object):Object;
		
		function containsKey(key:Object):Boolean;
		
		function put(key:Object,value:Object):Object;
		
		function get size():uint;
		
		function remove(key:Object):Object;
		
		function clear():void;
		
		function keySet():ISet;
	}
}