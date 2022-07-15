package springweb.a02_mvc.a04_vo;

public class Player {
	private String name;
	private int record;
	public Player() {}
	public Player(String name, int record) {
		this.name = name;
		this.record = record;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	
}
