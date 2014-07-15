package org.epmr.utils.xmltools
{
	import org.epmr.utils.collection.HashMap;
	import org.epmr.utils.collection.IMap;
	import org.epmr.utils.collection.ISequence;
	import org.epmr.utils.collection.Stack;
	
	/**
	 * 用于按照顺序读取XML，读取方法采用回调（有点类似于SAX ^_^）。
	 * @author qpd
	 */
	public dynamic class XMLReader
	{
		private var _xml:XML;
		private var _active:XML;
		public function XMLReader(xml:XML){
			this._xml=xml;
		}
		
		/**
		 * 创建XMLReader的便利方法
		 * @param xml - xml文档，XML类型
		 * @return XMLReader
		 */
		public static function create(xml:XML):XMLReader{
			return new XMLReader(xml);
		}
		
		/**
		 * 枚举xml文档中的每个元素，并回调callback方法。
		 * 对于特定的元素，将其属性和简单类型的子元素作为IMap封装，
		 * 对于复杂类型的子元素采用迭代的方法同样处理
		 * @param callback - 回调函数，形如：function(name:String,attrs:IMap,parent:*,reader:XMLReader):*;
		 * 其中name表示复杂元素的名称，attrs表示其属性和简单子元素的名值对
		 * parent表示代表父元素的自定义对象,
		 * 返回值为根据当前元素创建的自定义对象，在枚举子元素时会将此值作为参数parent传递。
		 * @param thisObject - 函数callback中的this对象，默认不改变callback的this对象。
		 */
		public function every(callback:Function,thisObject:*=null):void{
			var sequence:ISequence=new Stack();
			sequence.push(_xml);
			do{
				_active=sequence.pop() as XML;
				var parent:*=_active['customParent'];
				var attrs:XMLList=_active.attributes();//首先枚举属性
				var attrMap:IMap=new HashMap();
				
				for(var i:int=0;i<attrs.length();i++){
					attrMap.put(attrs[i].name().toString(),attrs[i].toString());	
				}
				var children:XMLList=_active.children();//然后枚举子节点
				var array:Array=new Array();
				for(var j:int=children.length()-1;j>-1;j--){	//按照倒序压入栈中，以便弹出时保证顺序					
						
						if(children[j].nodeKind()!=="element")
							continue;
						if(children[j].hasSimpleContent() && children[j].attributes().length()==0)
							attrMap.put(children[j].name().toString(),children[j].toString());	
						else{
							array.push(children[j]);
						}	
							
				}
				parent=callback.call(thisObject,_active.name().toString(),attrMap,parent,this);
				for each(var item:XML in array){
					sequence.push(item);
					item['customParent']=parent;
				}
				
			}
			while(!sequence.isEmpty());
		}
		public function get active():XML{
			return _active;
		}
	}
}