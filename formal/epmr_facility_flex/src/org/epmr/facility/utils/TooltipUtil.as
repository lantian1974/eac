package org.epmr.facility.utils
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.IToolTip;
	import mx.managers.ToolTipManager;
	import mx.styles.IStyleClient;
	
	public class TooltipUtil
	{
		public static const BELOW:String="errorTipBelow";
		public static const RIGHT:String="errorTipRight";
		public static const ABOVE:String="errorTipAbove"; 
		
		public static function notify(message:String,target:DisplayObject,borderStyle:String=BELOW,styleName:String=null,autoHide:Boolean=true):IToolTip{
        	var _tooltip:IToolTip;
        	var w:Number=target.width;
        	var h:Number=target.height;
        	if("errorTipBelow"==borderStyle){
        		w=0;
        	}
        	else if("errorTipRight"==borderStyle){
        		h=0;
        	}
        	else if("errorTipAbove"==borderStyle){
        		w=0;
        		h=0;
        	}
        	var p:Point=target.localToGlobal(new Point(w,h));
			_tooltip=ToolTipManager.createToolTip(message,p.x,p.y,borderStyle);	
			if(styleName && _tooltip is IStyleClient){
				IStyleClient(_tooltip).setStyle("styleName",styleName);
			}
			if("errorTipAbove"==borderStyle){
        		_tooltip.y-=_tooltip.height;
        	}
			if(autoHide){
				var func:Function=function(event:Event):void{
					target.removeEventListener(Event.REMOVED_FROM_STAGE,func);
					target.stage.removeEventListener(MouseEvent.MOUSE_DOWN,func,true);
					target.stage.removeEventListener(KeyboardEvent.KEY_DOWN,func,true);				
					ToolTipManager.destroyToolTip(_tooltip);
				}
				target.addEventListener(Event.REMOVED_FROM_STAGE,func);
				target.stage.addEventListener(MouseEvent.MOUSE_DOWN,func,true);
				target.stage.addEventListener(KeyboardEvent.KEY_DOWN,func,true);
			}
			return _tooltip;				
        }

	}
}