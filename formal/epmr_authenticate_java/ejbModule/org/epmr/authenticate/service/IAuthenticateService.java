package org.epmr.authenticate.service;

import org.epmr.authenticate.bo.AuthToken;

public interface IAuthenticateService 
{
	public AuthToken authenticate(String loginCode,String password,String userIp);
	public AuthToken authenticate(String loginCode,byte[] certificate,String userIp);
}
