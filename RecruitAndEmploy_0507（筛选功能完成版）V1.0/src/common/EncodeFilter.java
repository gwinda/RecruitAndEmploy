package common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *	�����ַ�������࣬Ŀ���ǽ�ҳ���ϴ�����������ͳһ����ΪUTF-8,��������Ϊ�˱��⵱���ݲ������ݿ��������������� 
*/
public class EncodeFilter implements Filter
{

	public void destroy()
	{
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		
		request.setCharacterEncoding("utf-8");
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException
	{
		
	}

}
