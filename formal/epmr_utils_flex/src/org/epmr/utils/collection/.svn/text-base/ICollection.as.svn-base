package org.epmr.utils.collection
{
	public interface ICollection
	{
		function iterator():Iterator;
		
		function add(item:*):Boolean;
		
		function addAll(items:ICollection):void;
		
		function remove(item:*):Boolean;
		
		function contains(item:*):Boolean;
		
		function clear():void;
		
		function get size():uint;
		
		function toArray():Array;
		
		function write(target:Array):Array;
		
		function read(source:Array):void;
		
		/**
		 * @param callback --形如function(item:*,counter:uint):Boolean的回调函数,如果返回false，则停止枚举
		 * @param thisObject--callback中的this对象
		 * @return void
		 */
		function enumerate(callback:Function,thisObject:*=null):void;
		
		function toString():String;
	}
}