package entity;

public class Collection {
	private int Id;//��������
	private int idPersonalInformation;//�����������⣩
	private int idEnterpriseRecruitment;//��Ƹ��Ϣ�������⣩
	private String Name;//��Ƹ��Ϣ����
	
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
