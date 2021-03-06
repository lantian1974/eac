package org.epmr.facility.revisable
{
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.ListCollectionView;

	[RemoteClass(alias="org.epmr.project.flex.collections.RevisableList")]
	public class RevisableList extends ArrayCollection implements IRevisableList,IExternalizable
	{
		private var _collector:RevisionCollector;
		private var _sendRevisedOnly:Boolean;
		public function RevisableList(replaceConcern:Boolean=false,sendRevisedOnly:Boolean=true)
		{
			super();
			this._sendRevisedOnly=sendRevisedOnly;
			_collector=new RevisionCollector(replaceConcern);
			_collector.addEventListener(RevisionCollector.ITEM_REVISED_EVENT,onItemRevised);
			_collector.list=this;
			_collector.active=true;
		}
		
		private function onItemRevised(event:Event):void{
			dispatchEvent(event);
		}
		[Bindable("itemRevised")]
		public function get revised():Boolean
		{
			return _collector.revised;
		}
		[Bindable("listChanged")] //superclass will fire this
		public function get collection():Object{
			return this.source;
		}
		
		public function set collection(value:Object):void{
			if(value==null){
				super.source=null;
				return;
			}
			if(value is ArrayCollection){
				super.source=(value as ArrayCollection).source;
			}
			else if(value is ListCollectionView){
				super.list=(value as ListCollectionView).list;
			}
			else if(value is IList){
				super.list=value as IList;
			}
			else if(value is Array){
				super.source=value as Array;
			}	
			else {
				super.source=[value];
			}
		}
		
		public function get enableTrack():Boolean
		{
			return _collector.active;
		}
		
		public function set enableTrack(value:Boolean):void
		{
			_collector.active=value;
		}
		
		public function isItemModified(item:Object):Boolean
		{
			return _collector.isItemModified(item);
		}
		
		public function isItemRemoved(item:Object):Boolean
		{
			return _collector.isItemRemoved(item);
		}
		
		public function isItemAppended(item:Object):Boolean
		{
			return _collector.isItemAppended(item);
		}
		
		public function isItemRevised(item:Object):Boolean
		{
			return _collector.isItemRevised(item);
		}
		
		override public function itemUpdated(item:Object, property:Object=null, oldValue:Object=null, newValue:Object=null):void{
			super.itemUpdated(item,property,oldValue,newValue);
			var field:String=null;
			if(property is QName)
				field=(property as QName).localName;
			else
				field=property.toString();	
			_collector.itemModified(item,field,oldValue,newValue);
		}
		
		
		public function reset():void
		{
			_collector.reset();
		}
		override public function readExternal(input:IDataInput):void{
			var items:Array=input.readObject() as Array;
			var changes:Array=input.readObject() as Array;
			source=items;
			var revs:Dictionary=new Dictionary();
			for(var i:int=0;i<changes.length-1;i=i+2){
				var index:int=changes[i];
				var revision:IRevision=changes[i+1];
				var item:Object=items[index];
				revs[item]=revision;
				//_collector.setItemRevision(item,revision);
			}	
			_collector.revisions=revs;
		}
	   override public function writeExternal(output:IDataOutput):void
	    {
	    	var items:Array=new Array();
	    	var changes:Array=new Array();
	    	var revs:Dictionary=_collector.revisions;
	    	var item:Object=null;
	    	if(!_sendRevisedOnly){
	    		var all:Array=this.source;
				var tmp:Dictionary=new Dictionary();
				for each(item in all){
					tmp[item]=revs[item];
				}
				for(item in revs){
					tmp[item]=revs[item];
				}
				revs=tmp;
	    	}
	    	var index:int=0;
			for(var changedItem:Object in revs){
				items.push(changedItem);
				changes.push(index++);
				changes.push(revs[changedItem]);
			}
			output.writeObject(items);
			output.writeObject(changes);
	    }
		
		
	}
}