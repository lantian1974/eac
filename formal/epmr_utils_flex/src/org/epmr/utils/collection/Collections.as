package org.epmr.utils.collection
{
	public class Collections
	{
		
		private static var _emptyList:IList;
		private static var _emptySet:ISet;
		private static var _emptyMap:IMap;
		
		public static function asList(target:Array):IList{
			var result:ArrayList=new ArrayList(target);
			return result;
		}
		
		public static function unmodifiableCollection(target:ICollection):ICollection{
			return new UnmodifiableCollection(target);
		}
		public static function unmodifiableList(target:IList):IList{
			return new UnmodifiableList(target);
		}
		public static function unmodifiableSet(target:ISet):ISet{
			return new UnmodifiableSet(target);
		}
		public static function unmodifiableMap(target:IMap):IMap{
			return new UnmodifiableMap(target);
		}
		public static function emptyCollection():ICollection{
			return emptyList();
		}
		public static function emptyList():IList{
			if(_emptyList==null){
				_emptyList=unmodifiableList(new ArrayList());
			}
			return _emptyList;
		}
		public static function emptySet():ISet{
			if(_emptySet==null){
				_emptySet=unmodifiableSet(new HashSet());
			}
			return _emptySet;
		}
		public static function emptyMap():IMap{
			if(_emptyMap==null){
				_emptyMap=unmodifiableMap(new HashMap());
			}
			return _emptyMap;
		}
	}
}