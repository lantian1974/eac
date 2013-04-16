package org.epmr.authenticate.bo;


public enum UserType 
{
   
    EMPLOYEE("企业职工",""),
    CUSTOMER("客户",""),
    SUPPLIER("供应商",""),
    PARTNER("合作伙伴",""),
    SYSTEM("IT系统","");
	public IAuthenticator getAuthenticator() 
	{
		return authenticator;
    
	}
	public void setAuthenticator(IAuthenticator authenticator) 
	{
		this.authenticator = authenticator;
	}
	public String getName() {
		return name;
	}
	public String getDescription()
	{
		return description;
	}
	private String name;
	private IAuthenticator authenticator;
    private String description;
    private  UserType(String name,String description)
    {
    	this.name=name;
    	this.description=description;	
    }
}
