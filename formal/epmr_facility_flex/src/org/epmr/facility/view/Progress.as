package org.epmr.facility.view
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	import mx.controls.ProgressBar;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	import mx.skins.halo.ProgressBarSkin;
	import mx.skins.halo.ProgressIndeterminateSkin;
	import mx.skins.halo.ProgressTrackSkin;
	import spark.components.Application;
	import spark.components.BorderContainer;
	import spark.components.SkinnableContainer;
	

	public class Progress extends EventDispatcher 
	{
		private static const DEFAULT_LABEL:String="请稍侯，正在处理";
		//"modalTransparency":0.0,"modalTransparencyBlur":0
		private static const DEFAULT_STYLE:Object={"fontSize":12};
		private var _control:ProgressBar;
		private var _container:SkinnableContainer;
		private var _parent:DisplayObject;
		private var _label:String;
		private var _modalStyle:Object;
		public function Progress(parent:DisplayObject,modal:Boolean=true,modalStyle:Object=null,label:String=null)
		{
			super();
			_parent=parent?parent:FlexGlobals.topLevelApplication as DisplayObject;
			if(modal){
				_modalStyle=modalStyle?modalStyle:DEFAULT_STYLE;
			}
			else
				_modalStyle==null;
			_label=label?label:DEFAULT_LABEL;
		}
		
		public function start(label:String=null):ProgressBar{
			if(_control==null){
				_container=new  BorderContainer();
				if(_modalStyle){
					for(var name:String in _modalStyle)
						_container.setStyle(name,_modalStyle[name]);
				}
				_control=new ProgressBar();
				//在Flex4下，ProgressBar无法找到缺省的皮肤，必须手工设置，否则就会产生#1007,#1009等错误
				_control.setStyle("maskSkin",mx.skins.halo.ProgressIndeterminateSkin);
				_control.setStyle("trackSkin",mx.skins.halo.ProgressTrackSkin);
				_control.setStyle("barSkin",mx.skins.halo.ProgressBarSkin);
				_control.setStyle("indeterminateSkin",mx.skins.halo.ProgressIndeterminateSkin);
				//-------------------------------------------------------------------------------
				_control.width=306;
				_control.height=32;
				_control.labelPlacement="center";
				_control.indeterminate=true;
				
				_control.minimum=0;
				_control.maximum=100;
				_container.width=306;
				_container.height=32;
				_container.addElement(_control); 
			}
			updateLabel(label?label:DEFAULT_LABEL);
			if(!running)
				PopUpManager.addPopUp(_container,_parent,_modalStyle!=null);
			PopUpManager.centerPopUp(_container);
			PopUpManager.bringToFront(_container);			
			return _control;
		} 
		public function updateLabel(label:String):void{
			_label=label;
			if(_control){
				_control.label=_label;
			}
		}
		public function get running():Boolean{
			return _container && _container.isPopUp;
		}
		public function step(value:Number,total:Number=100):void{
			if(_control)
				_control.setProgress(value,total);
		}
		public function stop():void{
			if(running)
				PopUpManager.removePopUp(_container);
			
		}
	}
}