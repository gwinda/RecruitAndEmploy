package action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;


import service.EcollectionService;

import com.opensymphony.xwork2.Action;

import domain.Ecollection;


public class EcollectionAction implements Action{

	@Autowired
    private EcollectionService ecollectionService ;

	
	public EcollectionService getEcollectionService() {
		return ecollectionService;
	}

	public void setEcollectionService(EcollectionService ecollectionService) {
		this.ecollectionService = ecollectionService;
	}

	public String queryList(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		int id = Integer.parseInt(req.getParameter("classid"));
		System.out.println(id+"----EcollectionAction ");
		List<Ecollection> listEcollection = getEcollectionService().queryList(id);
		req.setAttribute("listEcollection", listEcollection);
		session.setAttribute("classid", id);
		return "SUCCESS";
	}
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return "SUCCESS";
	}
	public String delete(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		int classid=(Integer) session.getAttribute("classid");
		int id = Integer.parseInt(req.getParameter("id"));
		getEcollectionService().deleteone(id);
		List<Ecollection> listEcollection = getEcollectionService().queryList(classid);
		req.setAttribute("listEcollection", listEcollection);
	
		return "SUCCESS";
	}
	
	

}
