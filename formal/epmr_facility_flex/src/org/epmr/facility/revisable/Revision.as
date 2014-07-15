package org.epmr.facility.revisable
{
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	
	[RemoteClass(alias="org.epmr.project.flex.collections.Revision")]
	public class Revision implements IRevision,IExternalizable
	{
		private static const APPENDED:int=1;
		private static const MODIFIED:int=2;
		private static const REMOVED:int=4;
		
		private var _value:int;
		public function Revision()
		{
			_value=0;
		}

		public function get modified():Boolean{
			return (_value & MODIFIED)==MODIFIED;
		}
		
		public function set modified(value:Boolean):void{
			if(value!=modified)
				_value ^=MODIFIED;	
		}
		
		public function get removed():Boolean{
			return (_value & REMOVED)==REMOVED;
		}
		
		public function set removed(value:Boolean):void{
			if(value!=removed)
				_value ^=REMOVED;	
		}
		
		public function get appended():Boolean{
			return (_value & APPENDED)==APPENDED;
		}
		
		public function set appended(value:Boolean):void{
			if(value!=appended)
				_value ^=APPENDED;	
		}
		
		public function get revised():Boolean{
			return _value!=0;
		}
		
		public function get value():*{
			return _value;
		}
		public function readExternal(input:IDataInput):void{
			_value=input.readInt();
		}
	    public function writeExternal(output:IDataOutput):void
	    {
	    	output.writeInt(_value);
	    }
	}
}