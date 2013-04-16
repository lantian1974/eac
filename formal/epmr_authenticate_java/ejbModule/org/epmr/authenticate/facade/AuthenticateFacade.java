package org.epmr.authenticate.facade;

import javax.ejb.EJB;
import javax.enterprise.inject.spi.BeanManager;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.epmr.authenticate.bo.AuthToken;
import org.epmr.authenticate.bo.IUser;
import org.epmr.authenticate.dto.AuthTokenDTO;
import org.epmr.authenticate.dto.UserDTO;
import org.epmr.authenticate.service.IAuthenticateService;
public class AuthenticateFacade 
{
	@EJB(lookup="java:module/AuthenticateServiceEjb!org.epmr.authenticate.service.ILocalAuthenticateService")
	private IAuthenticateService authenticateService ;
	public AuthTokenDTO authenticate(String loginCode, String password) throws NamingException 
	{
		 InitialContext context= new InitialContext ();
		 BeanManager bm=(BeanManager)context.lookup("java:comp/BeanManager");
		 

		 //Bean<IAuthenticateService> ssBean = (Bean<IAuthenticateService>)bm.getBeans(IAuthenticateService.class).iterator().next();
		 //Object service=bm.getReference(ssBean, IAuthenticateService.class, bm.createCreationalContext(ssBean));
		 if (bm==null) throw new RuntimeException("can not start CDI");
		 if (this.authenticateService==null)
		 {
			 this.authenticateService=(IAuthenticateService)context.lookup("java:module/AuthenticateServiceEjb!org.epmr.authenticate.service.ILocalAuthenticateService");
			// Object o=context.lookup("java:com/IAuthenticateService");
		 }
		AuthToken token=authenticateService.authenticate(loginCode, password, null);
		if (token.isAuthenticated())
		{
			IUser user=token.getUser();
			UserDTO userDto=new UserDTO(user.getLoginCode(), user.getPrefix(), user.getFirstName(),
    		        user.getLastName(), user.getErpPersonId(),user.getEmail(),
    		        user.getOfficePhone(), user.getMobilePhone(), user.getQqNumber(),
                    user.getUserType().ordinal(), user.getUserType().getName(),user.isEnabled());
			AuthTokenDTO result=new AuthTokenDTO(userDto, token.getLoginTime(),token.getSessionId(),token.getAuthServerIp(),
		             token.getAuthenticatorClassName(), token.getInfo(), token.isAuthenticated());
			return result;
		}
		else
		{
			AuthTokenDTO result=new AuthTokenDTO(null, token.getLoginTime(),token.getSessionId(),token.getAuthServerIp(),
		             token.getAuthenticatorClassName(), token.getInfo(), token.isAuthenticated());
			return result;
		}
	}


	public AuthTokenDTO authenticate(String loginCode, byte[] certificate)
	{
		// TODO Auto-generated method stub
		return null;
	}
	public String helloWorld()
	{
		return "Hello world! !";
		
	}
}
