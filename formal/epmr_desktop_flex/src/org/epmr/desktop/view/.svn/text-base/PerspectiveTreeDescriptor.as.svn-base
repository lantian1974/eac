package org.epmr.desktop.view
{
	import org.epmr.desktop.model.PerspectiveVo;
	import org.epmr.desktop.model.ViewVo;
	import mx.collections.ArrayCollection;
	import mx.collections.ICollectionView;
	import mx.controls.treeClasses.ITreeDataDescriptor;

	public class PerspectiveTreeDescriptor implements ITreeDataDescriptor
	{
		public function PerspectiveTreeDescriptor()
		{
		}

		public function getChildren(node:Object, model:Object=null):ICollectionView
		{
			if (node is PerspectiveVo)
			{
			   return  (node as PerspectiveVo).views;
			}
			else if (node is ViewVo)
			{
			  var view :ViewVo=node as ViewVo;
			  var children:ArrayCollection=new ArrayCollection();
			  if (view.subViews!=null)
			  for(var i:int=0;i<view.subViews.length;i++)
			  {
			     children.addItem(view.subViews.getItemAt(i));
			  }
		      if (view.webUIResources!=null)
		      {
		         for(var j:int=0;j<view.webUIResources.length;j++)
		         {
		            children.addItem(view.webUIResources.getItemAt(j));
		         }
		      }
			  return children;
			}
			else
			{
			  return null;
			}
		}
		
		public function hasChildren(node:Object, model:Object=null):Boolean
		{
			if (node is PerspectiveVo)
			{
			  return (node as PerspectiveVo).views.length>0;
			}
			else if(node is ViewVo)
			{
			  var view:ViewVo=node as ViewVo;
			  return ((view.subViews!=null)&&(view.subViews.length>0))||((view.webUIResources!=null)&&(view.webUIResources.length>0));
			}
			else
			{
			   return false;
			}
			
		}
		
		public function isBranch(node:Object, model:Object=null):Boolean
		{
			return (node is PerspectiveVo)||(node is ViewVo);
		}
		
		public function getData(node:Object, model:Object=null):Object
		{
			return node;
		}
		
		public function addChildAt(parent:Object, newChild:Object, index:int, model:Object=null):Boolean
		{
			return false;
		}
		
		public function removeChildAt(parent:Object, child:Object, index:int, model:Object=null):Boolean
		{
			return false;
		}
	}
}