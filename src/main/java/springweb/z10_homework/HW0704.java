package springweb.z10_homework;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Amusement;
import a01_diexp.z01_vo.Mart;
import a01_diexp.z01_vo.Note;

public class HW0704 {
	
	public static void main(String[] args) {

//		2022-07-04
//		[1단계:확인] 1. 컨테이너에 1:1관계에 있는 펜과 노트를 객체를 선언하여 처리하고, 내용을 출력하세요
		
		String path = "springweb\\z10_homework\\di_HW0704.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)을 통해 id명으로 객체를 가져온다.
		Note obj = ctx.getBean("note", Note.class);
		System.out.println("### 시작 ###");
		System.out.println("### 객체 호출 : " + obj);
		obj.write();
		
//		[1단계:개념] 2. autowire 무엇인지 기술하고, 종류를 기술하세요
		/*
		autowire(자동 주입 설정) : 스프링 빈의 요구사항과 매칭되는 어플리케이션 컨텍스트 상에서
								다른 빈을 찾아 빈 간의 의존성을 자동으로 만족시키도록 하는 수단
		종류 :
		1) no : 의존성 자동 주입이 일어나지 않게 설정
		2) byType : 할당할 type(객체)가 있으면 자동으로 주입되게 처리한다.
		3) byName : type이 있고, 기능 메소드명이 객체의 참조명과 같을 때 처리된다.
		4) constructor : 의존성 자동 주입이 생성자의 매개변수의 type으로 결정된다.
		5) autodetect : 자동으로 생성자나 기능 property로 설정이 된다.
		*/
		
//		[1단계:확인] 3. 놀이공원에 간 사람으로 1:1관계로 class를 설정하고 autowiring 옵션을 설정하여 처리하세요.
		Amusement obj2 = ctx.getBean("amusement", Amusement.class);
		System.out.println("### 시작 ###");
		System.out.println("### 객체 호출 : " + obj2);
		obj2.play();
		
//		[1단계:확인] 5. 마트와 마트에서 구매한 객체 Product 3개를 선언하고, 이 중 하나의 객체를 byName으로 설정해서 할당하게 처리
		Mart obj3 = ctx.getBean("mart", Mart.class);
		System.out.println("### 시작 ###");
		System.out.println("### 객체 호출 : " + obj3);
		obj3.buy();
		
		ctx.close();
//		[1단계:개념] 4. autowire의 옵션 중, byType과 byName의 차이점을 기본예제를 통해서 설명하세요.
		/*
		byType : 할당할 수 있는 객체가 하나만 존재할 때만 사용할 수 있는 byType을 mart 객체에 autowire를 사용하면
				할당될 객체가 하나 이상이기 때문에 에러가 발생한다.
		byName : 메소드가 set property로 product(setProduct ==> Product ==> product)인 객체에 할당되므로
				id 값이 set property(product)와 동일한 객체가 할당된다.
		*/
	}

}
