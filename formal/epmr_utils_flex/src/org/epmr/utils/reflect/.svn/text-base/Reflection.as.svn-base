package org.epmr.utils.reflect
{
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.utils.ObjectUtil;
	
	public class Reflection
	{
		public static function hasDefinition(type:String):Boolean{
			return ApplicationDomain.currentDomain.hasDefinition(type);
		}
		
		public static function getClass(obj:Object):Class{
			if(obj==null) return null;
			if(obj is String){
				if(hasDefinition(String(obj)))
					return flash.utils.getDefinitionByName(String(obj)) as Class;
			}
			else if(obj is Class)
				return obj as Class;
			else {
				var className:String=flash.utils.getQualifiedClassName(obj);
				return flash.utils.getDefinitionByName(className)  as Class;
			}	
			return null;	
		}
		public static function isDynamicClass(obj:Object):Boolean{
			var reflect:XML=flash.utils.describeType(obj);
			var result:String=reflect.@isDynamic;
			return result=="true";
		}
		public static function getProperties(obj:Object,includeReadOnly:Boolean=true,excludes:Array=null):Array
		{
			var info:Object =ObjectUtil.getClassInfo(obj,excludes,{includeReadOnly:includeReadOnly});
			return info.properties; 
		}
	}
}