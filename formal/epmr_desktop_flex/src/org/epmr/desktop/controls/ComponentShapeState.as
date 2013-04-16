package org.epmr.desktop.controls
{
	import org.epmr.utils.collection.HashMap;
	import org.epmr.utils.collection.IMap;
	
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	public class ComponentShapeState
	{
		private var _position:Point;
		private var _height:int;
		private var _width:int;
//		private static var _map:IMap=new HashMap();
//		public static function getComponentShapeState(component:UIComponent):ComponentShapeState
//		{
//		    var position:Point=new Point(component.x,component.y); 
//			var result:ComponentShapeState;
//			if(_map.containsKey(component)){
//				result=_map.find(component) as ComponentShapeState;
//				result._position=position;
//				result._height=component.height;
//				result._width=component.width;	
//			}
//			else
//				result=new ComponentShapeState(position,component.height,component.width);
//			_map.put(component,result);
//			return result;
//		}
		public static function getComponentShapeState(component:UIComponent):ComponentShapeState
		{
		    var position:Point=new Point(component.x,component.y); 
		    return new ComponentShapeState(position,component.height,component.width);
		}
		public function ComponentShapeState(position:Point,height:int,width:int)
		{
			this._position=position;
			this._height=height;
			this._width=width;
		}
		public function get position():Point
		{
		    return this._position.clone();
		}
		public function  get height():int
		{
		   return this._height;
		}
		public function get width():int
		{
		   return this._width;
		}
     
	}
}