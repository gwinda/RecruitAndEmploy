package entity;

import java.sql.Date;


/*
 * 个人用户的model
 * 
 */
public class Personalinformation {
	private int idPersonalInformation; //用户ID（自增）
	private String password;//密码
	private String name;//名字
	private Date birth;//出生年月
	private String sex;//性别
	private String phone;//电话
	private String mailbox;//邮箱
	private String nation;//民族
	private String householdRegister;//户籍
	private String address;//地址
	private String education;//学历
	private String school;//毕业院校
	private String politicalStatus;//政治面貌
	private String picture;//证件照
	
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Personalinformation(){}
	
	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public int getIdPersonalInformation() {
		return idPersonalInformation;
	}
	public void setIdPersonalInformation(int idPersonalInformation) {
		this.idPersonalInformation = idPersonalInformation;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMailbox() {
		return mailbox;
	}
	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getHouseholdRegister() {
		return householdRegister;
	}
	public void setHouseholdRegister(String householdRegister) {
		this.householdRegister = householdRegister;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getPoliticalStatus() {
		return politicalStatus;
	}
	public void setPoliticalStatus(String politicalStatus) {
		this.politicalStatus = politicalStatus;
	}
	
}
