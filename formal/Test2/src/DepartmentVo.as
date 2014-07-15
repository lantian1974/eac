package
{
	import mx.collections.ArrayCollection;

	public class DepartmentVo
	{
		public function DepartmentVo()
		{
		}
		public var id:String;
		public var name:String;
		public var code:String;
		public var upperDepartment:DepartmentVo;
		public var subDepartmentList:ArrayCollection;
	}
}