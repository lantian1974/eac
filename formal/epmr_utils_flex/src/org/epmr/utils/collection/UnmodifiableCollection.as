package org.epmr.utils.collection
{
	internal class UnmodifiableCollection implements ICollection
	{
		private var _collection:ICollection;
		
		public function UnmodifiableCollection(collection:ICollection){
			this._collection=collection;
		}
		public function iterator():Iterator
		{
			return _collection.iterator();
		}
		
		private function check():void{
			throw new Error("this collection is unmodifiable!");
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
			return _collection.contains(item);
		}
		
		public function clear():void
		{
			check();
		}
		
		public function get size():uint
		{
			return _collection.size;
		}
		
		public function toArray():Array
		{
			return _collection.toArray();
		}
		
		public function write(target:Array):Array
		{
			return _collection.write(target);
		}
		
		public function read(source:Array):void{
			check();
		}
		public function enumerate(callback:Function,thisObject:*=null):void{
			_collection.enumerate(callback,thisObject);
		}
		public function toString():String{
			return _collection.toString();
		}
	}
}