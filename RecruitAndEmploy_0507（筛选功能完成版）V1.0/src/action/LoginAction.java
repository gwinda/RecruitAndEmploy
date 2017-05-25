package action;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.EinformationDAO;
import dao.PersonalinformationDAO;
import entity.Admin;
import entity.Einformation;
import entity.Personalinformation;

public class LoginAction extends ActionSupport{
	 private Admin admin;
	 private Einformation einformation;
	 private Personalinformation pinformation;
	 HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
	       
		
		public Admin getAdmin() {
			return admin;
		}
		public void setAdmin(Admin admin) {
			this.admin = admin;
		}
		public Personalinformation getPinformation() {
			return pinformation;
		}
		public void setPinformation(Personalinformation pinformation) {
			this.pinformation = pinformation;
		}
		public Einformation getEinformation() {
			return einformation;
		}
		public void setEinformation(Einformation einformation) {
			this.einformation = einformation;
		}

	    public String execute() throws Exception { 
	    	return "OK";
	    }

		public String einformation() throws Exception {  
			
			HttpServletRequest request = ServletActionContext.getRequest();
     		HttpSession session=request.getSession();
			EinformationDAO dao=new EinformationDAO();
			request.setCharacterEncoding("utf-8");
			try{
				Cookie cookie1 = new Cookie("userName",null); 
				cookie1.setMaxAge(0); 
				ServletActionContext.getResponse().addCookie(cookie1);
				//session.removeAttribute("IDFK");
				ActionContext ctx=ActionContext.getContext();
				
				String number =request.getParameter("emailbox");
				String password =request.getParameter("password");
				System.out.println(number);
				//String password=(dao.findNewsByMail(getEinformation().getMailbox()));
				String name=dao.findNameByMail(number);
				if(password.equals(dao.findNewsByMail(number))&&dao.findAByMail(number).equals("1"))
			    {
					
					Cookie cookie = new Cookie("userName",  URLEncoder.encode(name+"企业","UTf-8"));
					cookie.setMaxAge(60 * 60 * 24 * 365);
					cookie.setPath("/");
					ServletActionContext.getResponse().addCookie(cookie);
				   //System.out.println(IDFK);
					session.setAttribute ("mailbox", number);
					session.setAttribute ("userName", name+"企业");
					return "OK";	
					
			    }
				
				}
				catch(Exception e) {
					return "error";
				}
			return "error";
		
//			EinformationDAO dao=new EinformationDAO();
//			try{
//
//				String password=(dao.findNewsByMail(getEinformation().getMailbox()));
//				
//	
//				if(password.equals(getEinformation().getPassword()))
//			    {
//					session.setAttribute("mailbox", getEinformation().getMailbox());
//					return "OK";
//			    }
//				
//				}
//				catch(Exception e) {
//					return "error";
//				}
//			return "error";
		
		
		
		}
		public String pinformation() throws Exception {  
			
			PersonalinformationDAO dao=new PersonalinformationDAO();
			try{

				String password=(dao.LookPsdBymail(getPinformation().getMailbox()));
				
	
				if(password.equals(getPinformation().getPassword()))
			    {
					return "OK";
			    }
				
				}
				catch(Exception e) {
					return "error";
				}
			return "error";
		
		
		}
		
		public String LoginAdmin() throws Exception {
			Cookie cookie1 = new Cookie("userName",null); 
			cookie1.setMaxAge(0); 
			System.out.println(getAdmin().getNumber());
			Admin admindao=new Admin();
			if(getAdmin().getPassword().equals(admindao.findpsdByNumber(getAdmin().getNumber()))){
				return "success";
			}
			else{
				
				return "error";
			}
			
		}
}
