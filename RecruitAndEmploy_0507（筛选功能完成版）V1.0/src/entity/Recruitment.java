package entity;

import java.sql.Date;

public class Recruitment {
	private int idIdEnterpriseRecruitment;
	private String name;                      //职位名称
	private String requirement;               //要求
	private Date startTime;                   //开始时间
	private String endTime;                    //结束时间
	private int isending;                 //是否结束
	private int position;                 //职位种类
	private String workingPlace;             //工作地点
	private int idEnterpriseInformation;      //企业信息ID
	private int salary;                      //月薪
	private int number;
	private int n;//招聘人数
	
	public int getIdEnterpriseRecruitment() {
		return idIdEnterpriseRecruitment;
	}
	public void setIdEnterpriseRecruitment(int i) {
		this.idIdEnterpriseRecruitment = i;
	}
	public Recruitment(){}
	public Recruitment(String name,String requirement,String endTime,int position,String workingPlace,int idEnterpriseInformation,int salary,int number){
		this.name=name;
		this.requirement=requirement;
		this.endTime=endTime;
		this.position=position;
		this.workingPlace=workingPlace;
		this.idEnterpriseInformation=idEnterpriseInformation;
		this.salary=salary;
		this.number=number;
		
	}
	
	
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getIsending() {
		return isending;
	}
	public void setIsending(int i) {
		this.isending = i;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getWorkingPlace() {
		return workingPlace;
	}
	public void setWorkingPlace(String workingPlace) {
		this.workingPlace = workingPlace;
	}
	public int getIdEnterpriseInformation() {
		return idEnterpriseInformation;
	}
	public void setIdEnterpriseInformation(int idEnterpriseInformation) {
		this.idEnterpriseInformation = idEnterpriseInformation;
	}

}
