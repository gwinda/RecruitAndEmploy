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
	 转换日期为"yyyy-MM-dd"格式输出 
	 */
	public String getYMD(){
		time = new Date();
		format = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
		strtime = format.format(time);
		return strtime;
	}

}
