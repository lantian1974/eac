package org.epmr.desktop.controls
{
	public interface IPopUpWindow
	{
	   function minimize():void;
	   function close():void;
	   function set canClose(close:Boolean):void;
	   function set canMinimize(minimize:Boolean):void;

	}
}