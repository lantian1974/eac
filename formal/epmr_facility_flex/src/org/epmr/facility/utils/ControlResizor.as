package org.epmr.facility.utils
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	
	public class ControlResizor extends EventDispatcher
	{
		
		[Embed(source="resources/resizeCursorH.gif")]
		private var resizeCursorH:Class;
		[Embed(source="resources/resizeCursorTLBR.gif")]
		private var resizeCursorTLBR:Class;
		[Embed(source="resources/resizeCursorTRBL.gif")]
		private var resizeCursorTRBL:Class;
		[Embed(source="resources/resizeCursorV.gif")]
		private var resizeCursorV:Class;
		
		public static const POSTION_INNER:Number=0;
		public static const POSTION_TOP:Number=1;
		public static const POSTION_BOTTOM:Number=2;
		public static const POSTION_LEFT:Number=3;
		public static const POSTION_RIGHT:Number=4;
		public static const POSTION_TOPLEFT:Number=5;
		public static const POSTION_TOPRIGHT:Number=6;
		public static const POSTION_BOTTOMLEFT:Number=7;
		public static const POSTION_BOTTOMRIGHT:Number=8
		private var _control:UIComponent;
		private var _cursorSenseDistance:Number=3;
		private var _resizeMode:Boolean=false;
		private var _originalMousePostion:Point;
		private var _originalControlRec:Rectangle;
		private var _resizing:Boolean=false;
		private var _refuseResizePistions:Array=null;
		public function ControlResizor(control:UIComponent,cursorSenseDistance:Number=3,refuseResizePostions:Array=null) 
		{
			this._control=control;
			this._cursorSenseDistance=cursorSenseDistance;
			if (refuseResizePostions!=null)
			{
				this._refuseResizePistions=refuseResizePostions;
			}
			else
			{
				this._refuseResizePistions=new Array();
			}
		}
		public function makeControlResizable():void
		{
			if (this._control.parent==null)
			{
				throw new Error("can not make control resizable,because it has no parent");
			}
			this._originalControlRec=new Rectangle();
			this._originalMousePostion=new Point
			this._control.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
			this._control.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
			this._control.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
			this._control.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
			this._control.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
			
		}
		public function makeControlDisresizable():void
		{
			this._originalControlRec=null;
			this._originalMousePostion=null;
			this._control.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
			this._control.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
			this._control.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
			this._control.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
			this._control.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
		}
		private function saveWindow():void
		{
			this._originalControlRec.x=this._control.x;
			this._originalControlRec.y=this._control.y;
			this._originalControlRec.height=this._control.height;
			this._originalControlRec.width=this._control.width;
		}
		private function doOnEnterFrame(event:Event):void
		{
			this.updateControlSize();
		}
		private function onMouseOver(event:MouseEvent):void
		{
			if (this._resizeMode) return;
			var cursorPostion:Number=this.getCusorPostion(event.localX,event.localY);
			var cursorIcon:Class=this.getCusorIcon(cursorPostion);
			if (cursorIcon!=null)
			{
				CursorManager.setCursor(cursorIcon,2,-10,-10);
				
			}
			else
			{
				CursorManager.removeAllCursors();
			}
		}
		private function onMouseOut(event:MouseEvent):void
		{
			
			if (!_resizeMode)
			{
				CursorManager.removeAllCursors();
			}
			
		}
		private var currentCursorPosition:Number=POSTION_INNER;
		private function onMouseDown(event:MouseEvent):void
		{
			this.currentCursorPosition=this.getCusorPostion(event.localX,event.localY);
			this.saveWindow();
			if (this.currentCursorPosition!=POSTION_INNER)
			{
				this._resizeMode=true;
				this._originalMousePostion.x=this._control.parent.mouseX;
				this._originalMousePostion.y=this._control.parent.mouseY;
				this._control.parent.addEventListener(Event.ENTER_FRAME,  doOnEnterFrame);
			}
		}
		private function onMouseMove(event:MouseEvent):void
		{
			if (this._resizeMode) return;
			this.currentCursorPosition=this.getCusorPostion(event.localX,event.localY);
			if (currentCursorPosition==POSTION_INNER)
			{
				CursorManager.removeAllCursors();
			}
		}
		private function onMouseUp(event:MouseEvent):void
		{
			if (this._resizeMode)
			{
				this._resizeMode=false;
				CursorManager.removeAllCursors();
				this._control.parent.removeEventListener(Event.ENTER_FRAME,doOnEnterFrame);
			}
		}
		private function onMouseMoveApp(event:MouseEvent):void
		{
			if (this._resizing==false)
			{
				this._resizing=true;
				this._control.dispatchEvent(new Event("beginResize"));
			}
			else
			{
				this._control.dispatchEvent(new Event("_resizing"));
			}
			
		}
		private function updateControlSize():void
		{
			if (!this._resizeMode) return;
			var detaY:Number=this._control.parent.mouseY-this._originalMousePostion.y;
			var detaX:Number=this._control.parent.mouseX-this._originalMousePostion.x;;
			switch(this.currentCursorPosition)
			{
				case POSTION_TOP:
					this._control.height=Math.max(this._originalControlRec.height-detaY,this._control.minHeight);
					this._control.y=Math.min(this._originalControlRec.y+detaY,this._originalControlRec.height+this._originalControlRec.y-this._control.minHeight);
					break;
				case POSTION_BOTTOM:
					this._control.height=Math.max(this._originalControlRec.height+detaY,this._control.minHeight);
					break;
				case POSTION_LEFT:
					this._control.width=Math.max(this._originalControlRec.width-detaX,this._control.minWidth);
					this._control.x=Math.min(this._originalControlRec.x+detaX,this._originalControlRec.width+this._originalControlRec.x-this._control.minWidth);
					break;
				case POSTION_RIGHT:
					this._control.width=Math.max(this._originalControlRec.width+detaX,this._control.minWidth);
					break;
				case POSTION_TOPLEFT:
					this._control.height=Math.max(this._originalControlRec.height-detaY,this._control.minHeight);
					this._control.y=Math.min(this._originalControlRec.y+detaY,this._originalControlRec.height+this._originalControlRec.y-this._control.minHeight);
					this._control.width=Math.max(this._originalControlRec.width-detaX,this._control.minWidth);
					this._control.x=Math.min(this._originalControlRec.x+detaX,this._originalControlRec.width+this._originalControlRec.x-this._control.minWidth);
					break;
				case POSTION_TOPRIGHT:
					this._control.height=Math.max(this._originalControlRec.height-detaY,this._control.minHeight);
					this._control.y=Math.min(this._originalControlRec.y+detaY,this._originalControlRec.height+this._originalControlRec.y-this._control.minHeight);
					this._control.width=Math.max(this._originalControlRec.width+detaX,this._control.minWidth);
					break;
				case POSTION_BOTTOMLEFT:
					this._control.height=Math.max(this._originalControlRec.height+detaY,this._control.minHeight);
					this._control.width=Math.max(this._originalControlRec.width-detaX,this._control.minWidth);
					this._control.x=Math.min(this._originalControlRec.x+detaX,this._originalControlRec.width+this._originalControlRec.x-this._control.minWidth);
					break;
				case POSTION_BOTTOMRIGHT:
					this._control.height=Math.max(this._originalControlRec.height+detaY,this._control.minHeight);
					this._control.width=Math.max(this._originalControlRec.width+detaX,this._control.minWidth);
					break;
			}
		}
		
		private function getCusorIcon(cursorPostion:Number):Class
		{
			if ((cursorPostion==POSTION_TOP)||
				(cursorPostion==POSTION_BOTTOM))
				return this.resizeCursorV;
			if ((cursorPostion==POSTION_LEFT)||
				(cursorPostion==POSTION_RIGHT))
				return this.resizeCursorH;
			if ((cursorPostion==POSTION_TOPRIGHT)||
				(cursorPostion==POSTION_BOTTOMLEFT))
				return this.resizeCursorTRBL
			if ((cursorPostion==POSTION_TOPLEFT)||
				(cursorPostion==POSTION_BOTTOMRIGHT))
				return this.resizeCursorTLBR;
			return null;   
		}
		private function getCusorPostion(cursorX:Number,cursorY:Number):Number
		{
			if ((cursorX<=_cursorSenseDistance)&&(cursorY<=_cursorSenseDistance)&&(this._refuseResizePistions.indexOf(POSTION_TOPLEFT)<0))
				return POSTION_TOPLEFT;
			if((cursorX<=_cursorSenseDistance)&&(cursorY>=(this._control.height-_cursorSenseDistance))&&(this._refuseResizePistions.indexOf(POSTION_BOTTOMLEFT)<0))
				return POSTION_BOTTOMLEFT;
			if((cursorX>=(this._control.width-_cursorSenseDistance))&&(cursorY<=_cursorSenseDistance)&&(this._refuseResizePistions.indexOf(POSTION_TOPRIGHT)<0))
				return  POSTION_TOPRIGHT;
			if((cursorX>=(this._control.width-_cursorSenseDistance))&&(cursorY>=(this._control.height-_cursorSenseDistance))&&(this._refuseResizePistions.indexOf(POSTION_BOTTOMRIGHT)<0))
				return  POSTION_BOTTOMRIGHT;
			if((cursorX<_cursorSenseDistance)&&(cursorY>_cursorSenseDistance)&&(cursorY<(this._control.height-_cursorSenseDistance))&&(this._refuseResizePistions.indexOf(POSTION_LEFT)<0))
				return  POSTION_LEFT;
			if((cursorX>_cursorSenseDistance)&&(cursorX<(this._control.width-_cursorSenseDistance))&&(cursorY>(this._control.height-_cursorSenseDistance))&&(this._refuseResizePistions.indexOf(POSTION_BOTTOM)<0))
				return POSTION_BOTTOM;
			if((cursorX>(this._control.width-_cursorSenseDistance))&&(cursorY>_cursorSenseDistance)&&(cursorY<(this._control.height-_cursorSenseDistance))&&(this._refuseResizePistions.indexOf(POSTION_RIGHT)<0))
				return POSTION_RIGHT;
			if((cursorX>_cursorSenseDistance)&&(cursorX<(this._control.width-_cursorSenseDistance))&&(cursorY<_cursorSenseDistance)&&(this._refuseResizePistions.indexOf(POSTION_TOP)<0))
				return POSTION_TOP;
			return  POSTION_INNER;
		}
	}
}