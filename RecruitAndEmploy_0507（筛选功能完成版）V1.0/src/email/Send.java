package email;

import java.util.Date;

import javax.mail.Session;

import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import entity.Einformation;

public class Send {
	 // �����˵� ���� �� ���루�滻Ϊ�Լ�����������룩
    // PS: ĳЩ���������Ϊ���������䱾������İ�ȫ�ԣ��� SMTP �ͻ��������˶������루�е������Ϊ����Ȩ�롱��, 
    //     ���ڿ����˶������������, ����������������ʹ������������루��Ȩ�룩��
    public static String myEmailAccount = "617575430@qq.com";
    public static String myEmailPassword = "brjfnrvmqkabbdad";

    // ����������� SMTP ��������ַ, ����׼ȷ, ��ͬ�ʼ���������ַ��ͬ, һ��(ֻ��һ��, ���Ǿ���)��ʽΪ: smtp.xxx.com
    // ����163����� SMTP ��������ַΪ: smtp.163.com
    public static String myEmailSMTPHost = "smtp.qq.com";
	public void send(Einformation einformation,String receiveMailAccount,int result)throws Exception{
   

    // �ռ������䣨�滻Ϊ�Լ�֪������Ч���䣩
   // String receiveMailAccount = "m15219605797@163.com";

    /*public static void main(String[] args) throws Exception {*/
        // 1. ������������, ���������ʼ��������Ĳ�������
        //Properties props = new Properties();                    // ��������
		
		try{
    	java.util.Properties props = new java.util.Properties();
    	//props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.transport.protocol", "smtp");   // ʹ�õ�Э�飨JavaMail�淶Ҫ��
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // �����˵������ SMTP ��������ַ
        props.setProperty("mail.smtp.auth", "true");            // ��Ҫ������֤

        // PS: ĳЩ���������Ҫ�� SMTP ������Ҫʹ�� SSL ��ȫ��֤ (Ϊ����߰�ȫ��, ����֧��SSL����, Ҳ�����Լ�����),
        //     ����޷������ʼ�������, ��ϸ�鿴����̨��ӡ�� log, ����������� ������ʧ��, Ҫ�� SSL ��ȫ���ӡ� �ȴ���,
        //     ������ /* ... */ ֮���ע�ʹ���, ���� SSL ��ȫ���ӡ�
        /*
        // SMTP �������Ķ˿� (�� SSL ���ӵĶ˿�һ��Ĭ��Ϊ 25, ���Բ����, ��������� SSL ����,
        //                  ��Ҫ��Ϊ��Ӧ����� SMTP �������Ķ˿�, ����ɲ鿴��Ӧ�������İ���,
        // 
         *                  QQ�����SMTP(SLL)�˿�Ϊ465��587, ������������ȥ�鿴)
         */
        final String smtpPort = "465";
     
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);
        

        // 2. �������ô����Ự����, ���ں��ʼ�����������
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);      
        MimeMessage message=null;// ����Ϊdebugģʽ, ���Բ鿴��ϸ�ķ��� log
        if(result==1){
        // 3. ����һ���ʼ�
        	message = createMimeMessage1(einformation,session, myEmailAccount, receiveMailAccount);
        }else{
        	 message = createMimeMessage0(session, myEmailAccount, receiveMailAccount);
        }
        // 4. ���� Session ��ȡ�ʼ��������
        Transport transport = session.getTransport();

        // 5. ʹ�� �����˺� �� ���� �����ʼ�������, ������֤����������� message �еķ���������һ��, ���򱨴�
        // 
        //    PS_01: �ɰܵ��жϹؼ��ڴ�һ��, ������ӷ�����ʧ��, �����ڿ���̨�����Ӧʧ��ԭ��� log,
        //           ��ϸ�鿴ʧ��ԭ��, ��Щ����������᷵�ش������鿴�������͵�����, ���ݸ����Ĵ���
        //           ���͵���Ӧ�ʼ��������İ�����վ�ϲ鿴����ʧ��ԭ��
        //
        //    PS_02: ����ʧ�ܵ�ԭ��ͨ��Ϊ���¼���, ��ϸ������:
        //           (1) ����û�п��� SMTP ����;
        //           (2) �����������, ����ĳЩ���俪���˶�������;
        //           (3) ���������Ҫ�����Ҫʹ�� SSL ��ȫ����;
        //           (4) �������Ƶ��������ԭ��, ���ʼ��������ܾ�����;
        //           (5) ������ϼ��㶼ȷ������, ���ʼ���������վ���Ұ�����
        //
        //    PS_03: ��ϸ��log, ���濴log, ����log, ����ԭ����log��˵����
        transport.connect(myEmailAccount, myEmailPassword);

        // 6. �����ʼ�, �������е��ռ���ַ, message.getAllRecipients() ��ȡ�������ڴ����ʼ�����ʱ��ӵ������ռ���, ������, ������
        transport.sendMessage(message, message.getAllRecipients());

        // 7. �ر�����
        transport.close();
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
 
	}

    /**
     * ����һ��ֻ�����ı��ļ��ʼ�
     *
     * @param session �ͷ����������ĻỰ
     * @param sendMail ����������
     * @param receiveMail �ռ�������
     * @return
     * @throws Exception
     */
    public static MimeMessage createMimeMessage0(Session session, String sendMail, String receiveMail) throws Exception {
        // 1. ����һ���ʼ�
        MimeMessage message = new MimeMessage(session);

        // 2. From: ������
        message.setFrom(new InternetAddress(sendMail, "�麣�˲ſ�", "UTF-8"));

        // 3. To: �ռ��ˣ��������Ӷ���ռ��ˡ����͡����ͣ�
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "��ҵ�û�", "UTF-8"));

        // 4. Subject: �ʼ�����
        message.setSubject("��ҵ�˺�ע����֤���", "UTF-8");

        // 5. Content: �ʼ����ģ�����ʹ��html��ǩ��
        message.setContent("���, ���ע��ʧ����Ŷ���볢��������֤����ϵ����Ա����������", "text/html;charset=UTF-8");

        // 6. ���÷���ʱ��
        message.setSentDate(new Date());

        // 7. ��������
        message.saveChanges();

        return message;
    }
    public static MimeMessage createMimeMessage1(Einformation einformation,Session session, String sendMail, String receiveMail) throws Exception {
        // 1. ����һ���ʼ�
        MimeMessage message = new MimeMessage(session);

        // 2. From: ������
        message.setFrom(new InternetAddress(sendMail, "�麣�˲ſ�", "UTF-8"));

        // 3. To: �ռ��ˣ��������Ӷ���ռ��ˡ����͡����ͣ�
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "��ҵ�û�", "UTF-8"));

        // 4. Subject: �ʼ�����
        message.setSubject("��ҵ�˺�ע����֤���", "UTF-8");

        // 5. Content: �ʼ����ģ�����ʹ��html��ǩ��
        message.setContent( einformation.getName()+"���,��ϲ���������麣�˲ſ��ע�������Ѿ�ͨ��<br>��ĵ�¼�˺�Ϊ��"+einformation.getMailbox()+"<br>��������Ϊ��"+einformation.getPassword()+"|||�����Ʊ��档<br>������������ӿ��������Ƹ֮�á�����<br> <a href=''>����ҽ�ȥ�麣�˲ſ�</a>", "text/html;charset=UTF-8");

        // 6. ���÷���ʱ��
        message.setSentDate(new Date());

        // 7. ��������
        message.saveChanges();

        return message;
    }
}