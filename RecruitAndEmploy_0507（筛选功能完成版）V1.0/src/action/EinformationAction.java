package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import daoImpl.ApplicationDAO;
import daoImpl.EinformationDAO;
import daoImpl.RecruitmentDAO;


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
		if(request.getParameter("eiid")!=null)
		{
			int eiid=Integer.parseInt(request.getParameter("eiid"));
			
			mailbox=dao.findyID(eiid).getMailbox();
		}
		System.out.println(mailbox);
		einformation = dao.geteInformationsList(mailbox);
		RecruitmentDAO redao=new RecruitmentDAO();
		ApplicationDAO appdao=new ApplicationDAO();
		int resize=	redao.getrecruitmentsList(einformation.get(0).getId()).size();
		int nowsize=redao.getrecruitmentsList(einformation.get(0).getId(),1).size();
		int nosee=appdao.findNewsByState("未查看",einformation.get(0).getId()).size();
		request.setAttribute("nosee", nosee);  
		request.setAttribute("nowsize",nowsize);  
		request.setAttribute("resize",resize);  
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
		    //send.send(einformation,"1051209415@qq.com", 1);
			return "OK";  
			}
			catch(Exception e){
				e.printStackTrace();
				return "error";
			}
		
		
		
	}
public String setRefuse() throws Exception{
		
		try{
			EinformationDAO dao=new EinformationDAO(); 		
			HttpServletRequest request = ServletActionContext.getRequest();
		    int id=Integer.parseInt(request.getParameter("passid")); 
		    System.out.println(id);
		    dao.updateB(id);
		    Einformation einformation=dao.findyID(id);
		    Send send=new Send();
		    send.send(einformation,"m15219605797@163.com", 1);
		    //send.send(einformation,"1051209415@qq.com", 2);
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
