package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z05_vo.Car;
import a01_diexp.z05_vo.CarRacer;

public class DIExp23 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di23.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)을 통해 id명으로 객체를 가져온다.
//		Car car = ctx.getBean("car", Car.class);
//		car.setCname("소나타");
//		car.setMaxSpeed(120);
		CarRacer obj = ctx.getBean("carRacer", CarRacer.class);
		System.out.println("### 시작 ###");
		System.out.println("### 객체 호출 : " + obj);
		obj.setRname("슈마허");
		obj.driving();
		
		
		ctx.close();
	}
	/*
		ex)a01_diexp.z05_vo Car, CarRacer가 autowiring 되게 처리하세요.
	 */

}
