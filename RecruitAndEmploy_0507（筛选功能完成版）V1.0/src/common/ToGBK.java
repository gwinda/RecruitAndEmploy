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
	   System.out.println("可耕地 魂牵梦萦 魂牵梦萦");
	   try {
		System.out.println(new String("可耕地 魂牵梦萦 魂牵梦萦".getBytes("gbk"),"gbk"));
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   System.out.println(ToGBK.toGBK("发生科技的粉红色"));
   }
}
