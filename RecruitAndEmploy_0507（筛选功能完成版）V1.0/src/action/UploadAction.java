package action;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;




import com.opensymphony.xwork2.ActionSupport;

import dao.PersonalinformationDAO;
import entity.Personalinformation;

public class UploadAction extends ActionSupport {
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String savePath;
	private Personalinformation personalinformation;
	
	
	public Personalinformation getPersonalinformation() {
		return personalinformation;
	}
	public void setPersonalinformation(Personalinformation personalinformation) {
		this.personalinformation = personalinformation;
	}
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String execute() throws Exception{
		//判断是否存在判断文件，若有，则先进行上传图片操作在进行数据库的更新（有图片的）
		//
		if(uploadFileName!=null){//文件不为空
			System.out.println("执行");
			//随机文件名
			String newName=UUID.randomUUID()+uploadFileName.substring(uploadFileName.lastIndexOf("."));
			//以服务器的文件保存地址和随机文件名建立上传文件输出流
			FileOutputStream fos=new FileOutputStream(getSavePath()+"\\"+newName);
			FileInputStream fis=new FileInputStream(getUpload());
			byte[] buffer=new byte[1024];
			int len=0;
			while((len=fis.read(buffer))>0){
				fos.write(buffer,0,len);
			}
			setUploadFileName(newName);
			System.out.println("gg"+getSavePath()+"\\"+getUploadFileName());//输出地址文件名
			String hh=getUploadFileName();
			boolean result = false;//先判定结果是错误的
			try {						
		    	System.out.println(getPersonalinformation().getEducation());//输出检验数据是否有传输过来		    	
				PersonalinformationDAO persondao=new PersonalinformationDAO();		//实例化		
				result=persondao.updatePerson2(getPersonalinformation(),hh);//执行更新操作方法（有图片的）
				System.out.println( "更新结果"+result);//输出更新结果
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//判断更新是否成功，并返回不同的name
			if(result==true){
				return "OK";
			}
			else{
				return "ERROR";
			}
		}
	//无更新图片的操作
		boolean result = false;//默认为错
		//以下与上面差不多。少了图片的更新
		try {						
	    	System.out.println(getPersonalinformation().getEducation());	    	
			PersonalinformationDAO persondao=new PersonalinformationDAO();				
			result=persondao.updatePerson(getPersonalinformation());//执行更新（无图片）操作，返回结果
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

}
