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
	 * ���ڼ��� ��һЩaction
	 */
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	//int fid= (Integer) session.getAttribute("IDFK");
	
	//System.out.println(cookies[0].getValue());
	
	public String execute() throws Exception {
		//ûд����ʱִ�и÷���
		//�÷���Ϊ��ѯ�����Ѵ����ļ���
		//Cookie[] cookies = request.getCookies();
		//int fid=Integer.parseInt(cookies[0].getValue().trim());
			//System.out.println(cookies[0].getValue());
		int fid= (Integer) session.getAttribute("IDFK");
		
			session.removeAttribute("resumelist");//����ǰ������session�е�����ɾ��
			System.out.println("haha excute =l");	//����						
			List<Resume> list=new ArrayList<Resume>();//ʵ��������
			ResumeDAO dao=new ResumeDAO();//new һ��dao��
			list=dao.searchAllResume(fid);//ִ��dao�еİ�ID��ѯ����������������ֵ��list��
			System.out.println(list);//�������list
			session.setAttribute("resumelist", list);//�����ݴ���session��
			//session.setAttribute("Pid", which);
			
			return "OK";
		
	}
	//���µ�������Servlet
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
			end=dao.updateOneResume(resume);//ִ�и��¼�������		
			
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

	//��������
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

	//ɾ����������
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
	//�鿴��������
	public String lookOne(){
		int idR=Integer.parseInt(request.getParameter("idResume"));
		int idFK=Integer.parseInt(request.getParameter("idFK"));
		System.out.println("=lookOne");
		System.out.println("idFK"+idFK);
		Resume list=new Resume();//ʵ����model����
		ResumeDAO dao=new ResumeDAO();//ʵ����dao ��
		list=dao.OnesearchByID(idR);//�鿴һ������
		Personalinformation person =new Personalinformation();//ʵ����
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
