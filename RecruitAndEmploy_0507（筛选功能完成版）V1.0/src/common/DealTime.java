package common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;



public class DealTime {
	private Date time;
	private String strtime;
	private SimpleDateFormat format;
	public DealTime(){
		strtime = "";
		format = null; 
	}
	/**
	 ת������Ϊ"yyyy-MM-dd"��ʽ��� 
	 */
	public String getYMD(){
		time = new Date();
		format = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
		strtime = format.format(time);
		return strtime;
	}

}
