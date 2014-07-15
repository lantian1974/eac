package org.epmr.utils.collection
{
	internal class UnmodifiableSet implements ISet
	{
		private var _set:ISet;
		
		public function UnmodifiableSet(_set:ISet){
			this._set=_set;
		}
		public function iterator():Iterator
		{
			return new UnmodifiableIterator(_set.iterator());
		}
		private function check():void{
			throw new Error("this set is unmodifiable!");
		}
		public function add(item:*):Boolean
		{
			check();
			return false;
		}
		
		public function addAll(items:ICollection):void
		{
			check();
		}
		
		public function remove(item:*):Boolean
		{
			check();
			return false;
		}
		
		public function contains(item:*):Boolean
		{
			return _set.contains(item);
		}
		
		public function clear():void
		{
			check();
		}
		
		public function get size():uint
		{
			return _set.size;
		}
		
		public function toArray():Array
		{
			return _set.toArray();
		}
		
		public function write(target:Array):Array
		{
			return _set.write(target);
		}
		
		public function read(source:Array):void{
			check();
		}
		public function enumerate(callback:Function,thisObject:*=null):void{
			_set.enumerate(callback,thisObject);
		}
		public function toString():String{
			return _set.toString();
		}
	}
}