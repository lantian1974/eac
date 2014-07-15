package org.epmr.utils.reflect
{
	import org.epmr.utils.collection.HashSet;
	import org.epmr.utils.collection.ISet;
	
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	
	public class ClassInfo
	{
		
		public static function create(className:String):Object{
			var clazz:Class=flash.utils.getDefinitionByName(className) as Class;
			return new clazz();
		}
		public static function reflect(target:Object):ClassInfo{
			return new ClassInfo(flash.utils.describeType(target));
		}
		private var clazz:XML; 
		public function ClassInfo(descriptor:XML){
			this.clazz=descriptor;
		}
		
		public function get accessor():ISet{
			var result:ISet=new HashSet();
			for each(var prop:XML in clazz.accessor){
				result.add(prop.@name);
//				var name:String=prop.@name;
//				var value:*=object[name];
			}	
			return result;
		}
	}
}