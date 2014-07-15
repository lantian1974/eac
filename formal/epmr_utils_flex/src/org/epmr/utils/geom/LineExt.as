package org.epmr.utils.geom
{
	import flash.geom.Point;
	
	public class LineExt
	{
		public static function overlay(a:Point,b:Point,p:Point,tolerance:uint=2):Boolean{
//			var result:Boolean=false;
//			if(tolerance==0){//精确地在直线上
//				if(p1.x==p2.x && p.x==p1.x){//直线为竖直
//						if((p1.y>=p2.y && p.y<=p1.y && p.y>=p2.y) ||
//							(p1.y<p2.y && p.y<=p2.y && p.y>=p1.y))
//							result=true;
//				}
//				else if(p1.y==p2.y && p.y==p1.y){//直线为平行
//					if((p1.x>=p2.x && p.x<=p1.x && p.x>=p2.x) ||
//						(p1.x<p2.x && p.x<=p2.x && p.x>=p1.x))
//						result=true;
//				}
//				else{//直线为斜线
//					result=(p2.y-p1.y)/(p2.x-p1.x)==(p.y-p1.y)/(p.x-p1.x);
//				}
//			}
//			else{
//				//先把线段两端各延长tolerance
//				var p11:Point=new Point();
//			}
//			return result;	
			var dist:Number=distance(a,b,p);
			trace(dist);
			return dist<=tolerance;
		}
		public static function distance(a:Point,b:Point,p:Point):Number{
			var length:Number;/* 线段ab的长度 */ 
			var r:Number;
			var s:Number;
			length=Point.distance(a,b);
			if(length==0)/* 线段退化成一个点 */   
				return Point.distance(a,p);
			r=((a.y-p.y)*(a.y-b.y)-(a.x-p.x)*(b.x-a.x))/(length*length);
			if(r>1)	/* 点p垂直投影在线段AB的前方*/   
				return Point.distance(p,b);//Math.min(Point.distance(p,b),Point.distance(p,a));
			if(r<0) /* 点p垂直投影在线段AB的后方 */  
				return Point.distance(p,a);//Math.min(Point.distance(p,b),Point.distance(p,a));
			s=((a.y-p.y)*(b.x-a.x)-(a.x-p.x)*(b.y-a.y))/(length);
			return Math.abs(s);	
		}
		
		public static function intersection(a:Point, b:Point, c:Point, d:Point):Point {
			var f1:Number = -(b.y-a.y)/(b.x-a.x);//斜率
			var f2:Number = -(d.y-c.y)/(d.x-c.x);
			var result:Point=new Point();
			
			if (f1 == f2) {//两线段平行
				return null;
			} 
			else if ((f1 == Infinity || f1 == -Infinity) && 
					(f2 != Infinity || f2 != -Infinity)) {
				result.x=a.x;
				result.y=d.y+f2*(d.x-a.x);
			} 
			else if ((f2 == Infinity || f2 == -Infinity) && 
					(f1 != Infinity || f1 != -Infinity)) {
				result.x=c.x;
				result.y=b.y+f1*(b.x-c.x);
			}
			else{
				result.x = -((d.y+d.x*f2)-(b.y+b.x*f1))/(f1-f2);
				result.y = (f2*(b.y+b.x*f1)-f1*(d.y+d.x*f2))/(f2-f1);
			}
			return result;
		}
	}
}