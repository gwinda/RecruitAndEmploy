package code;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class CodeAction extends ActionSupport{
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	HttpServletResponse response = ServletActionContext.getResponse();
   public String execute(){
	  
	try {
		 response.setContentType("text/html;charset=utf-8"); 
		 request.setCharacterEncoding("utf-8");
	     String validateC = (String) request.getSession().getAttribute("SESSION_SECURITY_CODE");
	     System.out.println("validateC"+validateC);
	     String veryCode = request.getParameter("code");
	     System.out.println("c"+veryCode);
	     PrintWriter out;
		out = response.getWriter();
		if(veryCode==null||"".equals(veryCode)){                       
	           //response.sendRedirect(refer);
	           out.print("��֤�벻��Ϊ��");
	          System.out.println("��֤�벻��Ϊ��");
	       } else{
	        if(validateC.equals(veryCode)){         	 
	        	
	        	 out.print("��֤����ȷ");
	               //request.getRequestDispatcher("ServletTo").forward(request, response);
	        	 System.out.println("��֤����ȷ");
	           }else{  
	        	  
	        	   out.print("��֤�����");
	        	   System.out.println("��֤�����");
	           }           
	       }
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}      
	   return null;
   }
}
