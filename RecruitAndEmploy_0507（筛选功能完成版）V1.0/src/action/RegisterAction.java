package action;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import dao.EinformationDAO;
import dao.PersonalinformationDAO;

import entity.Einformation;
import entity.Personalinformation;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport {
	
    
    private Personalinformation pinformation;
    private File upload1; // (�ڴ�ʡ�� get �� set ����)
	private Einformation einformation;

	private String upload1FileName; // ��ʡ��get��set������ ������Struts2���Զ���ֵΪ�ϴ��ļ����ļ�����
	private File upload2;
	private String upload2FileName;
       
	public String getUpload1FileName() {
		return upload1FileName;
	}



	public void setUpload1FileName(String upload1FileName) {
		this.upload1FileName = upload1FileName;
	}



	public String getUpload2FileName() {
		return upload2FileName;
	}



	public void setUpload2FileName(String upload2FileName) {
		this.upload2FileName = upload2FileName;
	}



	public File getUpload1() {
		return upload1;
	}



	public void setUpload1(File upload1) {
		this.upload1 = upload1;
	}



	public File getUpload2() {
		return upload2;
	}



	public void setUpload2(File upload2) {
		this.upload2 = upload2;
	}



	public Personalinformation getPinformation() {
		return pinformation;
	}



	public void setPinformation(Personalinformation pinformation) {
		this.pinformation = pinformation;
	}



	public Einformation getEinformation() {
		return einformation;
	}



	public void setEinformation(Einformation einformation) {
		this.einformation = einformation;
	}

   

	public String einformation() throws Exception {
		String[] str = { ".jpg", ".jpeg", ".bmp", ".gif", ".png" };
		// ��ȡ�û���¼��
		// TbUser curruser = (TbUser) getValue(SCOPE_SESSION, "curruser");
		// �޶��ļ���С��4MB

		if (upload1 == null && upload2 == null) {
			// �ļ�����
			System.out.println("try.............1");
			return "error";
		} else {
		}

		System.out.println("try.............2");
		System.out.println(upload1FileName);
		for (String s : str) {
			if (upload2FileName.endsWith(s)) {
				System.out.println("try3");

				upload2FileName = UUID.randomUUID()
						+ upload2FileName.substring(upload2FileName
								.lastIndexOf("."));
				einformation.setTrademark(upload2FileName);
				System.out.println(upload2FileName);
				String realPath = ServletActionContext.getServletContext()
						.getRealPath("/uploadpic");// ��tomcat�б���ͼƬ��ʵ��·�� ==
													// "webRoot/uploadpic/"
				File saveFile = new File(new File(realPath), upload2FileName); // �ڸ�ʵ��·����ʵ����һ���ļ�
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
					FileUtils.copyFile(upload2, saveFile);

				} catch (IOException e) {
					System.out.println("catch");
					return "error";
				}
			}
		}
				for (String s1 : str) {
					if (upload1FileName.endsWith(s1)) {
						System.out.println("try3");

						upload1FileName = UUID.randomUUID()
								+ upload1FileName.substring(upload1FileName
										.lastIndexOf("."));
						einformation.setBusinessLicense(upload1FileName);
						System.out.println(upload1FileName);
						String realPath1 = ServletActionContext
								.getServletContext().getRealPath("/uploadpic");// ��tomcat�б���ͼƬ��ʵ��·��
																				// ==
																				// "webRoot/uploadpic/"
						File saveFile1 = new File(new File(realPath1),
								upload1FileName); // �ڸ�ʵ��·����ʵ����һ���ļ�
						// �жϸ�Ŀ¼�Ƿ����
						if (!saveFile1.getParentFile().exists()) {
							saveFile1.getParentFile().mkdirs();
						}
						try {
							// ִ���ļ��ϴ�
							// FileUtils ���� org.apache.commons.io.FileUtils;
							// ��commons-io���еģ�commons-fileupload ��������
							// commons-io��ʵ���ļ��ϴΣ�ʵ���Ͼ��ǽ�һ���ļ�ת�������ļ����ж�д
							System.out.println("try");
							FileUtils.copyFile(upload1, saveFile1);

						} catch (IOException e) {
							System.out.println("catch");
							return "error";
						}
					}
				}

			
		
		EinformationDAO dao=new EinformationDAO();
		dao.add(getEinformation());
		System.out.println("OKKKKKKKKK");
		return "OK";
	}
	public String pinformation() throws Exception {  
		
		PersonalinformationDAO dao=new PersonalinformationDAO();
		dao.add(getPinformation());
		return "OK";
	
	}




	
}
		
