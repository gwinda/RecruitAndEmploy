package entity;

import java.sql.Timestamp;



public class Resume {
	int IDResume;//简历ID（自动生成）
	private String name;//简历名
	private String hobby;//兴趣爱好
	private String HandsOnBackground;//工作经验
	private String awardSituation;//获奖情况
	private String position;//应聘职位
	private String workingPlace;//工作地点
	int idPersonalInformation;//用户ID(外键)
	private Timestamp createTime;//创建时间
	private Timestamp updateTime;//最近修改时间
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
