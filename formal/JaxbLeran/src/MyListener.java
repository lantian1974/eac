
public class MyListener  extends javax.xml.bind.Unmarshaller.Listener
{
	@Override
	public void beforeUnmarshal(java.lang.Object target,
            java.lang.Object parent)
	{
		super.beforeUnmarshal(target, parent);
		if (parent==null)
		{
			System.out.println("before: parent is null");
		}
		else 
		{ 
			 System.out.println("befor:" +parent.getClass().getName()+"  "+parent.toString());
		}
	}
	@Override
	public void afterUnmarshal(java.lang.Object target,
            java.lang.Object parent)
	{
		super.afterUnmarshal(target, parent);
		if (parent==null)
		{
			System.out.println("after : parent is null");
		}
		else 
		{ 
			 System.out.println("after:" +parent.getClass().getName()+"  "+parent.toString());
		}
	}

}
