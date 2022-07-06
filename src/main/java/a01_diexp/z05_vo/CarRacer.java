package a01_diexp.z05_vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CarRacer {
	private String rname;
//	@Autowired(required = true) : default 옵션
//	자동 wiring 처리에 해당 객체가 반드시 있어서 처리되게 하는 옵션
//	객체가 없으면 에러 발생
	
//	객체가 컨테이너에 없더라도 에러가 발생하지 않게 선언
	@Autowired(required = false)
	private Car car;
	public CarRacer() {}
	public CarRacer(String rname) {
		this.rname = rname;
	}
	public void driving() {
		System.out.print(rname + " 님이 ");
		if(car != null) {
			System.out.print(car.getCname() + " 차량을 ");
			System.out.println("시속 " + car.getMaxSpeed() + "km/h로 운전하고 있습니다!!");
		}else {
			System.out.println("차를 보유하지 않았습니다!!");
		}
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public Car getCar() {
		return car;
	}
	public void setCar02(Car car) {
		this.car = car;
	}
}
