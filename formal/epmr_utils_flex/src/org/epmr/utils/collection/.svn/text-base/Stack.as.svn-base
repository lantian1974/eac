package org.epmr.utils.collection
{
	public class Stack extends BaseSequence
	{
		public function Stack(_capacity:int=-1){
			super(_capacity);
		}
		override protected function adjustWhenFull():Boolean{
			_array.shift();//移除队列的首元素
			return true;
		}
		
		override public function pop():*
		{
			if(isEmpty())
				return undefined;
			return _array.pop();
		}
		
		override public function peek():*
		{
			if(isEmpty())
				return undefined;
			return _array[_array.length-1];
		}
		
		
	}
}