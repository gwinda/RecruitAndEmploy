package action;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;




import com.opensymphony.xwork2.ActionSupport;

import daoImpl.PersonalinformationDAO;
import entity.Personalinformation;

public class UploadAction extends ActionSupport {
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String savePath;
	private Personalinformation personalinformation;
	private String position;
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
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
	
	public String savead() throws Exception{
		String[] str = { ".jpg", ".jpeg", ".bmp", ".gif", ".png" };
		HttpServletRequest request = ServletActionContext.getRequest();
	
		System.out.println(position);
		// ��ȡ�û���¼��
		for (String s : str) {
			if (uploadFileName.endsWith(s)) {
				System.out.println("try3");

				if(position.equals("1"))
				{
				uploadFileName = "f.jpg";
				}else if(position.equals("2"))
				{
				uploadFileName = "b.jpg";
				}
				else if(position.equals("3")){
				uploadFileName = "c.jpg";
				}
				else if(position.equals("4")){
				uploadFileName = "d.jpg";
				}
				else if(position.equals("5")){
				uploadFileName = "e.jpg";
				}
				else if(position.equals("6")){
					uploadFileName = "g.jpg";
				}
				else if(position.equals("7")){
					uploadFileName = "h.jpg";
				}
				else if(position.equals("8")){
					uploadFileName = "i.jpg";
				}
				else if(position.equals("9")){
					uploadFileName = "j.jpg";
				}
				else if(position.equals("10")){
					uploadFileName = "k.jpg";
				}
				else{uploadFileName = "e.jpg";}
	
				System.out.println(uploadFileName);
				String realPath = ServletActionContext.getServletContext()
						.getRealPath("/personPicture");// ��tomcat�б���ͼƬ��ʵ��·�� ==
													// "webRoot/uploadpic/"
				File saveFile = new File(new File(realPath), uploadFileName); // �ڸ�ʵ��·����ʵ����һ���ļ�
				// �жϸ�Ŀ¼�Ƿ����
				if (!saveFile.getParentFile().exists()) {
					saveFile.getParentFile().mkdirs();
				}
				try {
					// ִ���ļ��ϴ�
					// FileUtils ���� org.apache.commons.io.FileUtils;
					// ��commons-io���еģ�commons-fileupload ��������
					// commons-io��ʵ���ļ��ϴΣ�ʵ���Ͼ��ǽ�һ���ļ�ת�������ļ����ж�д
					System.out.println("try");
					FileUtils.copyFile(upload, saveFile);

				} catch (IOException e) {
					System.out.println("catch");
					return "ERROR";
				}
				
				

			}
		}
		return "OK";
	}
	public String execute() throws Exception{
		//�ж��Ƿ�����ж��ļ������У����Ƚ����ϴ�ͼƬ�����ڽ������ݿ�ĸ��£���ͼƬ�ģ�
		//
		if(uploadFileName!=null){//�ļ���Ϊ��
			System.out.println("ִ��");
			//����ļ���
			String newName=UUID.randomUUID()+uploadFileName.substring(uploadFileName.lastIndexOf("."));
			//�Է��������ļ������ַ������ļ��������ϴ��ļ������
			FileOutputStream fos=new FileOutputStream(getSavePath()+"\\"+newName);
			FileInputStream fis=new FileInputStream(getUpload());
			byte[] buffer=new byte[1024];
			int len=0;
			while((len=fis.read(buffer))>0){
				fos.write(buffer,0,len);
			}
			setUploadFileName(newName);
			System.out.println("gg"+getSavePath()+"\\"+getUploadFileName());//�����ַ�ļ���
			String hh=getUploadFileName();
			boolean result = false;//���ж�����Ǵ����
			try {						
		    	System.out.println(getPersonalinformation().getEducation());//������������Ƿ��д������		    	
				PersonalinformationDAO persondao=new PersonalinformationDAO();		//ʵ����		
				result=persondao.updatePerson2(getPersonalinformation(),hh);//ִ�и��²�����������ͼƬ�ģ�
				System.out.println( "���½��"+result);//������½��
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//�жϸ����Ƿ�ɹ��������ز�ͬ��name
			if(result==true){
				return "OK";
			}
			else{
				return "ERROR";
			}
		}
	//�޸���ͼƬ�Ĳ���
		boolean result = false;//Ĭ��Ϊ��
		//�����������ࡣ����ͼƬ�ĸ���
		try {						
	    	System.out.println(getPersonalinformation().getEducation());	    	
			PersonalinformationDAO persondao=new PersonalinformationDAO();				
			result=persondao.updatePerson(getPersonalinformation());//ִ�и��£���ͼƬ�����������ؽ��
				System.out.println( "���½��"+result);
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
