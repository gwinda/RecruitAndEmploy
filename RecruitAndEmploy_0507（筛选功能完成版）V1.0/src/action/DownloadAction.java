package action;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.Session;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import doc.DocUtil;
import entity.Personalinformation;
import entity.Resume;

public class DownloadAction extends ActionSupport{
	private String inputPath;//代表下载文件的资源路径
	private String contentType;//文件路径类型
	private String downFileName;//下载文件名
	private String savePath; 
	
	public String getSavePath() {
		
		return savePath;
		//return ServletActionContext.getRequest().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath=savePath ;
	}
	public String getInputPath() {
		return inputPath;
	}
	public void setInputPath(String inputPath) throws Exception {
		this.inputPath = new String(inputPath.getBytes("iso-8859-1"),"gbk");
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getDownFileName() {
		return downFileName;
	}
	public void setDownFileName(String downFileName) throws Exception {
		this.downFileName =new String(downFileName .getBytes("iso-8859-1"),"gbk");;
	}
	
	
	
	String path=(String) ActionContext.getContext().getSession().get("savePath");
	
	public InputStream getFile() throws Exception{
		System.out.println("jj");
		System.out.println(path);		
		return ServletActionContext.getServletContext().getResourceAsStream("/download/"+path);
	}
	public String execute() throws Exception{
		
		return "success";
	}
}
