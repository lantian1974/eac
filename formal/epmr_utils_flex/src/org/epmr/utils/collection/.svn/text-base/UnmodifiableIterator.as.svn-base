package org.epmr.utils.collection
{
	public class UnmodifiableIterator implements Iterator
	{
		private var _iterator:Iterator;
		public function UnmodifiableIterator(iterator:Iterator)
		{
			_iterator=iterator;
		}

		public function next():*
		{
			return _iterator.next();
		}
		
		public function hasNext():Boolean
		{
			return _iterator.hasNext();
		}
		
		public function remove():*
		{
			throw new Error("this iterator is unmodifiable!");
			return null;
		}
		
	}
}