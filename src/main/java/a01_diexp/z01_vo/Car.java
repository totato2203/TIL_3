package a01_diexp.z01_vo;

import org.springframework.stereotype.Component;

// a01_diexp.z01_vo.Car
// 클래스를 만들고 마지막에는 ctrl + s
@Component
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
