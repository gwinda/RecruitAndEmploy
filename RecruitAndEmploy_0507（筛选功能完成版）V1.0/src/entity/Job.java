package entity;

public class Job {
	private int id;//细分ID
	private String name;//名称
	private int industryid;//所属类型
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
