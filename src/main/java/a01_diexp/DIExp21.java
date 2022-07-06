package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z03_vo.Cpu;
import a01_diexp.z03_vo.Person;

public class DIExp21 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di21.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)을 통해 id명으로 객체를 가져온다.
		Person obj = ctx.getBean("person", Person.class);
		Cpu obj2 = ctx.getBean("cpu01", Cpu.class);
		System.out.println("### 시작 ###");
		System.out.println("### 객체 호출 : " + obj);
		obj.setName("김철수");
		obj.setAge(20);
		obj.setLoc("서울");
		// 설정된 내용을 객체들 간에 자동 autowiring이 안 되어 있기에
		// 직접적으로 코드를 통해 처리해야 한다.
		System.out.println(obj.getName());
		System.out.println(obj.getAge());
		System.out.println(obj.getLoc());
		System.out.println("### 객체 호출 : " + obj2);
		
		ctx.close();
	}

}
