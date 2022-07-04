package a01_diexp.z01_vo;

public class CarRacer {
	private String rname;
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
