package org.epmr.utils.collection
{
	public class IndexBasedIterator implements Iterator
	{
		private var _index:int;
	  	private var _lock:int;
	  	private var _current:int;
      	public function IndexBasedIterator() {
	         _index = -1; 
	         _lock=-1;   
	         _current=-1;      
	    }
		
		protected function get length():uint{
			return 0;
		}
		protected function getItemAt(index:int):*{
			return undefined;
		}
		protected function removeItemAt(index:int):*{
			return undefined;
		}
	    public function hasNext():Boolean {
	    	
	    	var size:uint=length;
	    	if(_lock==-1) _lock=length;//记录第一次访问时的长度
	      	if(_lock!=size)
	      		throw new Error("concurrent error,source modified!");//
	         return _index < size-1;
	    }
	
	    public function next():* {
	      	if(!hasNext()) 
	      		throw new Error("no such element!");
	      	_current=++_index;
	        return getItemAt(_current);
	    }
			
		public function remove():*{
		  	if(_current<0) 
		  		throw new Error("no active element,call next() please!");
		  	var result:*=removeItemAt(_current);
		  	_index--;
		  	_lock--;
		  	_current=-1;//活动元素已被消费
		  	return result;
		}	
		
	}
}