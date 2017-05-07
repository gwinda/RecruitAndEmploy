package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.PersonalinformationDAO;
import dao.ResumeDAO;
import doc.DocUtil;

import entity.Personalinformation;
import entity.Resume;


public class ResumeAction extends ActionSupport{
    /**
	 * 关于简历 的一些action
	 */
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	//int fid= (Integer) session.getAttribute("IDFK");
	
	//System.out.println(cookies[0].getValue());
	
	public String execute() throws Exception {
		//没写方法时执行该方法
		//该方法为查询所有已创建的简历
		//Cookie[] cookies = request.getCookies();
		//int fid=Integer.parseInt(cookies[0].getValue().trim());
			//System.out.println(cookies[0].getValue());
		int fid= (Integer) session.getAttribute("IDFK");
		
			session.removeAttribute("resumelist");//将以前保存在session中的数据删除
			System.out.println("haha excute =l");	//测试						
			List<Resume> list=new ArrayList<Resume>();//实例化对象
			ResumeDAO dao=new ResumeDAO();//new 一个dao类
			list=dao.searchAllResume(fid);//执行dao中的按ID查询简历方法，并返回值到list中
			System.out.println(list);//测试输出list
			session.setAttribute("resumelist", list);//将数据存在session中
			//session.setAttribute("Pid", which);
			
			return "OK";
		
	}
	//更新单个简历Servlet
	public String updateResume() throws Exception{
		String RName=request.getParameter("RName");
		String hobby=request.getParameter("hobby");
		String experience=request.getParameter("experience");
		String award=request.getParameter("award");
		String job=request.getParameter("job");
		String workplace=request.getParameter("workplace");
		System.out.println("workplace"+workplace);		
		int idResume=Integer.parseInt(request.getParameter("idResume"));
		boolean end = false;
		try{
			Resume resume=new Resume();
			resume.setIDResume(idResume);
			resume.setName(RName);
			resume.setHobby(hobby);
			resume.setHandsOnBackground(experience);
			resume.setAwardSituation(award);
			resume.setPosition(job);
			resume.setWorkingPlace(workplace);				
			ResumeDAO dao=new ResumeDAO();
			end=dao.updateOneResume(resume);//执行更新简历操作		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		if(end==true){
			return "SUCCESS";
		}
		else{
		return "ERROR";
		}
	}

	//创建简历
	public String createResume(){
		String RName=request.getParameter("RName");
		String hobby=request.getParameter("hobby");
		String experience=request.getParameter("experience");
		String award=request.getParameter("award");
		String job=request.getParameter("job");
		String workplace=request.getParameter("workplace");		
		int fid= (Integer) session.getAttribute("IDFK");
		Resume resume=new Resume(RName,hobby,experience,award,job,workplace,fid);
		ResumeDAO dao=new ResumeDAO();
		boolean end=dao.addResume(resume);
		System.out.println(end);		
		if(end==true){
			return "OK";
		}
		else{
			return "ERROR";
		}
		
	}

	//删除单条简历
	public String delResume(){
		int idR=Integer.parseInt(request.getParameter("idResume"));
		System.out.println("=delOne");	
		ResumeDAO dao=new ResumeDAO();
		boolean result=dao.delOneResume(idR);
		System.out.println("delete result"+result);
		if(result==true){
			request.setAttribute("idResume", idR);
		   return "SUCCESS";
		}else{
			 return "ERROR";
		}
	}
	//查看单条简历
	public String lookOne(){
		int idR=Integer.parseInt(request.getParameter("idResume"));
		int idFK=Integer.parseInt(request.getParameter("idFK"));
		System.out.println("=lookOne");
		System.out.println("idFK"+idFK);
		Resume list=new Resume();//实例化model对象
		ResumeDAO dao=new ResumeDAO();//实例化dao 类
		list=dao.OnesearchByID(idR);//查看一条简历
		Personalinformation person =new Personalinformation();//实例化
		PersonalinformationDAO persondao=new PersonalinformationDAO();
		try {
			person=persondao.lookOne(idFK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.getAwardSituation());			
		session.setAttribute("Oneresume",list);
		session.setAttribute("OnePerson",person);
		return "OK";
		
	}
	public String  getTargetFile() throws Exception{
		Personalinformation  person= (Personalinformation) session.getAttribute("OnePerson");
		Resume resume=  (Resume) session.getAttribute("Oneresume");
		System.out.println(person.getName());
		String name=UUID.randomUUID()+person.getName()+".doc";
		String savePath=ServletActionContext.getRequest().getRealPath("/download")+"\\"+name;
		System.out.println(savePath);
		DocUtil docUtil=new DocUtil();
        Map<String, Object> dataMap=new HashMap<String, Object>();
        dataMap.put("name",person.getName() );
        dataMap.put("phone", person.getPhone());
        dataMap.put("sex", person.getSex());
        dataMap.put("householdRegiste", person.getHouseholdRegister());
        dataMap.put("education", person.getEducation());
        dataMap.put("school", person.getSchool());
        dataMap.put("birth", person.getBirth());
        dataMap.put("mailbox", person.getMailbox());
        dataMap.put("hobby",resume.getHobby());
        //dataMap.put("firstExamTime", "12:41:17-12:44:38");
        String add=ServletActionContext.getRequest().getRealPath("/personPicture")+"\\"+person.getPicture();
        dataMap.put("picture", docUtil.getImageStr(add));
        System.out.println(docUtil.getImageStr(add));
        dataMap.put("politicalStatus", person.getPoliticalStatus());      
        dataMap.put("nation", person.getNation());
        dataMap.put("address", person.getAddress());
        dataMap.put("awardSituation", resume.getAwardSituation());
        dataMap.put("HandsOnBackground", resume.getHandsOnBackground());
        //dataMap.put("secondPic3", docUtil.getImageStr("D:\\Img\\secondPic3.png"));
        docUtil.createDoc(dataMap, "2678", savePath);
        ActionContext.getContext().getSession().put("savePath", name);
		return "success";
		
		
	}
	
	
	
}
