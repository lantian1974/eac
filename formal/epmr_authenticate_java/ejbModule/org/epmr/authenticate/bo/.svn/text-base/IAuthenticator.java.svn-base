package org.epmr.authenticate.bo;

import javax.ejb.Local;

@Local
public interface IAuthenticator
{
	public AuthToken authenticate(String loginCode,String passwor,String userIp);
	public AuthToken authenticate(String loginCode,byte[] certificate,String userIp);
}
