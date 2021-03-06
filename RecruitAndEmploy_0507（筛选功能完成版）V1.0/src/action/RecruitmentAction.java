package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import entity.Application;
import entity.Einformation;
import entity.Industry;
import entity.Job;
import entity.Collection;
import entity.Recruitment;
import entity.Resume;
import daoImpl.ApplicationDAO;
import daoImpl.CollectionDAO;
import daoImpl.EinformationDAO;
import daoImpl.PositionDao;
import daoImpl.RecruitmentDAO;
import daoImpl.ResumeDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecruitmentAction extends ActionSupport{
	
	/**
	 * 关于企业招聘 的一些action
	 */
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	HttpServletResponse response = ServletActionContext.getResponse();
	ActionContext ctx=ActionContext.getContext();
	private String result;
	public String setEnd() throws Exception{
		try{			
			int endid=Integer.parseInt(request.getParameter("endid"));
			RecruitmentDAO dao=new 	RecruitmentDAO();
			dao.updateEnd(endid);			
			request.setAttribute("i", endid);
			return "tolook";
		}
		
		
		catch(Exception e){
		return "errer";
		}
		
		
	} 
	
	public String index_look() throws Exception{
		List<Recruitment> list=new ArrayList<Recruitment>();
		List<Recruitment> list2=new ArrayList<Recruitment>();
		RecruitmentDAO dao=new RecruitmentDAO();
		list=dao.lookSomeAbout(8);	
		System.out.println(list);
		list2=dao.lookSomeAbout(1);
		session.setAttribute("indexlistOfIT", list);
		session.setAttribute("indexlistOfM", list2);
		return "success";
		
	}
	
	
	
	@SuppressWarnings("unused")
	public String execute() throws Exception {
		session.removeAttribute("recruitmentlist");
		String s=(String)session.getAttribute("mailbox");
		int i=Integer.parseInt(request.getParameter("i"));
		System.out.println("1111111111111"+s);	   
	    int idi=new EinformationDAO().findIDByMail( (String)session.getAttribute("mailbox"));
		System.out.println("haha excute");						
			System.out.println("=look");
			//String name = "前端";
			try{
			List<Recruitment> list=new ArrayList<Recruitment>();
			RecruitmentDAO dao=new RecruitmentDAO();
			dao.update();
			if(i==0)
			{
			list=dao.getrecruitmentsList(idi);
			}
			else 
			{
				list=dao.getrecruitmentsList(idi,i);
			}
			
			
			if(list!=null)
			{
				for(int k=0;k<list.size();k++)
				{
			    int n=0;
				int id=list.get(k).getIdEnterpriseRecruitment();
				ApplicationDAO applicationDAO=new ApplicationDAO();
				java.util.List<Application> applications=null;
			    applications = applicationDAO.findNewsByIdI(id);
			  
			    if(applications!=null)
			    {
			    	n=applications.size();
			    	System.out.println(id);
			    	System.out.println(n);
			    	list.get(k).setN(n);
			    	
			    }
			    else{
			    	list.get(k).setN(n);
			    	}
				}
			}
			else{}
			System.out.println(list);
			session.setAttribute("recruitmentlist", list);
				return "look";
			}catch(Exception e){
				e.printStackTrace();
				return "error";
			}
			
		
	}
	
	//发布招聘
	public String createRecruitment() throws Exception{
		String R;
		String name=request.getParameter("name");
		String requirement=request.getParameter("requirement");
		String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String workplace=request.getParameter("workplace");
        if(name.equals(""))
        {
        	R="招聘名不能为空";
        	request.setAttribute("R", R);
        	return "ERROR";
        }else if(requirement.equals("")){
        	
        	R="要求不能为空";
        	request.setAttribute("R", R);
        	return "ERROR";
        }else if(endtime.equals("")){
        	R="结束时间不能为空";
        	request.setAttribute("R", R);
        	return "ERROR";
        }
        else if(workplace.equals("")){
        	R="工作地点";
        	request.setAttribute("R", R);
        	return "ERROR";
        }else{}
        int position;
        int number;
        int salary;
        try{
		 position=Integer.parseInt(request.getParameter("position"));
		System.out.println("position"+position);
        }catch(Exception e){
        	R="种类不能为空";
        	request.setAttribute("R", R);
        	return "ERROR";
        }
        try{
        	salary=Integer.parseInt(request.getParameter("salary"));
        	
           }catch(Exception e){
        		R="工资不能为空";
            	request.setAttribute("R", R);
           	return "ERROR";
           }
        try{
   		 number=Integer.parseInt(request.getParameter("number"));
           }catch(Exception e){
        		R="招聘人数不能为空";
            	request.setAttribute("R", R);
           	return "ERROR";
           }
        
		
		System.out.println(request.getParameter("position"));
		String s=(String)session.getAttribute("mailbox");
		System.out.println("1111111111111"+s);
        
	    int id=new EinformationDAO().findIDByMail( (String)session.getAttribute("mailbox"));
		Recruitment recruitment = new Recruitment(name,requirement,endtime,position,workplace,id,salary,number);				
		
		RecruitmentDAO dao=new RecruitmentDAO();
		boolean end=dao.add(recruitment);
	    dao=new RecruitmentDAO();
	    List<Recruitment> list=new ArrayList<Recruitment>();	   
		list=dao.getrecruitmentsList();
		
		session.setAttribute("recruitmentlist", list);
		System.out.println(list);
		System.out.println(end);
		System.out.println(name);
		if(end==true){
			return "OK";
		}
		else{
			return "ERROR";
		}
		
	}
	
	//模糊搜索职位
	
	public String searchjob(){
		try{		
		String key= request.getParameter("keyword");
		String key2=new String(key.getBytes("ISO-8859-1"),"utf-8");
		System.out.println(key2);
		String pid=request.getParameter("pageNos");
		System.out.println("hh id"+pid);		
		int pageNo=1;						
		pageNo=pid!=null?Integer.parseInt(pid):1;
		System.out.println("pageqq"+pageNo);		
		List<Recruitment> list=new ArrayList<Recruitment>();
		RecruitmentDAO dao=new RecruitmentDAO();
		list=dao.searchbyname(key2,pageNo);
		int count=dao.getPage(key2);
		System.out.println(list);
		System.out.println(count);
		ctx.getSession().put("joblist", list);
		ctx.getSession().put("recordCount", count);
		ctx.getSession().put("pageNos", pageNo);
		ctx.getSession().put("key", key2);
		//session.setAttribute("joblist", list);
		return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		
	}
	
	//根据职位类型查看招聘信息
	public String searchjobbyid()  throws Exception{
		//String id1=(String) ctx.getApplication().get("id");
		
		int id= Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		try{
			List<Recruitment> list=new ArrayList<Recruitment>();
			RecruitmentDAO dao=new RecruitmentDAO();
			list=dao.searchbyjobid(id);
			System.out.println(list);
			ctx.getSession().put("joblist", list);
			return "success";
		}
		catch(Exception e)
		{
		return "error";
		
		}
		
	}
	
	
	//点击搜索出来的链接，查看单独的招聘信息页面
	public String lookonejob(){
		String id2=(String) ctx.getApplication().get("id");
		String id1=request.getParameter("id");
		String Eid=request.getParameter("idEnterpriseInformation");
		if(id1!=null){
			int eid=Integer.parseInt(Eid);
			int id=Integer.parseInt(id1);
			Recruitment list=new Recruitment();
			RecruitmentDAO dao=new RecruitmentDAO();		
			list=dao.getrecruitment(id);//获取单条信息
			Einformation einformation= new Einformation();
			EinformationDAO Einformationdao=new EinformationDAO();
			einformation=Einformationdao.findyID(eid);//获取企业信息
			List<Recruitment> Recruitmentlist=new ArrayList<Recruitment>();
			Recruitmentlist=dao.getrecruitmentsList(eid);
			ctx.getSession().put("jobmess", list);
			session.setAttribute("jobmess", list);
			session.setAttribute("einformation", einformation);
			session.setAttribute("Recruitmentlist", Recruitmentlist);
			session.setAttribute("Rid", id);
			return "success";
		}
		else{
			return "error";
		}
		
	}
	
	

	//ajax 异步获取获取具体职位
	public String Lookposition() throws Exception{			             
		System.out.println("jj");
		int kid= Integer.parseInt(request.getParameter("kid"));
		System.out.println("kid"+kid);
		PositionDao dao=new PositionDao();
		List<Job> Joblist=dao.getJod(kid);		
		
		response.setContentType("text/html;charset=utf-8"); 
		JSONObject json = new JSONObject();
		json.put("Joblist", Joblist);
		System.out.println(json.get("Joblist").toString());
		PrintWriter out = response.getWriter(); 
		out.print(json.toString());			
		out.flush();
		return null; 
	}
	
	//ajax 异步获取获取职位
	public String Lookkind1() throws Exception{		
		System.out.println("jjaa");
		PositionDao dao=new PositionDao();
		List<Industry> Industry=dao.getIndustry();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8"); 	 
		//JSONArray jsonArray = JSONArray.fromObject(Industry); 
		 JSONObject json = new JSONObject();
		 json.put("qq", Industry);
		 System.out.println(json.get("qq").toString());
		 PrintWriter out = response.getWriter(); 
		 out.print(json.toString());	
		 out.flush();
		return null;
	}
	public String findjobByThreekey() throws IOException{
		try{		
			System.out.println("jobByThreekey");
			session.removeAttribute("joblist");
			String keyword=session.getAttribute("key")==null?"":(String) session.getAttribute("key");		
			int pageno=Integer.parseInt(request.getParameter("pageNo"));
			String positionkey= request.getParameter("positionkey")==null?"": request.getParameter("positionkey");		
			String workkey= request.getParameter("workkey")==null?"": request.getParameter("workkey");
			String moneykey= request.getParameter("moneykey")==null?"": request.getParameter("moneykey");	
			System.out.println("keyword"+keyword);		
			RecruitmentDAO dao= new RecruitmentDAO();
			List<Recruitment> joblist=null;		
			joblist=dao.searchbykeys(keyword,positionkey,workkey, moneykey, pageno);
			System.out.println(joblist);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8"); 	 
			//JSONArray jsonArray = JSONArray.fromObject(Industry); 
			 JSONObject json = new JSONObject();
			 json.put("jobkeylist", joblist);
			 System.out.println(joblist.size()==0?0:joblist.get(0).getSumcount());
			 json.put("sumcount",joblist.size()==0?0:joblist.get(0).getSumcount());	
			 json.put("jobkeylist", joblist);
			// System.out.println(json.get("jobkeylist").toString());
			 PrintWriter out = response.getWriter(); 
			 out.print(json.toString());	
			 out.flush();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		 return null;	
	}
	
	public String Collection() throws Exception{
		PrintWriter out = response.getWriter(); 		
		System.out.println("Collection()");
		String recurimentid= request.getParameter("recurimentid");		
		String idfk;
		if(request.getParameter("idfk")==null){
			out.print("null");			
			out.flush();
			return "success";
		}
		else{
			idfk=request.getParameter("idfk");
			Collection collection=new Collection();
			collection.setIdPersonalInformation(Integer.parseInt(idfk));
			collection.setIdEnterpriseRecruitment(Integer.parseInt(recurimentid));
			CollectionDAO collectionDAO=new CollectionDAO();
			collectionDAO.addCollection(collection);	
			System.out.println("success");
			 out.print("success");	
			 out.flush();
			return "success";
		}
	}
	


	public String CollectionExist() throws Exception  {
		PrintWriter out = response.getWriter(); 		
		System.out.println("CollectionExist()");
		String recurimentid= request.getParameter("recurimentid");
		String idfk=request.getParameter("idfk");
		System.out.println(idfk);
		Collection collection=new Collection();
		collection.setIdPersonalInformation(Integer.parseInt(idfk));
		collection.setIdEnterpriseRecruitment(Integer.parseInt(recurimentid));
		CollectionDAO collectionDAO=new CollectionDAO();
		boolean result=collectionDAO.CollectionExist(collection);
		System.out.println(result);
		if(result==true){
		System.out.println("success");
		out.print("success");	
		out.flush();
		}
		else{
			System.out.println("error");
			out.print("error");
			out.flush();
		}		
		return "success";
	}
	
	
}
