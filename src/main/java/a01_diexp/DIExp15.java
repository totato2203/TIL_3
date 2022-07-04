package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.CarRacer;

public class DIExp15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di15.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)을 통해 id명으로 객체를 가져온다.
		CarRacer obj = ctx.getBean("cracer", CarRacer.class);
		System.out.println("### 시작 ###");
		System.out.println("### 객체 호출 : " + obj);
		obj.driving();
		
		ctx.close();
		
		/*
		ex) 1:1 관계 설정과 함께 컨테이너에서 호출하여 처리하기
			Car : 자동차명/최고속도, CarRacer : 운전자명, Car, driving() : @@가 자동차를 운행하다.
		 */
	}

}
