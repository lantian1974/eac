package org.epmr.authenticate.bo;

import java.io.Serializable;
import java.util.Date;
public class AuthToken implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7364393258378162544L;
	private  IUser user;
	private  Date loginTime;
	private  String sessionId;
	private  String authServerIp;
	private  String authenticatorClassName;
	private  String info;
	private  boolean authenticated;
	public AuthToken ( IUser user, Date loginTime,String sessionId,String authServerIp, 
			String authenticatorClassName,String info,boolean authenticated)
	{
		this.user=user;
		this.loginTime=loginTime;
		this.sessionId=sessionId;
		this.authServerIp=authServerIp;
		this.authenticatorClassName=authenticatorClassName;
		this.info=info;
		this.authenticated=authenticated;
	}

	

	public IUser getUser() {
		return user;
	}
	public void setUser(IUser user) {
		this.user = user;
	}
	
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime)
	{
		this.loginTime=loginTime;
	}

	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getAuthServerIp() {
		return authServerIp;
	}
	public void setAuthServerIp(String authServerIp) {
		this.authServerIp = authServerIp;
	}
	public String getAuthenticatorClassName() {
		return authenticatorClassName;
	}
	public void setAuthenticatorClassName(String authenticatorClassName) {
		this.authenticatorClassName = authenticatorClassName;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

	public boolean isAuthenticated() {
		return authenticated;
	}

	public void setAuthenticated(boolean authenticated) {
		this.authenticated = authenticated;
	}
	
}
