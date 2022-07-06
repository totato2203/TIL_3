package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z06_vo.Dao;
import a01_diexp.z06_vo.FileLoad;
import a01_diexp.z06_vo.Person;

public class DIExp24 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di24.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)을 통해 id명으로 객체를 가져온다.
		Dao dao = ctx.getBean("dao", Dao.class);
		System.out.println("### 시작 ###");
		System.out.println("### 객체 호출 : " + dao);
		System.out.println(dao.getJdbcDriver());
		System.out.println(dao.getUrl());
		System.out.println(dao.getUser());
		System.out.println(dao.getPass());
		
		Person person = ctx.getBean("person", Person.class);
		System.out.println(person.getName());
		System.out.println(person.getAge());
		System.out.println(person.getLoc());
		
		FileLoad file01 = ctx.getBean("file01", FileLoad.class);
		file01.setTitle("업로드파일");
		System.out.println("파일 경로 : " + file01.getRepository());
		
		ctx.close();
		
		/*
		ex) config에 이름, 나이, 사는 곳 (영문)key=value
		di24.xml에 config에서 선언된 내용을 할당하고,
		Person 객체를 호출하여 출력하세요.
		 */
	}

}
