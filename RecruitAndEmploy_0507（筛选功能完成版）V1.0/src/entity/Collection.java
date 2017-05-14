package entity;

public class Collection {
	private int Id;//递增主键
	private int idPersonalInformation;//个人主键（外）
	private int idEnterpriseRecruitment;//招聘信息主键（外）
	private String Name;//招聘信息名字
	
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
