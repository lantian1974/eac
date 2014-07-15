package test;

import java.util.Properties;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.epmr.authenticate.bo.AuthToken;
import org.epmr.authenticate.service.IAuthenticateService;
import org.junit.BeforeClass;
import org.junit.Test;
public class ServiceTest 
{
  private static InitialContext context;
	@Test
   public void doLogin() throws NamingException
   {
		IAuthenticateService as = (IAuthenticateService)context.lookup("java:global/epmr_authenticate_java/AuthenticateServiceEjb!org.epmr.authenticate.service.IRemoteAuthenticateService");

		AuthToken token= as.authenticate("lt", "111111", null);
		System.out.println(token.isAuthenticated());
	   
   }
	 @BeforeClass
   public static void  initialize() throws NamingException
   {
       Properties props = new Properties();
	   props.setProperty("java.naming.factory.initial", "com.sun.enterprise.naming.SerialInitContextFactory");
	   props.setProperty("java.naming.factory.url.pkgs", "com.sun.enterprise.naming");
	   props.setProperty("java.naming.factory.state", "com.sun.corba.ee.impl.presentation.rmi.JNDIStateFactoryImpl");
	   props.setProperty("org.omg.CORBA.ORBInitialHost", "127.0.0.1");
	   props.setProperty("org.omg.CORBA.ORBInitialPort", "3700");
	   context = new InitialContext (props);
   }
  
   public static void  initializeLocal() throws NamingException
   {

	   context = new InitialContext ();
   }
}
