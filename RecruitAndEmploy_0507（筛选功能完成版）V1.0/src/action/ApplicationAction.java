package action;



import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.struts2.ServletActionContext;



import com.opensymphony.xwork2.ActionSupport;

import dao.ApplicationDAO;
import dao.EinformationDAO;
import dao.PersonalinformationDAO;
import dao.ResumeDAO;
import entity.Application;
import entity.Resume;

public class ApplicationAction extends ActionSupport{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String lookResumeByR() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String mess=request.getParameter("mess");
		
		if(mess.equals("lookOne")){
			
			System.out.println("=lookOne");
			int idR=Integer.parseInt(request.getParameter("idResume"));
			Resume list=new Resume();
			ResumeDAO dao=new ResumeDAO();
			list=dao.OnesearchByID(idR);
			System.out.println(list.getAwardSituation());			
			session.setAttribute("Oneresume", list);
			return "OK";
		}
		if(mess.equals("lookOneByER")){
			System.out.println("����ER");
			int idR=Integer.parseInt(request.getParameter("idResume"));
			int idE=Integer.parseInt(request.getParameter("idEnterpriseRecruitemnt"));
			Resume list=new Resume();
			ResumeDAO dao=new ResumeDAO();
			ApplicationDAO applicationdao= new ApplicationDAO();
			applicationdao.updateApplication("�Ѳ鿴", idR, idE);
			System.out.println("=lookOneByE");
			list=dao.OnesearchByID(idR);
			System.out.println(list.getAwardSituation());			
			session.setAttribute("Oneresume", list);
			return "OK";
		}
        if(mess.equals("inviteclick")){
        	int idR=Integer.parseInt(request.getParameter("idResume"));
			int idE=Integer.parseInt(request.getParameter("idEnterpriseRecruitemnt"));
			ApplicationDAO applicationdao= new ApplicationDAO();
			applicationdao.updateApplication("����", idR, idE);
			return "user2";
		}
		if(mess.equals("rufuseclick")){
			int idR=Integer.parseInt(request.getParameter("idResume"));
			int idE=Integer.parseInt(request.getParameter("idEnterpriseRecruitemnt"));
			ApplicationDAO applicationdao= new ApplicationDAO();
			applicationdao.updateApplication("�ܾ�", idR, idE);
			return "user2";
		}
		return "error";
		
		
	}
	public String add() throws Exception{
		try{
			System.out.println("nnnnnnnnnnnnnnnnnnnn");
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			int Rid=(Integer)session.getAttribute("Rid");
			int which= Integer.parseInt(request.getParameter("which"));
			System.out.println("nnnnnnnnnnnnnnnnnnnn"+Rid+","+which);
			Application application=new Application();
			application.setState("δ�鿴");
			application.setIdResume(which);
			application.setIdEnterpriseRecruitment(Rid);		
			Date d=new Date();// new Date()Ϊ��ȡ��ǰϵͳʱ��			
			System.out.println(d);			
			ApplicationDAO dao=new ApplicationDAO();
			dao.add(application);
			System.out.println("add OK");		
		}
		catch(Exception e)
		{
		return "error";
		}
		return "success";
	}
		
	public String execute() throws Exception {  
        // TODO �Զ����ɵķ������  
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();

		//HttpSession session=request.getSession();
		String opera=request.getParameter("opera");
		String s=(String)session.getAttribute("mailbox");
		System.out.println("1111111111111"+s);
		int user=Integer.parseInt(request.getParameter("user"));
	   
	    
		System.out.println(opera);
		ApplicationDAO applicationDAO=new ApplicationDAO();
		ResumeDAO dao=new ResumeDAO();
		java.util.List<Application> applications=null;
		if(user==2)
		
		{
			 int id=new EinformationDAO().findIDByMail( (String)session.getAttribute("mailbox"));
		if(opera.equals("all"))
		{
			
	       applications = applicationDAO.findNewsById(id);
		}
		else if(opera.equals("notsee"))
		{
		   applications = applicationDAO.findNewsByState("δ�鿴",id);	
		}
		else if(opera.equals("see"))
		{
		   applications = applicationDAO.findNewsByState("�Ѳ鿴",id);	
		}
		else if(opera.equals("invite"))
		{
		   applications = applicationDAO.findNewsByState("����",id);	
		}
		else if(opera.equals("refuse"))
		{
		   applications = applicationDAO.findNewsByState("�ܾ�",id);	
		}
		}
		else{
			 int id=new PersonalinformationDAO().findIDByMail( (String)session.getAttribute("mailbox"));
			if(opera.equals("all"))
			{
		       applications = applicationDAO.findNewsByIdP(id);
			}
			else if(opera.equals("notsee"))
			{
			   applications = applicationDAO.findNewsByStateP("δ�鿴",id);	
			}
			else if(opera.equals("see"))
			{
			   applications = applicationDAO.findNewsByStateP("�Ѳ鿴",id);	
			}
			else if(opera.equals("invite"))
			{
			   applications = applicationDAO.findNewsByStateP("����",id);	
			}
			else if(opera.equals("refuse"))
			{
			   applications = applicationDAO.findNewsByStateP("�ܾ�",id);	
			}	
			
			
			
		}
		
		if(applications.size()!=0)
		{
			
		               for(int i=0;i<applications.size();i++)
		               { 
		            	  applications.get(i).setResumename(dao.OnesearchByID( applications.get(i).getIdResume()).getName());
		            	  
		            	
		            
		               }
		}
		else{}
        request.setAttribute("applitionlist",applications);  
        if(user==1)
        
        return "user1";
        else
        	return "user2";
		//}	
	    //return "error";
    }  

}

