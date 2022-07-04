package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Music;

public class DIExp13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di13.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)을 통해 id명으로 객체를 가져온다.
		Music m01 = ctx.getBean("m01", Music.class);
		System.out.println("### 시작 ###");
		System.out.println("### 객체 호출 : " + m01);
		System.out.println("### 객체1 호출 : " + m01.getMname());
		System.out.println("### 객체1 호출 : " + m01.getSinger());
		/*
		ex) Music 음악 제목, 가수	m01(property로 설정, m02(생성자로 설정)해서,
			xml로 객체 생성 할당하고, main()에서 호출하여 출력하세요.
		 */
		Music m02 = ctx.getBean("m02", Music.class);
		System.out.println("### 객체 호출 : " + m02);
		System.out.println("### 객체2 호출 : " + m02.getMname());
		System.out.println("### 객체2 호출 : " + m02.getSinger());
		
		ctx.close();
	}

}
