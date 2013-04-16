package org.epmr.resource.bo;

import java.util.List;

public interface IResourceType 
{
   public String getCode();
   public String getName();
   public ResourceCatagory getCatagory();
   public IResourceProvider getObjectProvider();
   public IResourceType getDependentResource();
   public List<IResourceType> getSubResources();
   public String getDescription();
}
