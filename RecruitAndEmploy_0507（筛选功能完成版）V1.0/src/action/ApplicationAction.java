package action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.ApplicationDAO;
import dao.EinformationDAO;
import dao.PersonalinformationDAO;
import dao.RecruitmentDAO;
import dao.ResumeDAO;
import doc.DocUtil;
import entity.AERR;
import entity.Application;
import entity.Personalinformation;
import entity.Point;
import entity.Recruitment;
import entity.Resume;

public class ApplicationAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public String allopration() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("checkboxnew"));
		String values=request.getParameter("checkboxnew");
		String mybutton=request.getParameter("mybutton");
		System.out.println(mybutton);
		System.out.println("进入批量操作");
		List<Point> pt =null;
		if(values !=null&&values.length()>=0)
		{
			pt= new ArrayList<Point>();
			String[] ptValues =values.split(",");
			for(int i=0;i<ptValues.length/2;i++)
			{
				Point point=new Point();
				point.setX(Integer.parseInt(ptValues[2*i]));
				point.setY(Integer.parseInt(ptValues[1+(2*i)]));
				pt.add(point);
			}
			ApplicationDAO applicationdao = new ApplicationDAO();
			
			if(mybutton.equals("1"))
			{
				for(int i=0;i<pt.size();i++)
				{
					System.out.println(pt.get(i).getX());
					System.out.println(pt.get(i).getY());
					applicationdao.updateApplication("邀请", pt.get(i).getX(), pt.get(i).getY());
				}
			}
			else if(mybutton.equals("2")){
				
				for(int i=0;i<pt.size();i++)
				{
					System.out.println(pt.get(i).getX());
					System.out.println(pt.get(i).getY());
					applicationdao.updateApplication("拒绝", pt.get(i).getX(), pt.get(i).getY());
				}
			}
	        else if(mybutton.equals("3")){
	        	//---批量下载专用位------------------------------------------
	        	
	        	
	        	
			}
	        else{}
			
			
			
		}
		System.out.println(pt);
		
		
		
		
		
	return "user2";
	}
	public String lookResumeByR() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String mess = request.getParameter("mess");

		if (mess.equals("lookOne")) {

			System.out.println("=lookOne");
			int idR = Integer.parseInt(request.getParameter("idResume"));
			Resume list = new Resume();
			ResumeDAO dao = new ResumeDAO();
			list = dao.OnesearchByID(idR);
			System.out.println(list.getAwardSituation());
			session.setAttribute("Oneresume", list);
			return "OK";
		}
		if (mess.equals("lookOneByER")) {
			System.out.println("进入ER");
			int idR = Integer.parseInt(request.getParameter("idResume"));
			int idE = Integer.parseInt(request
					.getParameter("idEnterpriseRecruitemnt"));
			Resume list = new Resume();
			ResumeDAO dao = new ResumeDAO();
			ApplicationDAO applicationdao = new ApplicationDAO();
			applicationdao.updateApplication("已查看", idR, idE);
			System.out.println("=lookOneByE");
			list = dao.OnesearchByID(idR);
			System.out.println(list.getAwardSituation());
			session.setAttribute("Oneresume", list);
			return "OK";
		}
		if (mess.equals("inviteclick")) {
			int idR = Integer.parseInt(request.getParameter("idResume"));
			int idE = Integer.parseInt(request.getParameter("idRecruitemnt"));
			System.out.println(idR + ".......................");
			System.out.println(idE + ".......................");
			ApplicationDAO applicationdao = new ApplicationDAO();
			applicationdao.updateApplication("邀请", idR, idE);
			System.out.println(idR + idE + "");
			return "user2";
		}
		if (mess.equals("rufuseclick")) {
			int idR = Integer.parseInt(request.getParameter("idResume"));
			int idE = Integer.parseInt(request.getParameter("idRecruitemnt"));
			System.out.println(idE + ".......................");
			ApplicationDAO applicationdao = new ApplicationDAO();
			applicationdao.updateApplication("拒绝", idR, idE);
			return "user2";
		}
		return "error";

	}

	public String add() throws Exception {
		try {
			System.out.println("nnnnnnnnnnnnnnnnnnnn");
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			int Rid = (Integer) session.getAttribute("Rid");
			int which = Integer.parseInt(request.getParameter("which"));
			System.out.println("nnnnnnnnnnnnnnnnnnnn" + Rid + "," + which);
			Application application = new Application();
			application.setState("未查看");
			application.setIdResume(which);
			application.setIdEnterpriseRecruitment(Rid);

			Date d = new Date();// new Date()为获取当前系统时间

			System.out.println("add OK");
			System.out.println(d);

			ApplicationDAO dao = new ApplicationDAO();
			dao.add(application);
			System.out.println("add OK");

		} catch (Exception e) {
			return "error";
		}
		return "error";
	}


	public String selectRecruit() throws Exception {
		// TODO 自动生成的方法存根
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ApplicationDAO applicationDAO = new ApplicationDAO();
		String opera = "notsee";
		if (request.getParameter("opera") != null) {
			opera = request.getParameter("opera");
		} else {
		}
		String s = (String) session.getAttribute("mailbox");
		int idi = new EinformationDAO().findIDByMail((String) session
				.getAttribute("mailbox"));
		System.out.println("1111111111111" + s);
		int user = 2;

		session.removeAttribute("selectRecruit");
		session.removeAttribute("days");
		session.removeAttribute("daye");

		String selectRecruit = request.getParameter("selectRecruit");
		String days = request.getParameter("createdatetimeStart");
		String daye = request.getParameter("createdatetimeEnd");

		System.out.println(selectRecruit + "ok........................");
		System.out.println(days + "ok........................");
		System.out.println(daye + "ok........................");

		java.util.List<AERR> ByID = null;
		// HttpSession session=request.getSession();
		if (selectRecruit.equals("0") && days.equals("") && daye.equals("")) {

			ByID = applicationDAO.findNewsBySDN(idi);
			System.out.println("1ok........................");
		} else if (selectRecruit.equals("0") && !days.equals("")
				&& daye.equals("")) {
			ByID = applicationDAO.findNewsBySDN(idi, days);
			System.out.println("2ok........................");
		} else if (selectRecruit.equals("0") && days.equals("")
				&& !daye.equals("")) {
			ByID = applicationDAO.findNewsBySDN(daye, idi);
			System.out.println("3ok........................");
		} else if (selectRecruit.equals("0") && !days.equals("")
				&& !daye.equals("")) {
			ByID = applicationDAO.findNewsBySDN(idi, days, daye);
			System.out.println("4ok........................");
		} else if (!selectRecruit.equals("0") && days.equals("")
				&& daye.equals("")) {
			int idr = Integer.parseInt(selectRecruit);
			ByID = applicationDAO.findNewsBySDN(idi, idr);
			System.out.println("5ok........................");
		} else if (!selectRecruit.equals("0") && !days.equals("")
				&& daye.equals("")) {
			int idr = Integer.parseInt(selectRecruit);
			ByID = applicationDAO.findNewsBySDN(idi, idr, days);
			System.out.println("6ok........................");
		} else if (!selectRecruit.equals("0") && days.equals("")
				&& !daye.equals("")) {
			int idr = Integer.parseInt(selectRecruit);
			ByID = applicationDAO.findNewsBySDN(daye, idi, idr);
			System.out.println("7ok........................");
		} else if (!selectRecruit.equals("0") && !days.equals("")
				&& !daye.equals("")) {
			int idr = Integer.parseInt(selectRecruit);
			ByID = applicationDAO.findNewsBySDN(idi, days, daye, idr);
			System.out.println("8ok........................");
		} else {
			System.out.println("9ok........................");
		}
		String result = "-没有找到相关信息-";
		if (ByID != null) {
			result = "-共找到" + ByID.size() + "条信息-";

			System.out.println(result);
		}
        if(paging(ByID)!=null)
        {
		ByID=paging(ByID).get("1");
		
		System.out.println("分割成功-----------------------------");
        }
        String selectRecruitname="不限";
        String daysname="不限";
        String dayename="不限";
        int select =Integer.parseInt(selectRecruit);
        if(select!=0)
        {
        	RecruitmentDAO edao=new RecruitmentDAO();
        	selectRecruitname=edao.getrecruitment(select).getName();
        }
        if(!days.equals(""))
        {
        	daysname=days;
        }
        if(!daye.equals(""))
        {
        	dayename=daye;
        }
       
		System.out.println(ByID);
		session.removeAttribute("selectRecruit");
		session.removeAttribute("days");
		session.removeAttribute("daye");

		session.setAttribute("result", result);
		request.setAttribute("AERR", ByID);
		session.setAttribute("selectRecruit", selectRecruit);
		session.setAttribute("days", days);
		session.setAttribute("daye", daye);
		
		session.setAttribute("selectRecruitname", selectRecruitname);
		session.setAttribute("daysname", daysname);
		session.setAttribute("dayename", dayename);

		// 下面没用的-------------------------------------------------------------------------------
		// -----------------------------------------------------------------------------------------
		// -----------------------------------------------------------------------------------------
		// System.out.println(opera);
		//
		// ResumeDAO dao=new ResumeDAO();
		// java.util.List<Application> applications=null;
		// if(user==2)
		//
		// {
		// int id=new EinformationDAO().findIDByMail(
		// (String)session.getAttribute("mailbox"));
		// if(opera.equals("all"))
		// {
		//
		// applications = applicationDAO.findNewsById(id);
		// }
		// else if(opera.equals("notsee"))
		// {
		// applications = applicationDAO.findNewsByState("未查看",id);
		// RecruitmentDAO daoR=new RecruitmentDAO();
		// java.util.List<Recruitment> recruitments=null;
		// recruitments=daoR.getrecruitmentsList(id);
		// session.setAttribute("recruitmentlist", recruitments);
		// }
		// else if(opera.equals("see"))
		// {
		// applications = applicationDAO.findNewsByState("已查看",id);
		// }
		// else if(opera.equals("invite"))
		// {
		// applications = applicationDAO.findNewsByState("邀请",id);
		// }
		// else if(opera.equals("refuse"))
		// {
		// applications = applicationDAO.findNewsByState("拒绝",id);
		// }
		// }
		// else{}
		//
		//
		// if(applications.size()!=0)
		// {
		//
		// for(int i=0;i<applications.size();i++)
		// {
		// applications.get(i).setResumename(dao.OnesearchByID(
		// applications.get(i).getIdResume()).getName());
		//
		//
		//
		// }
		// }
		// else{}
		// request.setAttribute("applitionlist",applications);
		return "user2";
		// }
		// return "error";
	}

	public HashMap<String, List<AERR>> paging(List<AERR> aerr) {  
		  
		HashMap<String, List<AERR>> hashmap=new HashMap<String, List<AERR>>();   
		int part=1;
		
		if(null!=aerr&&aerr.size()>0){  
		int pointsDataLimit = 10;//限制条数  
		Integer size = aerr.size();  
		//判断是否有必要分批  
		
		if(pointsDataLimit<size){  
		 part = size/pointsDataLimit;//分批数  
		System.out.println("共有 ： "+size+"条，！"+" 分为 ："+part+"批");  
		//
		for (int i = 1; i < part+1; i++) {  
		//1000条  
		List<AERR> listPage = aerr.subList(0+pointsDataLimit*(i-1), pointsDataLimit*i);
		 String s = Integer.toString(i);
		 System.out.println(s);
		hashmap.put(s,listPage);   
		 System.out.println(hashmap.get(s));
		System.out.println(listPage);  
		//剔除  
		//aerr.subList(0, pointsDataLimit).clear();  
		} //------------------------------------- 
		  
		if(!aerr.isEmpty()){
		System.out.println(aerr);//表示最后剩下的数据  
		}  
		else{}
		}
		
		else{
		hashmap.put("1",aerr);   	
		System.out.println(aerr);
		}  
		}else{
		System.out.println("没有数据!!!"); 
		} 
		
		
		int i=1;
		String key = Integer.toString(i);
		 System.out.println(key);
		 System.out.println(hashmap);
		System.out.println(hashmap.get(key));
		int nowpage=1;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("hashmap", hashmap);
		session.setAttribute("mysize",part);
		request.setAttribute("nowpage", nowpage);
		return hashmap;
		}	
	
	public String pagination() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		List<AERR> aerr=null;
		HashMap<String, List<AERR>> hashmap=(HashMap<String, List<AERR>>) session.getAttribute("hashmap");
		int size=hashmap.size();
		int page = Integer.parseInt(request.getParameter("page"));
		String pr=null;
		if(page<=0||page>size)
		{
			pr="页码不符合要求";
		}
		else{
			
			aerr=hashmap.get(request.getParameter("page"));
		}
		request.setAttribute("pr", pr);
		request.setAttribute("nowpage", page);
		request.setAttribute("AERR", aerr);
		return "user2";
	}


	public String execute() throws Exception {
		// TODO 自动生成的方法存根
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		// HttpSession session=request.getSession();
		String opera = request.getParameter("opera");
		String s = (String) session.getAttribute("mailbox");
		System.out.println("1111111111111" + s);
		int user = Integer.parseInt(request.getParameter("user"));
		String result = "-没有找到相关信息-";

		System.out.println(opera);
		ApplicationDAO applicationDAO = new ApplicationDAO();
		ResumeDAO dao = new ResumeDAO();
		java.util.List<Application> applications = null;
		java.util.List<AERR> aerr = null;
		if (user == 2)

		{

			int id = new EinformationDAO().findIDByMail((String) session
					.getAttribute("mailbox"));

			int selectRecruit = 0;
			String days = "0001-01-01 00:00:00";
			String daye = "9999-01-01 00:00:00";
			if (session.getAttribute("selectRecruit") != null) {
				selectRecruit = Integer.parseInt(session.getAttribute(
						"selectRecruit").toString());
			}
			if (session.getAttribute("days") != null) {
				days = (String) session.getAttribute("days");
			}
			if (session.getAttribute("days") != null) {
				daye = (String) session.getAttribute("daye");
			}
			System.out.println(selectRecruit);
			System.out.println(days);
			System.out.println(daye);

			String state=null;
			if (opera.equals("all")) {

				aerr = applicationDAO.findNewsBySDN(id, days, daye,
						selectRecruit);
				state="全部";
			} else if (opera.equals("notsee")) {
				// applications = applicationDAO.findNewsByState("未查看",id);
				aerr = applicationDAO.findNewsBySDN("未查看", id, days, daye,
						selectRecruit);
				RecruitmentDAO daoR = new RecruitmentDAO();
				java.util.List<Recruitment> recruitments = null;
				recruitments = daoR.getrecruitmentsList(id);
				session.setAttribute("recruitmentlist", recruitments);
				state="未查看";
			} else if (opera.equals("see")) {
				// applications = applicationDAO.findNewsByState("已查看",id);
				aerr = applicationDAO.findNewsBySDN("已查看", id, days, daye,
						selectRecruit);
				state="已查看";
			} else if (opera.equals("invite")) {
				// applications = applicationDAO.findNewsByState("邀请",id);
				aerr = applicationDAO.findNewsBySDN("邀请", id, days, daye,
						selectRecruit);
				state="邀请";
			} else if (opera.equals("refuse")) {
				// applications = applicationDAO.findNewsByState("拒绝",id);
				aerr = applicationDAO.findNewsBySDN("拒绝", id, days, daye,
						selectRecruit);
				state="拒绝";
			}
			request.setAttribute("state", state);
		} else {
			int id = new PersonalinformationDAO().findIDByMail((String) session
					.getAttribute("mailbox"));
			if (opera.equals("all")) {
				applications = applicationDAO.findNewsByIdP(id);
			} else if (opera.equals("notsee")) {
				applications = applicationDAO.findNewsByStateP("未查看", id);
			} else if (opera.equals("see")) {
				applications = applicationDAO.findNewsByStateP("已查看", id);
			} else if (opera.equals("invite")) {
				applications = applicationDAO.findNewsByStateP("邀请", id);
			} else if (opera.equals("refuse")) {
				applications = applicationDAO.findNewsByStateP("拒绝", id);
			}

		}
		if (user == 2) {

			if (aerr!=null) {
				result = "-共找到" + aerr.size() + "条信息-";

				for (int i = 0; i < aerr.size(); i++) {
					aerr.get(i).setIdResume(
							dao.OnesearchByID(aerr.get(i).getIdResume())
									.getIDResume());
					System.out.println(aerr.get(i).getIdResume());
					System.out
							.println(aerr.get(i).getIdEnterpriseRecruitment());

				}
				
				

			} else {
			}
		}
		// ---------------------------------分页------------------------------------------------------
		if (aerr != null) {
			result = "-共找到" + aerr.size() + "条信息-";

			System.out.println(result);
		}
        if(paging(aerr)!=null)
        {
		aerr=paging(aerr).get("1");
		
		System.out.println("分割成功-----------------------------");
        }

		// ---------------------------------分页------------------------------------------------------
		if (user == 1) {
			if (applications.size() != 0) {

				for (int i = 0; i < applications.size(); i++) {
					applications.get(i)
							.setResumename(
									dao.OnesearchByID(
											applications.get(i).getIdResume())
											.getName());

				}
			} else {
			}
		}
		  
		
		request.setAttribute("applitionlist", applications);
		session.setAttribute("result", result);
		request.setAttribute("AERR", aerr);
		if (user == 1)

			return "user1";
		else
			return "user2";
		// }
		// return "error";
	}

}
