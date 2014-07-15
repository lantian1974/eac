package org.epmr.authenticate.bo.ejb;

import java.util.Date;

import javax.ejb.Stateless;
import javax.inject.Inject;

import org.epmr.authenticate.bo.AuthToken;
import org.epmr.authenticate.bo.IAuthenticator;
import org.epmr.authenticate.bo.IUser;
import org.epmr.authenticate.bo.User;
import org.epmr.authenticate.bo.UserType;
import org.epmr.authenticate.po.EpmrUser;
import org.epmr.authenticate.repository.IUserDao;
import org.epmr.authenticate.repository.IUserTypeManager;
@Stateless
public class AuthenticatorEjb implements IAuthenticator
{
	@Inject
	private IUserDao userDao;
	@Inject
	private IUserTypeManager utm;
	@Override
	public AuthToken authenticate(String loginCode, String password,String userIp)
	{
		
		EpmrUser userPo=this.userDao.getUser(loginCode, password);
		if (userPo==null)
		{
			 AuthToken result=new AuthToken(null, new Date(),null,"server_lantian", 
					 AuthenticatorEjb.class.getName(),"µÇÂ¼Ê§°Ü" ,false);
			 return result;
		}
		else 
		{
			UserType ut=utm.getUsrType(userPo.getUserType());
			IUser user=new User(userPo,ut);
			AuthToken result=new AuthToken(user, new Date(),"SessionId:001","server_lantian", 
					 AuthenticatorEjb.class.getName(),"µÇÂ¼³É¹¦" ,true);
			return result;
		}	
	}
	@Override
	public AuthToken authenticate(String loginCode, byte[] certificate,String userIp)
	{
		//TODO
		return null;
	}

}
