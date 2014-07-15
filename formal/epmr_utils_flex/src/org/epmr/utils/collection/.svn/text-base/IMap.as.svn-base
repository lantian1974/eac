package org.epmr.utils.collection
{
	public interface IMap
	{
		function find(key:*):*;
		
		function put(key:*,value:*):*;
		
		function putAll(map:IMap):void;
		
		function keySet():ISet;
		
		function entrySet():ISet;
		
		function iterator():Iterator;
		
		function values():ICollection;
		
		function remove(key:*):*;
		
		function get size():uint;
		
		function containsKey(key:*):Boolean;
		
		function containsValue(value:*):Boolean;
		
		function clear():void;
		
		/**
		 * @param callback   -- 形如function(key:*,value:*,counter:uint):Boolean的回调函数,如果返回false则停止枚举
		 * @param thisObject -- callback中的this对象
		 * @return void
		 */
		function enumerate(callback:Function,thisObject:*=null):void;
		
		function toString():String;
	}
}