package org.epmr.utils.reflect
{
	import flash.errors.IllegalOperationError;
	
	public class Method
	{
		public static function unfulfilled(name:String=""):void{
			throw new IllegalOperationError("the method "+name+" is unfulfilled,maybe it's a abstract method or a unsupportted operation!");
		}
		public static function delegate(fun:Function,...args):Function{
			var result:Function=function(...rest):void{
				fun.apply(null,rest.concat(args));
			}
			return result;
		}
	}
}