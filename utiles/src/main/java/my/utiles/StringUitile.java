package my.utiles;

public class StringUitile 
{

	public String repeat(String s,String separator,int rcount)
	{
		
		if (rcount<=1) return s;
		String result="";
		for (int i=0;i<rcount;i++)
		{
			result=s+";"+result;
			
		}
		return result;
	}
	public String hello(String name)
	{
		
		return "Hello "+name;
	}
}
