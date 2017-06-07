package action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.EcollectionClassService;
import serviceImpl.EcollectionClassServiceImpl;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.EcollectionClass;

public class EcollectionClassAction implements Action{
	@Autowired
    private EcollectionClassService ecollectionClassService ;

	public EcollectionClassService getEcollectionClassService() {
		return ecollectionClassService;
	}
	public void setEcollectionClassService(
			EcollectionClassService ecollectionClassService) {
		this.ecollectionClassService = ecollectionClassService;
	}
	public String queryList(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		List<EcollectionClass> listEcollectionClass = getEcollectionClassService().queryList();
		session.setAttribute("listEcollectionClass", listEcollectionClass);
		return "SUCCESS";
	}
	
	public String create(){
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		String name;
		int eiid= (Integer) session.getAttribute("eiid");
		if(req.getParameter("text")==null||"".equals(req.getParameter("text"))){
			name="default";
		}
		else{name=req.getParameter("text");}
		String nameiso = null;
		try {
			nameiso = new String(name.getBytes("ISO-8859-1"),"utf-8");//зЊТы
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println(nameiso+eiid);
        
		EcollectionClass collectionClass=new EcollectionClass();
		collectionClass.setEiid(eiid);
		collectionClass.setName(nameiso);
		getEcollectionClassService().create(collectionClass);
		List<EcollectionClass> listEcollectionClass = getEcollectionClassService().queryList();
		session.setAttribute("listEcollectionClass", listEcollectionClass);
		return "SUCCESS";
	}
	
	public String update(){
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		int id= Integer.parseInt(req.getParameter("id"));
		String name;
		if(req.getParameter("text")==null||"".equals(req.getParameter("text"))){
			name="default";
		}
		else{name=req.getParameter("text");}
		String nameiso = null;
		try {
			nameiso = new String(name.getBytes("ISO-8859-1"),"utf-8");//зЊТы
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println(nameiso+id);
		
		EcollectionClass ecollectionClass=new EcollectionClass();
		ecollectionClass.setId(id);
		ecollectionClass.setName(nameiso);
		getEcollectionClassService().update(ecollectionClass);
		List<EcollectionClass> listEcollectionClass = getEcollectionClassService().queryList();
		session.setAttribute("listEcollectionClass", listEcollectionClass);
		return "SUCCESS";
	}
	
	public String delete(){
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		int id= Integer.parseInt(req.getParameter("id"));
		getEcollectionClassService().delete(id);
		List<EcollectionClass> listEcollectionClass = getEcollectionClassService().queryList();
		session.setAttribute("listEcollectionClass", listEcollectionClass);
		return "SUCCESS";
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return "SUCCESS";
	}
	

}
