package org.epmr.utils.collection
{
	public interface Iterator {
      
      function next():*;
      function hasNext():Boolean;
      function remove():*;
   }

}