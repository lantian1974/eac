package org.epmr.desktop.bo;

public class View implements IView
{
    private  String url;
    private  String lable;
    private Module module;
    private boolean allMultiInstance;
    public String getUrl() {
	 return url;
    }
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLable() {
		return lable;
	}
	public void setLable(String lable) {
		this.lable = lable;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public boolean isAllMultiInstance() {
		return allMultiInstance;
	}
	public void setAllMultiInstance(boolean allMultiInstance) {
		this.allMultiInstance = allMultiInstance;
	}

}
