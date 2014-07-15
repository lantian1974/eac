package org.epmr.authenticate.dto;

import java.io.Serializable;
import java.util.Date;

public class AuthTokenDTO implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -308932493850931657L;
	private UserDTO user;
    private Date loginTime;
    private String sessionId;
    private String authServerIp;
    private String authenticatorClassName;
    private String info;
    private Boolean authenticated;
    public AuthTokenDTO(){}
    public AuthTokenDTO( UserDTO user, Date loginTime,String sessionId,String authServerIp,
    		             String authenticatorClassName, String info, Boolean authenticated)
    {
    	this.user=user;
    	this.loginTime=loginTime;
    	this.sessionId=sessionId;
    	this.authServerIp=authServerIp;
    	this.authenticatorClassName=authenticatorClassName;
    	this.info=info;
    	this.authenticated=authenticated;
    }
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
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
	public Boolean getAuthenticated() {
		return authenticated;
	}
	public void setAuthenticated(Boolean authenticated) {
		this.authenticated = authenticated;
	}
	
 
}
