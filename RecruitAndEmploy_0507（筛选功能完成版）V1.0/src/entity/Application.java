package entity;

import java.sql.Date;

public class Application {
	private int idApplication;
	private Date time;
	private Date endtime;
	private String state;
	private int idResume;
	private int idEnterpriseRecruitment;
	private String ename;
	private String resumename;
	private String recruitname;
	private String remark;
	private int eiid;
	
	
	public int getEiid() {
		return eiid;
	}
	public void setEiid(int eiid) {
		this.eiid = eiid;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getResumename() {
		return resumename;
	}
	public void setResumename(String resumename) {
		this.resumename = resumename;
	}
	public String getRecruitname() {
		return recruitname;
	}
	public void setRecruitname(String recruitname) {
		this.recruitname = recruitname;
	}
	public int getIdApplication() {
		return idApplication;
	}
	public void setIdApplication(int idApplication) {
		this.idApplication = idApplication;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getIdResume() {
		return idResume;
	}
	public void setIdResume(int idResume) {
		this.idResume = idResume;
	}
	public int getIdEnterpriseRecruitment() {
		return idEnterpriseRecruitment;
	}
	public void setIdEnterpriseRecruitment(int idEnterpriseRecruitment) {
		this.idEnterpriseRecruitment = idEnterpriseRecruitment;
	}
}
