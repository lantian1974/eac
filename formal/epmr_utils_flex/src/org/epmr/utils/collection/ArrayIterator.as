package org.epmr.utils.collection
{
	 public class ArrayIterator extends IndexBasedIterator implements Iterator {
      
      private var _collection:Array;
      public function ArrayIterator(collection:Array) {
         _collection = collection;
      }
      
	  override protected function get length():uint{
			return _collection.length;
	  }
	  
	  override protected function getItemAt(index:int):*{
			return _collection[index];
	  }
	  
	  override protected function removeItemAt(index:int):*{
			var result:*=_collection[index];
			_collection.splice(index,1);
			return result;
	  }		
   }

}