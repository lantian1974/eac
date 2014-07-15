package org.epmr.utils.reflect
{
	public class Field
	{
		public function Field()
		{
		}
		
		public static function goExtreme(site:Object,chain:String):Object{
			var result:Object=new Object();
			result.site=site;
			result.field=chain;
			var end:int=chain.indexOf(".",0);
			while(end>=0){
				var field:String=chain.substring(0,end);
				var rest:String=chain.substr(end+1);
				if(field in site){
					result.site=site[field];
					result.field=rest;
					break;
				}
				end=rest.indexOf(".",0);
			}
			return result;
		}
		
		public static function setProperty(site:Object,chain:String,value:Object):void{
			var tmp:Object=goExtreme(site,chain);
			tmp.site[tmp.field]=value;
		}
		public static function getProperty(site:Object,chain:String):Object{
			var tmp:Object=goExtreme(site,chain);
			return tmp.site[tmp.field];
		}
	}
}