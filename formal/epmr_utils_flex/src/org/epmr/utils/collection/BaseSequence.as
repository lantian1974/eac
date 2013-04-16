package org.epmr.utils.collection
{
	import org.epmr.utils.reflect.Method;
	
	internal class BaseSequence implements ISequence
	{
		protected var _array:Array;
		private var _capacity:int;
		
		public function BaseSequence(_capacity:int=-1){
			_array=new Array();
			this._capacity=_capacity;
		}
		
		protected function adjustWhenFull():Boolean{
			return false;
		}
		public function push(item:*):void 
		{
			if(isFull() && !adjustWhenFull())//队列已满
				return ;
			_array.push(item);	
		}
		
		public function pop():*
		{
			Method.unfulfilled();
			return null;
		}
		
		public function peek():*
		{
			Method.unfulfilled();
			return null;
		}
		public function contains(item:*):Boolean{
			return _array.indexOf(item)!=-1;
		}
		public function get capacity():int{
			return _capacity;
		}
		public function isEmpty():Boolean{
			return _array.length==0;
		}
		public function isFull():Boolean{
			return _capacity!=-1 && _array.length>=_capacity;
		}
		public function clear():void
		{
			_array=new Array();
		}
		
		public function get size():uint
		{
			return _array.length;
		}
		public function toArray():Array{
			return _array.concat();
		}
		
		public function toString():String{
			return Arrays.arrayToString(_array); 
		}
	}
}