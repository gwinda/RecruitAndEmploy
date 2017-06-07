package entity;

import java.sql.Date;

public class Collection {
	private int Id;//递增主键
	private int idPersonalInformation;//个人主键（外）
	private int idEnterpriseRecruitment;//招聘信息主键（外）
	private String Name;//招聘信息名字
	private int IdEnterpriseInformation;
	private Date createTime;//收藏时间
	private String Company;//公司名称
	private Date endtime;//结束时间
	
	
	public String getCompany() {
		return Company;
	}
	public void setCompany(String company) {
		Company = company;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getIdEnterpriseInformation() {
		return IdEnterpriseInformation;
	}
	public void setIdEnterpriseInformation(int idEnterpriseInformation) {
		IdEnterpriseInformation = idEnterpriseInformation;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public Collection(){}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getIdPersonalInformation() {
		return idPersonalInformation;
	}
	public void setIdPersonalInformation(int idPersonalInformation) {
		this.idPersonalInformation = idPersonalInformation;
	}
	public int getIdEnterpriseRecruitment() {
		return idEnterpriseRecruitment;
	}
	public void setIdEnterpriseRecruitment(int idEnterpriseRecruitment) {
		this.idEnterpriseRecruitment = idEnterpriseRecruitment;
	}
	

}
