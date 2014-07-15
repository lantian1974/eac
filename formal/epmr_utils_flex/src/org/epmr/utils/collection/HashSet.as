package org.epmr.utils.collection
{
	import flash.utils.Dictionary;
	
	public class HashSet implements ISet
	{
		internal static const KEYS:uint=1;
		internal static const VALUES:uint=2;
		internal static const PAIRS:uint=3;
		private var _dic:Dictionary;
		private var _size:uint;
		public function HashSet(){
			reset();
		}
		private function reset():void{
			_dic=new Dictionary();
			_size=0;
		}
		public function write(target:Array):Array
		{
			for(var item:* in _dic)
				target.push(item);
			return target;
		}
		public function read(source:Array):void{
			if(source){
				for each(var item:* in source){
					add(item);
				}
			}	
		}
		
		internal function readMap(source:Object,what:uint):void{
			if(source){
				if(source is IMap){
					IMap(source).enumerate(function(key:*,value:*,counter:uint):Boolean{
						var item:*=null;
						switch(what){
							case KEYS:
								item=key;
								break;
							case VALUES:
								item=value;
								break;
							default:
								item=new MapEntry(key,value);		
						}
						add(item);
						return true;
					});
				}
				else{
					for(var key:* in source){
						var item:*=null;
						switch(what){
							case KEYS:
								item=key;
								break;
							case VALUES:
								item=source[key];
								break;
							default:
								item=new MapEntry(key,source[key]);		
						}
						add(item);
					}
				}	
			}
		}
		public function iterator():Iterator
		{
			return new ItemIterator(toArray(),this);
		}
		
		public function add(item:*):Boolean
		{
			if(item && contains(item)==false){ 
				_dic[item]=true;
				_size++;
				return true;
			}
			return false;
		}
		
		public function addAll(items:ICollection):void
		{
			if(items){
				items.enumerate(function(item:*,counter:uint):Boolean{
					add(item);
					return true;
				});
			}
		}
		
		public function remove(item:*):Boolean
		{
			if(contains(item)){
				delete _dic[item];
				_size--;
				return true;
			}
			return false;	
		}
		
		public function contains(item:*):Boolean
		{
			return item in _dic;
		}
		
		public function clear():void
		{
			reset();
		}
		
		public function get size():uint
		{
			return _size;
		}
		
		public function toArray():Array
		{
			var result:Array=new Array();
			for(var item:* in _dic){
				result.push(item);
			}
			return result;
		}
		
		
		public function enumerate(callback:Function,thisObject:*=null):void{
			var i:uint=0;
			for(var item:* in _dic){
				if(callback.call(thisObject,item,i++)==false)
					break;
			}
		}
		public function toString():String{
			return Arrays.arrayToString(toArray()); 
		}
	}
}

import org.epmr.utils.collection.HashSet;
import org.epmr.utils.collection.ArrayIterator;
	
class ItemIterator extends ArrayIterator{
	private var _target:HashSet;
	private var _useKey:Boolean;
	public function ItemIterator(_items:Array,target:HashSet){
		super(_items);
		_target=target;
	}
	
	override protected function removeItemAt(index:int):*{
		var result:*=super.removeItemAt(index);
		_target.remove(result);	
		return result;
	}
}
