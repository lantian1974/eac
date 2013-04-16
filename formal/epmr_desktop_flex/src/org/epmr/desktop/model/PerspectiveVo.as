package org.epmr.desktop.model
{
	import org.epmr.right.model.AccountVo;
	
	import mx.collections.ArrayCollection;
	[Bindable]
	[RemoteClass(alias="org.epmr.desktop.dto.PerspectiveDto")]
	public class PerspectiveVo
	{
		public var name:String;
		public var id:String;
		public var views:ArrayCollection;
		public var currentStylesName:String;
		public var surpportStyels:ArrayCollection;
		public var shortCuts:ArrayCollection;
		public var account:AccountVo;
	}
}