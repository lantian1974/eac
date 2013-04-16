package org.epmr.utils.geom
{
	import flash.geom.Point;
	
	public class PointExt
	{
		public static function round(point:Point):Point{
			var result:Point=point.clone();
			result.x=Math.round(point.x);
			result.y=Math.round(point.y);
			return result;
		}
		
		public static function leap(point:Point,stepX:uint,stepY:uint):Point{
			var result:Point=point.clone();
			result.x=Math.round(point.x/stepX)*stepX;
			result.y=Math.round(point.y/stepX)*stepX;
			return result;
		} 
		
		public static function multiply(base:Point,multiplier:Point):Point{
			var result:Point=new Point();
			result.x=base.x*multiplier.x;
			result.y=base.y*multiplier.y;
			return result;
		}
	}
}