import javax.inject.Inject;
public class MyFacade
{
    @Inject
	private HelloBean hello;
    public String hello()
    {
    	return hello.hello();
    }
}
