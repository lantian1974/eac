package org.epmr.desktop.controls
{
	import mx.core.Container;
	
	public interface IPopUpable
	{
		function  doOnClose():void;
		function  doOnMinimize():void;
		function  set wrapperWindow(wrapperWindow:IPopUpWindow):void;
	}
}