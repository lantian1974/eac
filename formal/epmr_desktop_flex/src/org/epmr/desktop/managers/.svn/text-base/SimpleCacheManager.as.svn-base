package org.epmr.desktop.managers
{
	import org.epmr.utils.collection.HashMap;
	import org.epmr.utils.collection.IMap;
	import org.epmr.utils.collection.ISet;
	
	public class SimpleCacheManager implements ICacheManager
	{
		private var _pool:IMap;
		public function SimpleCacheManager()
		{
			_pool=new HashMap();
		}
		
		public function find(key:Object):Object{
			return _pool.find(key);
		}
		public function containsKey(key:Object):Boolean{
			return _pool.containsKey(key);
		}
		public function put(key:Object, value:Object):Object
		{
			return _pool.put(key,value);
		}
		
		public function get size():uint
		{
			return _pool.size;
		}
		
		public function remove(key:Object):Object
		{
			return _pool.remove(key);
		}
		
		public function clear():void
		{
			_pool.clear();
		}
		public function keySet():ISet
		{
		   return this._pool.keySet();
		}
	}
}