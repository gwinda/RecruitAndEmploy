package entity;

import java.sql.Timestamp;



public class Resume {
	int IDResume;//����ID���Զ����ɣ�
	private String name;//������
	private String hobby;//��Ȥ����
	private String HandsOnBackground;//��������
	private String awardSituation;//�����
	private String position;//ӦƸְλ
	private String workingPlace;//�����ص�
	int idPersonalInformation;//�û�ID(���)
	private Timestamp createTime;//����ʱ��
	private Timestamp updateTime;//����޸�ʱ��
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Resume(){}
	public Resume(String name,String hobby,String HandsOnBackground,String awardSituation,String position,String workingPlace,int idPersonalInformation){
		this.name=name;
		this.hobby=hobby;
		this.HandsOnBackground=HandsOnBackground;
		this.awardSituation=awardSituation;
		this.position=position;
		this.workingPlace=workingPlace;
		this.idPersonalInformation=idPersonalInformation;
	}
	public int getIDResume() {
		return IDResume;
	}
	public void setIDResume(int iDResume) {
		IDResume = iDResume;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getHandsOnBackground() {
		return HandsOnBackground;
	}
	public void setHandsOnBackground(String handsOnBackground) {
		HandsOnBackground = handsOnBackground;
	}
	public String getAwardSituation() {
		return awardSituation;
	}
	public void setAwardSituation(String awardSituation) {
		this.awardSituation = awardSituation;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWorkingPlace() {
		return workingPlace;
	}
	public void setWorkingPlace(String workingPlace) {
		this.workingPlace = workingPlace;
	}
	public int getIdPersonalInformation() {
		return idPersonalInformation;
	}
	public void setIdPersonalInformation(int idPersonalInformation) {
		this.idPersonalInformation = idPersonalInformation;
	}	
}
