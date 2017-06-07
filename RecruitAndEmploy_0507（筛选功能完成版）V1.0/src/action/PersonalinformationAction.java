package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import daoImpl.CollectionDAO;
import daoImpl.PersonalinformationDAO;



import entity.Collection;
import entity.Personalinformation;

public class PersonalinformationAction extends ActionSupport{
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	String IDtype=request.getParameter("ID_type");	
	public String  excute(){
		
		return "error";
	}
	//查看个人信息
	public String look() throws Exception{		
		Personalinformation person =new Personalinformation();//实例化
		PersonalinformationDAO persondao=new PersonalinformationDAO();
		int idFK= (Integer) session.getAttribute("IDFK");
		try {
			person=persondao.lookOne(idFK);
			System.out.println(person.getPicture());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
		session.setAttribute("OnePerson",person);
		return "OK";
	}
	//更新个人信息
	public String update() throws Exception{
			System.out.println ("执行更新操作");
			boolean result = false;
			//int idFK=Integer.parseInt(request.getParameter("idFK"));
			try {
				String name=request.getParameter("name");
				String householdRegister=request.getParameter("householdRegister");
				String politicalStatus=request.getParameter("politicalStatus");
				String education=request.getParameter("education");
				String school=request.getParameter("school");
				String sex=request.getParameter("sex");
				String mailbox=request.getParameter("mailbox");
				String phone=request.getParameter("phone");
				Date birth=Date.valueOf(request.getParameter("birth"));
				String address=request.getParameter("address");
				String nation=request.getParameter("nation");
				int idFK= (Integer) session.getAttribute("IDFK");
				System.out.println(nation);			
				Personalinformation person =new Personalinformation();//实例化
				person.setIdPersonalInformation(idFK);
		    	person.setName(name);
		    	person.setBirth(birth);
		    	person.setSex(sex);
		    	person.setPhone(phone);
		    	person.setMailbox(mailbox);
		    	person.setNation(nation);
		    	person.setHouseholdRegister(householdRegister);		    	
		    	person.setAddress(address);
		    	person.setEducation(education);
		    	person.setSchool(school);
		    	person.setPoliticalStatus(politicalStatus);
		    	System.out.println(person.getEducation());
				PersonalinformationDAO persondao=new PersonalinformationDAO();				
				result=persondao.updatePerson(person);
					System.out.println( "更新结果"+result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result==true){
				return "OK";
			}
			else{
				return "ERROR";
			}
		}
	//执行注册操作
	public String register() throws Exception{
		System.out.println ("执行注册操作");
		boolean result = false;
		
		try {
			String password=request.getParameter("password");
			String name=request.getParameter("surname");			
			String sex=request.getParameter("sex");
			System.out.println(sex);
			String mailbox=request.getParameter("mailbox");		
			String number=request.getParameter("number");
			System.out.println("number"+number.length());		
			System.out.println(mailbox);			
			Personalinformation person =new Personalinformation();//实例化
			person.setPhone(number);
	    	person.setPassword(password);
	    	person.setName(name);
	    	person.setSex(sex);	    	
	    	person.setMailbox(mailbox);	    	
			PersonalinformationDAO persondao=new PersonalinformationDAO();				
			result=persondao.registerP(person);
				System.out.println( "更新结果"+result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result==true){
			return "OK";
		}
		else{
			session.setAttribute("message","<script type='text/javascript' >alert('注册失败，请尝试重新注册');</script>");
			return "ERROR";
		}
	}
	//登录
	public String login() throws Exception{
		Cookie cookie1 = new Cookie("userName",null); 
		cookie1.setMaxAge(0); 
		ServletActionContext.getResponse().addCookie(cookie1);
		//session.removeAttribute("IDFK");
		boolean result=false;
		PersonalinformationDAO persondao=new PersonalinformationDAO();
		String number=request.getParameter("emailbox");//获取输入的账号
		System.out.println(number);
		String password=request.getParameter("password");//获取输入的密码
		System.out.println(password);
		try {
			result=persondao.checkLogin(number, password);//查询账号密码是否存在并正确,返回TRUE或者FALSE	
			System.out.println(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();//抛出异常
		}				
		
		if(password.equals(persondao.LookPsdBymail(number))){//若账号密码正确，返回OK，将账号（电话）放入session中
			int IDFK=persondao.lookIDBymail(number);
			System.out.println(IDFK);
			Personalinformation person =new Personalinformation();//实例化
			PersonalinformationDAO persondao2=new PersonalinformationDAO();
			person=persondao2.lookOne(IDFK);
			String name=person.getName();			
			Cookie cookie = new Cookie("userName",  URLEncoder.encode(name+"用户","UTf-8"));
			cookie.setMaxAge(60 * 60 * 24 * 365);
			cookie.setPath("/");
			ServletActionContext.getResponse().addCookie(cookie);
			session.setAttribute("IDFK", IDFK);
			System.out.println(IDFK);
			session.setAttribute ("mailbox", number);
			session.setAttribute ("userName", name+"用户");
			System.out.println(number);
			return "OK";	
		}
		else{
			//session.setAttribute("message","<script type='text/javascript' >alert('账号或密码错误，请重新登录');</script>");
			return "ERROR";
		}
   }
	
	public String addphoto() throws Exception{
		return null;
		
		
	}
	//注销
	public String cancel() throws Exception{
		Cookie cookie1 = new Cookie("userName",null); 
		cookie1.setMaxAge(0); 
		ServletActionContext.getResponse().addCookie(cookie1);
		session.removeAttribute("IDFK");
		session.removeAttribute("mailbox");	
		session.removeAttribute("userName");			
		return "OK";
	}
	
	public String lookMyCollection(){
		try{
			System.out.println("lookMyCollection");
			int idFK= (Integer) session.getAttribute("IDFK");
			System.out.println(idFK);
			CollectionDAO dao=new CollectionDAO();
			List<Collection> collectionlist= new ArrayList<Collection>();
			collectionlist=dao.LookCollectionByIdPerson(idFK);
			session.setAttribute ("collectionlist", collectionlist);			
			return "success";
		}catch(Exception e){			
			e.printStackTrace();
			return "error";
		}
		
	}
	public String CheckPersonExit() throws Exception{
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		System.out.println("CheckPersonExit()");
		String mail=request.getParameter("mail");
		PersonalinformationDAO dao=new PersonalinformationDAO();
		int i=dao.findIDByMail(mail);
		String text = "";
		System.out.println(i);
		if(dao.findIDByMail(mail)==0){
			System.out.println(dao.findIDByMail(mail));
			text="ture";
			out.print(text);
		}
		else{
			text="false";
			out.print(text);
		}
		out.flush();	
		return "success";
		
	}
	
	public String deleteCollection(){
		
		String[] ChkSelect = request.getParameterValues("ChkSelect");
		if(ChkSelect!=null){
			int select[] =new int[ChkSelect.length];
			for(int i=0;i<ChkSelect.length;i++){
				System.out.print(ChkSelect[i]);
				select[i]=Integer.parseInt(ChkSelect[i]);
			}
			System.out.println("ChkSelect"+ChkSelect.length);
			CollectionDAO dao=new CollectionDAO();
			boolean result=dao.deleteMuchOF(select);
			if(result==true){
				return "success";
			}	
		}
		return "error";
	}
	public String delOne(){
				
		System.out.println("Collection()");
		String recurimentid= request.getParameter("recurimentid");		
		String idfk;
		if(request.getParameter("idfk")==null){
			
			return "success";
		}
		else{
			idfk=request.getParameter("idfk");			
			CollectionDAO collectionDAO=new CollectionDAO();		
			collectionDAO.delOneBy(Integer.parseInt(idfk), Integer.parseInt(recurimentid));
			System.out.println("success");			
			return "success";
		}
	}
}
