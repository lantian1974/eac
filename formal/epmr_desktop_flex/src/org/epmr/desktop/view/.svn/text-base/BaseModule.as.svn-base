package org.epmr.desktop.view
{
	import org.epmr.desktop.controls.IPopUpWindow;
	import org.epmr.desktop.controls.IPopUpable;
	import org.epmr.desktop.controls.MessageBox;
	import org.epmr.right.model.FunctionGrantInfo;
	import org.epmr.right.model.IFunctionalUI;
	
	import mx.containers.TitleWindow;
	import mx.events.CloseEvent;
	import mx.modules.Module;

	public class BaseModule extends Module implements IPopUpable
	{
		private var _wrapperWindow:IPopUpWindow;
		private var _closing:Boolean;
		private var _modified:Boolean;
		private var _title:String;
		public function BaseModule(){
			this._wrapperWindow=null;
			this._closing=false;
			this._modified=false;
		}
        public  function set wrapperWindow(wrapperWindow:IPopUpWindow):void
        {
           this._wrapperWindow=wrapperWindow;
           if ((this._wrapperWindow!=null)&&(this._wrapperWindow is TitleWindow))
           {
              this._title=(this._wrapperWindow as TitleWindow).title;
           }
        }
        public function get wrapperWindow():IPopUpWindow
        {
          return this._wrapperWindow; 
        }
        
        public  function  doOnClose():void
        {
			if(modified && !_closing){
				_wrapperWindow.canClose=false;
				MessageBox.confirm("该窗口包含的数据已经改变。\n" + 
						"是否保存这些数据？", 
					title,
					MessageBox.YES+MessageBox.NO+MessageBox.CANCEL,
					this,onCloseConfirmed,MessageBox.YES);
			}
        }
        protected function onCloseConfirmed(event:CloseEvent):void{
        	if(event.detail==MessageBox.CANCEL)
        		return;
        	if(event.detail==MessageBox.YES){
        		if(!closingProcess()){
        			_closing=true;
        			return;
        		}
        	}	
    		_wrapperWindow.canClose=true;
    		_wrapperWindow.close();
        }
        public function get title():String
        {
        	return this._title;
        }
        public function set title(title:String):void
        {
          this._title=title;
          if ((this._wrapperWindow!=null)&&(this._wrapperWindow is TitleWindow))
           {
              (this._wrapperWindow as TitleWindow).title=this._title;
           }
        }
        protected function get closing():Boolean{
        	return _closing;
        }
        protected function closingProcess():Boolean{
        	return true;
        }
		public function  doOnMinimize():void
		{
			
		}
        
        public function get functionGrantInfo():FunctionGrantInfo
        {
        	if(wrapperWindow is IFunctionalUI){
	           	return (wrapperWindow as IFunctionalUI).functionGrantInfo;
	        }
	        return null; 
        }
        
        public function get modified():Boolean{
        	return _modified;
        }
        public function set modified(value:Boolean):void{
        	_modified=value;
        	if(_modified==false && _closing){
        		_wrapperWindow.canClose=true;
        		_wrapperWindow.close();
        	}
        	_closing=false;
        }
	}
}