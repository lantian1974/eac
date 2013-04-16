package org.epmr.utils.geom
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class RectangleExt
	{
		public static function normalize(x1:Number,y1:Number,x2:Number,y2:Number):Rectangle{
			var rect:Rectangle=new Rectangle();
			if(x1<=x2){
				rect.x=x1;
				rect.width=x2-x1;
			}
			else{
				rect.x=x2;
				rect.width=x1-x2;
			}
			if(y1<=y2){
				rect.y=y1;
				rect.height=y2-y1;
			}
			else{
				rect.y=y2;
				rect.height=y1-y2;
			}
			return rect;
		}
		
		public static function equals(rect1:Rectangle,rect2:Rectangle):Boolean{
			return rect1.x==rect2.x && rect1.y==rect2.y && 
					rect1.width==rect2.width && rect1.height==rect2.height;
		}
	}
}