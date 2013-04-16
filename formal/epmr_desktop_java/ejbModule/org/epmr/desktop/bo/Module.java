package org.epmr.desktop.bo;

import java.util.List;

public class Module implements IModule
{
    private String id;
    private String name;
    private String description;
	private List<IModule> subModules;
	private List<IView> views;
    private Module parentModule;
	public String getId()
	{
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	public List<IModule> getSubModules() {
		return subModules;
	}
	public void setSubModules(List<IModule> subModules) {
		this.subModules = subModules;
	}
	public List<IView> getViews() {
		return views;
	}
	public void setViews(List<IView> views) {
		this.views = views;
	}
	public Module getParentModule() {
		return parentModule;
	}
	public void setParentModule(Module parentModule) {
		this.parentModule = parentModule;
	}
	
	
}
