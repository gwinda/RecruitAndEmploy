package entity;

public class Job {
	private int id;//ϸ��ID
	private String name;//����
	private int industryid;//��������
	public Job(){}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIndustryid() {
		return industryid;
	}
	public void setIndustryid(int industryid) {
		this.industryid = industryid;
	}
	
}
