package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import dao.EinformationDAO;


import email.Send;
import entity.Einformation;

public class EinformationAction extends ActionSupport{
	public String execute() throws Exception {
		try{
		EinformationDAO dao=new EinformationDAO(); 
		java.util.List<Einformation> einformation=null;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String mailbox=(String) session.getAttribute("mailbox");
		System.out.println(mailbox);
		einformation = dao.geteInformationsList(mailbox);
	    request.setAttribute("einformation",einformation);  

		return "OK";  
		}
		catch(Exception e){
			e.printStackTrace();
		return "error";
		}
	
	}
	
	//管理员操作验证企业邮箱并通过验证，发送邮箱
	public String setPass() throws Exception{
		
		try{
			EinformationDAO dao=new EinformationDAO(); 		
			HttpServletRequest request = ServletActionContext.getRequest();
		    int id=Integer.parseInt(request.getParameter("passid")); 
		    System.out.println(id);
		    dao.updateA(id);
		    Einformation einformation=dao.findyID(id);
		    Send send=new Send();
		    send.send(einformation,"m15219605797@163.com", 1);
			return "OK";  
			}
			catch(Exception e){
				e.printStackTrace();
				return "error";
			}
		
		
		
	}
	
	public String getEIList() throws Exception {
		try{
		EinformationDAO dao=new EinformationDAO(); 
		java.util.List<Einformation> einformation=null;
		HttpServletRequest request = ServletActionContext.getRequest();
	    int pass=Integer.parseInt(request.getParameter("id")); 
	
		einformation = dao.geteInformationsList(pass);
	    request.setAttribute("einformation",einformation);  

		return "OK";  
		}
		catch(Exception e){
			e.printStackTrace();
		return "error";
		}
	
	}
//	public String update() throws Exception{
//		HttpServletRequest request = ServletActionContext.getRequest();
//		
//		
//		
//		return "error";
//	}

}
