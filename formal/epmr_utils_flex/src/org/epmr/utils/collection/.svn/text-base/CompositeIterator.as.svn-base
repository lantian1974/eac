package org.epmr.utils.collection
{
	public class CompositeIterator implements Iterator
	{
		private var _iterators:Array;
		private var _index:int;
		public function CompositeIterator(iterators:Array){
			_iterators=iterators;
			_index=0;
		}
		public function next():*
		{
			return active.next();
		}
		
		public function hasNext():Boolean
		{			
			if(active.hasNext()) return true;
			_index++;
			return active.hasNext();
		}
		
		public function remove():*{
			return active.remove();
		}
		
		private function get active():Iterator{
			if(_iterators.length==0 || _index>=_iterators.length) return Collections.emptyCollection().iterator();
			return _iterators[_index];
		}
		
	}
}