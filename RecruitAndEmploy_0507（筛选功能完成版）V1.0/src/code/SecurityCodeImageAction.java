package code;

import com.opensymphony.xwork2.ActionSupport;
import java.io.ByteArrayInputStream;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


/**
 * �ṩͼƬ��֤��
 * @version 1.0 2012/08/22
 * @author dongliyang
 */
@SuppressWarnings("serial")
public class SecurityCodeImageAction extends ActionSupport implements SessionAware{
    
    //Struts2��Map���͵�session
    private Map<String, Object> session;
    
    //ͼƬ��
    private ByteArrayInputStream imageStream;

    public ByteArrayInputStream getImageStream() {
        return imageStream;
    }

    public void setImageStream(ByteArrayInputStream imageStream) {
        this.imageStream = imageStream;
    }

    
    public String execute() throws Exception {
        //�������Hardģʽ�����Բ����ִ�Сд
//        String securityCode = SecurityCode.getSecurityCode(4,SecurityCodeLevel.Hard, false).toLowerCase();
        
        //��ȡĬ���ѶȺͳ��ȵ���֤��
        String securityCode = SecurityCode.getSecurityCode();
        imageStream = SecurityImage.getImageAsInputStream(securityCode);
        //����session��
        session.put("SESSION_SECURITY_CODE", securityCode);
        return SUCCESS;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

}
