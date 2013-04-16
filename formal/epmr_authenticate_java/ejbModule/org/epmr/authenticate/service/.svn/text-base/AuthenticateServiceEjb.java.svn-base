package org.epmr.authenticate.service;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.inject.Named;

import org.epmr.authenticate.Qualifiers.AuthenticateServiceEjbImpl;
import org.epmr.authenticate.bo.AuthToken;
import org.epmr.authenticate.bo.IAuthenticator;
@Named("AuthenticateService")
@Stateless
@AuthenticateServiceEjbImpl
public class AuthenticateServiceEjb implements ILocalAuthenticateService,
		IRemoteAuthenticateService {

	@Inject
	private IAuthenticator authenticator;
	@Override
	public AuthToken authenticate(String loginCode, String password,String userIp) 
	{
		return this.authenticator.authenticate(loginCode, password, userIp);
	}

	@Override
	public AuthToken authenticate(String loginCode, byte[] certificate,String userIp)
	{
		return this.authenticator.authenticate(loginCode,certificate,userIp);
	}

}
