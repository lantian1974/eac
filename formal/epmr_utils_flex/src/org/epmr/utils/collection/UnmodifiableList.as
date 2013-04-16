package org.epmr.utils.collection
{
	internal class UnmodifiableList extends AbstractList implements IList
	{
		private var _list:IList;
		
		public function UnmodifiableList(list:IList){
			this._list=list;
		}
		override public function iterator():Iterator
		{
			return new UnmodifiableIterator(_list.iterator());
		}
		private function check():void{
			throw new Error("this list is unmodifiable!");
		}
		override public function addItem(index:int, item:*):void
		{
			check();
		}
		
		override public function add(item:*):Boolean
		{
			check();
			return false;
		}
		
		override public function addItems(index:int, items:ICollection):void
		{
			check();
		}
		
		override public function addAll(items:ICollection):void
		{
			check();
		}
		
		override public function remove(item:*):Boolean
		{
			check();
			return false;
		}
		
		override public function indexOf(item:*):int
		{
			return _list.indexOf(item);
		}
		
		override public function contains(item:*):Boolean
		{
			return _list.contains(item);
		}
		
		override public function lastIndexOf(item:*):int
		{
			return _list.lastIndexOf(item);
		}
		
		override public function clear():void
		{
			check();
		}
		
		override public function setItem(index:int, item:*):*
		{
			check();
			return null;
		}
		
		override public function get size():uint
		{
			return _list.size;
		}
		
		override public function getItem(index:int):*
		{
			return _list.getItem(index);
		}
		
		override public function toArray():Array
		{
			return _list.toArray();
		}
		
		override public function removeItem(index:int):*
		{
			check();
			return null;
		}
		
		override public function read(source:Array):void{
			check();
		}
		
		override public function subList(fromIndex:int, toIndex:int):IList
		{
			return _list.subList(fromIndex,toIndex);
		}
		override public function enumerate(callback:Function,thisObject:*=null):void{
			_list.enumerate(callback,thisObject);
		}
		override public function toString():String{
			return _list.toString();
		}
		
	}
}