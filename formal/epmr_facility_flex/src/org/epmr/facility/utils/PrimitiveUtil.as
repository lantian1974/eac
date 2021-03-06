package org.epmr.facility.utils
{
	import org.epmr.utils.collection.ICollection;
	import org.epmr.utils.reflect.Reflection;
	import org.epmr.facility.revisable.IRevisableList;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.XMLListCollection;
	import mx.utils.ObjectUtil;
	
	public class PrimitiveUtil
	{
		public static function equals(a:Object,b:Object):Boolean{
			if (a == null && b == null)
            	return true;
    
	        if (a == null || b==null)
	            return false;
	        
	        if(a===b) return true;
	           
	        var typeOfA:String = typeof(a);
	        var typeOfB:String = typeof(b);
			
	        if (typeOfA == typeOfB)
	        {
	            switch(typeOfA)
	            {
	                case "boolean":
	                {
	                    return ObjectUtil.numericCompare(Number(a), Number(b))==0;
	                }
	                case "number":
	                {
	                    return ObjectUtil.numericCompare(a as Number, b as Number)==0;
	                }
	                case "string":
	                {
	                    return ObjectUtil.stringCompare(a as String, b as String)==0;
	                }
	                case "object":
	                {
	                	if((a is Date) && (b is Date))
	                		return ObjectUtil.dateCompare(a as Date,b as Date)==0;	                	
	                }
	            }
	        }
	        return a==b;  
		} 
		
		public static function dump(source:Object,target:Object):Object{
			if(source && target){
				var type:String=typeof(target);
				if(type=="number" || type=="string" || type=="boolean")
					throw new Error("target can not be primitive type");
				if(target is Array){
					var data:Array=toArray(source);
					for each(var item:* in source){
						target.push(item);
					}
				}	
				else if(target is ArrayCollection){
					ArrayCollection(target).source=toArray(source);
				}
				else if(target is XMLListCollection){
					XMLListCollection(target).source=XMLList(source);
				}
				else if(target is IRevisableList){
					IRevisableList(target).collection=source;
				}	
				else{
					var fields:Array=Reflection.getProperties(target,false);
					for(var field:* in fields){
						if(field in source)
							target[field]=source[field];
					}
				}
			}
			return target;
		}
		
		public static function toArray(data:Object):Array{
			var source:Array=null;
			if(data==null)
				source=[];
			else if(data is Array)
				source=data as Array;
			else if(data is ArrayCollection)
				source=(data as ArrayCollection).source;
			else if(data is IList)
				source=(data as IList).toArray();
			else if(data is ICollection)
				source=(data as ICollection).toArray();	
			else
				source=[data];
			return source;			
		}
		
		
	}
}