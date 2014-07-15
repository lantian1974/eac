package org.epmr.facility.mediate
{
	import org.epmr.facility.utils.PrimitiveUtil;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.events.PropertyChangeEvent;
	
	public class GeneralUIBridge extends SimpleUIBridge
	{
		private var _target:IEventDispatcher;
		private var _field:String;
		private var _watcher:ChangeWatcher;
		private var _lastValue:*;
		public function GeneralUIBridge(target:IEventDispatcher,field:String)
		{
			super();
			_target=target;
			_field=field;
			_watcher=ChangeWatcher.watch(_target,_field,onComponentUpdated,true);
		}
		public final function get target():IEventDispatcher{
			return _target;
		}
		public final function get field():String{
			return _field;
		}
		private function onComponentUpdated(event:Event):void{			
			if(event is PropertyChangeEvent){
				dispatchEvent(event);
			}	
			else{
				var value:*=_watcher.getValue();
				if(PrimitiveUtil.equals(value,_lastValue)==false){
					dispatchEvent(PropertyChangeEvent.createUpdateEvent(_target,_field,_lastValue,value));
					_lastValue=value;
				}
			}
		}
		
		override final public function modelUpdated(context:Object,property:String,origin:*,current:*):void{
			var viewData:*=toUIData(context,property,current);
			updateView(context,property,viewData);
		}
		protected function updateView(context:Object,property:String,value:*):void{
			_target[_field]=value;
		}
	}
}