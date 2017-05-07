package common;
/**
 *�ַ����������� 
 */
public class DealString {
    /**
     * ת���ַ����� �ɡ�iso-8859-1������ת��Ϊ��������
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
	 * ���ַ���ת��Ϊuincode����
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
	 * ȥ���ַ����ĵ����ţ����� ����a��s�����a1s�Ա�Ѱ��������ŵ��ַ����������ݿ�
	 * ������
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
