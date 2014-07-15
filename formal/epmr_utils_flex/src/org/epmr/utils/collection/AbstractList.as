package org.epmr.utils.collection
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	use namespace flash_proxy
	public class AbstractList extends Proxy implements IList
	{
		public function iterator():Iterator
		{
			return null;
		}
		
		public function addItem(index:int, item:*):void
		{
		}
		
		public function add(item:*):Boolean
		{
			return false;
		}
		
		public function addItems(index:int, items:ICollection):void
		{
		}
		
		public function addAll(items:ICollection):void
		{
		}
		
		public function indexOf(item:*):int
		{
			return 0;
		}
		
		public function remove(item:*):Boolean
		{
			return false;
		}
		
		public function lastIndexOf(item:*):int
		{
			return 0;
		}
		
		public function contains(item:*):Boolean
		{
			return false;
		}
		
		public function setItem(index:int, item:*):*
		{
			return null;
		}
		
		public function clear():void
		{
		}
		
		public function get size():uint
		{
			return 0;
		}
		
		public function getItem(index:int):*
		{
			return null;
		}
		
		public function toArray():Array
		{
			return null;
		}
		
		public function removeItem(index:int):*
		{
			return null;
		}
		
		public function write(target:Array):Array{
			if(target){
				enumerate(function(item:*,counter:uint):Boolean{
					target.push(item);
					return true;
				});
			}
			return target;	
		}
		
		public function read(source:Array):void{
			if(source){
				for each(var item:* in source){
					add(item);
				}
			}	
		}
		
		public function subList(fromIndex:int, toIndex:int):IList
		{
			return null;
		}
		
		public function enumerate(callback:Function, thisObject:*=null):void
		{
		}
		
		public function toString():String
		{
			return null;
		}
		
		//--------------------------------------------------------------------------
	    //
	    // Proxy methods
	    //
	    //--------------------------------------------------------------------------
		private function deduceIndex(name:*):int{
			if (name is QName)
	            name = name.localName;
	
	        var index:int = -1;
	        
	        // If caller passed in a number such as 5.5, it will be floored.
	        try
	        {
		        var n:Number = parseInt(String(name));
		        if (!isNaN(n))
		            index = int(n);
		    }
		    catch(e:Error) // localName was not a number
			{
				trace(e);
			}
			return index;
		}
	    /**
		 *  @private
		 *  Attempts to call getItemAt(), converting the property name into an int.
	     */
	    override flash_proxy function getProperty(name:*):*
	    {
	        var index:int=deduceIndex(name);
	        return this.getItem(index);
	    }
	    
	    /**
		 *  @private
		 *  Attempts to call setItemAt(), converting the property name into an int.
	     */
	    override flash_proxy function setProperty(name:*, value:*):void
	    {
	        var index:int=deduceIndex(name);
	        this.setItem(index,value);
	    }
	    
	    /**
	     *  @private
	     *  This is an internal function.
	     *  The VM will call this method for code like <code>"foo" in bar</code>
	     *  
	     *  @param name The property name that should be tested for existence.
	     */
	    override flash_proxy function hasProperty(name:*):Boolean
	    {
	        var index:int=deduceIndex(name);
	        if (index == -1)
	            return false;
	        return index >= 0 && index < size;
	    }
	
	    /**
	     *  @private
	     */
	    override flash_proxy function nextNameIndex(index:int):int
	    {
	        return index < size ? index + 1 : 0;
	    }
	    
	    /**
	     *  @private
	     */
	    override flash_proxy function nextName(index:int):String
	    {
	        return (index - 1).toString();
	    }
	    
	    /**
	     *  @private
	     */
	    override flash_proxy function nextValue(index:int):*
	    {
	        return getItem(index - 1);
	    }    
	
	    /**
	     *  @private
		 *  Any methods that can't be found on this class shouldn't be called,
		 *  so return null
	     */
	    override flash_proxy function callProperty(name:*, ... rest):*
	    {
	        var r:*=getProperty(name);
	        if(r is Function){
	        	return Function(r).apply(null,rest);
	        }
	        return null;
	    }
		
	}
}