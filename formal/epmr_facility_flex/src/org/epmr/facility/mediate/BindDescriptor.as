package org.epmr.facility.mediate
{
	import flash.utils.getQualifiedClassName;
	
	import mx.utils.ObjectUtil;
	
	public class BindDescriptor
	{
		private var _map:Object;
		private var _list:Array;
		public function BindDescriptor(mappings:Object){
			_map=new Object();
			for(var field:String in mappings){
				var bridge:IUIBridge=mappings[field] as IUIBridge;
				if(bridge)
					_map[field]=bridge;
			}
		}
		
		public function getBridge(name:String):IUIBridge{
			return _map[name];
		}
		public function contains(name:String):Boolean{
			return name in _map;
		}
		public function get names():Array{
			if(_list==null){
				_list=new Array();
				for(var name:* in _map){
					_list.push(name);
				}
			}
			return _list;
		}
//		public static function create(target:Object,excludes:Array=null):PropertyDescriptor{
//			var fields:Array=new Array();
//			if(target!=null) {
//				if (getQualifiedClassName(target) == "Object"){
//					 for(var field:* in target){
//	                	if(excludes!=null && excludes.indexOf(field)!=-1)	
//	                		fields.push(field);
//	     			}	
//				}
//				else{
//					fields=getFields(target,excludes);
//				}	
//			}
//			return new PropertyDescriptor(fields);
//		}
//		public static function getFields(obj:Object,excludes:Array=null,
//	    								includeReadonly:Boolean=true,
//	    								includeTransient:Boolean=true):Array{
//	    
//	    	return ObjectUtil.getClassInfo(obj, excludes, {includeReadOnly:includeReadonly,includeTransient:includeTransient}).properties;									
//	    }
	}
}