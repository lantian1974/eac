package org.epmr.desktop.bo;

import java.util.List;

public interface IModule
{
	public String getId();
	public String getName();
	public String getDescription();
	public List<IView> getViews() ;
	public IModule getParentModule();
	public List<IModule> getSubModules();
}
