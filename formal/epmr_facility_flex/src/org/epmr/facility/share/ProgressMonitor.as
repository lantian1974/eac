package org.epmr.facility.share
{
	import flash.display.DisplayObject;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	public class ProgressMonitor implements IProgressMonitor
	{
		private static const DEFAULT_LABEL:String="请稍候，正在处理...";
		private static var delegate:Progress;
		private var _parent:DisplayObject;
		private var _delay:uint;
		private var _label:String;
		
		public function ProgressMonitor(parent:DisplayObject)
		{
			if(parent==null) throw new Error("parent can not be null");
			this._parent=parent;
			if(delegate==null)
				delegate=new Progress();
		}
		
		public function get label():String{
			return _label;
		}
		
		public function set label(value:String):void{
			_label=value;
		} 
		public function get delay():uint{
			return _delay;
		}
		
		public function set delay(value:uint):void{
			_delay=value;
		}
		public function begin(target:Object,cancellable:Boolean=false):IMonitorToken{
			var token:MonitorToken=new MonitorToken(this,target);
			token.label=_label?_label:DEFAULT_LABEL;
			token.parent=_parent;
			token.timer=-1;
			if(_delay>0){
				var timer:uint=setTimeout(startMonitor,_delay,token);
				token.timer=timer;
			}	
			else
				startMonitor(token);
			return token;	
		}
		private function startMonitor(token:IMonitorToken):void{
			var tmp:MonitorToken=(MonitorToken(token));
			delegate.popup(tmp);	
		}
		
		public function update(token:IMonitorToken,minValue:Number,value:Number,maxValue:Number):Boolean{
			if(token){
				var tmp:MonitorToken=(MonitorToken(token));
				tmp.minValue=minValue;
				tmp.value=value;
				tmp.maxValue=maxValue;
				delegate.update(tmp);
			}
			return false;
		}
		
		public function stop(token:IMonitorToken):void{
			if(token){
				var tmp:MonitorToken=(MonitorToken(token));
				if(tmp.timer!=-1){
					clearTimeout(tmp.timer);
				}
				else{
					delegate.close(tmp);
				}
			}
		}
	}
}
	import org.epmr.facility.share.IProgressMonitor;
	import flash.utils.setTimeout;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.utils.clearTimeout;
	import mx.managers.PopUpManager;
	import mx.containers.Box;
	import mx.core.Container;
	import mx.controls.ProgressBar;
	import flash.display.DisplayObject;
	import org.epmr.utils.collection.IList;
	import org.epmr.utils.collection.ArrayList;
	import org.epmr.facility.share.IMonitorToken;
	import org.epmr.facility.share.SimpleMonitorToken;
	

class MonitorToken extends SimpleMonitorToken{
	public var timer:int;
	public var label:String;
	public var minValue:Number=0;
	public var value:Number=0;
	public var maxValue:Number=100;
	public var parent:DisplayObject;
	
	public function MonitorToken(owner:IProgressMonitor,target:Object){
		super(owner,target);
	}
}

class Progress{
	private var _control:ProgressBar;
	private var _container:Container;
	private var _tokens:IList;
	private var _active:MonitorToken;
	public function Progress(){
		_tokens=new ArrayList();
		_container=new Box();
		_container.setStyle("modalTransparency",0.0);
		_container.setStyle("modalTransparencyBlur",0);
		_control=new ProgressBar();
		_control.width=306;
		_control.height=32;
		_control.labelPlacement="center";
		_control.indeterminate=true;
		_control.setStyle("fontSize",12);
		_control.minimum=0;
		_control.maximum=100;
		_container.addElement(_control);
	}
	
	public function popup(token:MonitorToken):void{
		doClose();
		_control.label=token.label;
		PopUpManager.addPopUp(_container,token.parent,true);
		PopUpManager.centerPopUp(_container);
		PopUpManager.bringToFront(_container);	
		_tokens.add(token);
	}
	
	public function close(token:MonitorToken):void{
		if(_tokens.remove(token)){ 
			if(_tokens.size==0){
				doClose();
			}	
			else if(_active==token){
				_active=_tokens.getItem(_tokens.size-1);
				popup(_active);
			}
		}
	}
	
	private function doClose():void{
		if(_container.isPopUp){
			PopUpManager.removePopUp(_container);
		}
	}
	public function update(token:MonitorToken):void{
		if(_active==token){	
			_control.label=token.label;
			_control.minimum=token.minValue;
			_control.setProgress(token.value,token.maxValue);
		}
	}
}