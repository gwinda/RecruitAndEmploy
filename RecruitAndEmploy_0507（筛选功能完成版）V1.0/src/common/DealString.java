package common;
/**
 *字符串处理公用类 
 */
public class DealString {
    /**
     * 转换字符编码 由“iso-8859-1”西文转换为简体中文
     */
	public static String toGb(String uniStr){
		String gbStr="";
		if(uniStr==null){
			uniStr="";
		}
		try{
			byte[] tempByte=uniStr.getBytes("ISO8859_1");
			gbStr=new String(tempByte,"GB2312");
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		return gbStr;
	}
	/**
	 * 把字符串转化为uincode编码
	 * @param gbStr
	 * @return
	 */
	public static String toUni(String gbStr){
		String uniStr="";
		if(gbStr==null){
			gbStr="";
		}
		try{
			byte[] tempByte=gbStr.getBytes("GB2312");
			uniStr=new String(tempByte,"ISO8859_1");
		}
		catch(Exception ex){
			
		}
		return uniStr;
	}
	/**
	 * 去掉字符串的单引号，例如 输入a‘s将输出a1s以便把包含单引号的字符串插入数据库
	 * 不报错
	 */
	public String dbEncode(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=str.replace('\'',(char) 1).trim();
			}
			catch(Exception e){
				System.err.println(e.getMessage());
				e.printStackTrace();
				return str;
			}
		}
		return str;
	}
}
