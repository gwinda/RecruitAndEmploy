package common;
import java.io.UnsupportedEncodingException;

public class ToGBK 
{
   public static String toGBK(String strvalue)
   {
	   try {
           if (strvalue == null) {
               return "";
           } else {
               strvalue = new String(strvalue.getBytes("gbk"),"gbk");
               return strvalue;
           }
       } catch (Exception e) {
           return "";
       }
   }
	   
	

   public static void main(String args[])
   {
	   System.out.println("�ɸ��� ��ǣ���� ��ǣ����");
	   try {
		System.out.println(new String("�ɸ��� ��ǣ���� ��ǣ����".getBytes("gbk"),"gbk"));
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   System.out.println(ToGBK.toGBK("�����Ƽ��ķۺ�ɫ"));
   }
}
