import java.util.Hashtable;
import java.util.Set;

import javax.enterprise.inject.spi.AnnotatedType;
import javax.enterprise.inject.spi.BeanManager;
import javax.enterprise.inject.spi.InjectionTarget;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;

import flex.messaging.FlexContext;


public class TestFacade 
{
   public String hello() throws NamingException
   {
	//   Hashtable  env  = new  Hashtable ( ) ;
    //   env.put (Context.INITIAL_CONTEXT_FACTORY , "org.jnp.interfaces.NamingContextFactory" ); 
	   InitialContext context= new InitialContext ();
	   BeanManager bm=(BeanManager)context.lookup("java:comp/BeanManager");
	   ServletContext sc=FlexContext.getServletContext();
	   Object o=sc.getAttribute("javax.enterprise.inject.spi.BeanManager");
	  
	   
	  // Class<MyFacade> managedBeanClass =MyFacade.class;
	 //  AnnotatedType aType = bm.createAnnotatedType(managedBeanClass);
	 //  InjectionTarget<MyFacade> iTarget = bm.createInjectionTarget(aType);
	 //  Set<MyFacade<?>> beans = bm.getBeans(MyFacade.class,null);
	//   bm.createCreationalContext(arg0)
	   return "hello world";
   }
}
