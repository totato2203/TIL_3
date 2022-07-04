package a01_diexp.z01_vo;

public class Car {
	private String cname;
	private int maxSpeed;
	public Car() {}
	public Car(String cname, int maxSpeed) {
		this.cname = cname;
		this.maxSpeed = maxSpeed;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getMaxSpeed() {
		return maxSpeed;
	}
	public void setMaxSpeed(int maxSpeed) {
		this.maxSpeed = maxSpeed;
	}	
}
