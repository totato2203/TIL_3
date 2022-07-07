package springweb.z10_homework;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z10_vo.Music;
import a01_diexp.z10_vo.Note;
import a01_diexp.z10_vo.Pen;

public class HW0706 {

	public static void main(String[] args) {
//		2022-07-06
//		[1단계:개념] 1. 스프링에서 컨테이너에 특정한 패키지의 자동 객체 설정을 처리할 때, 처리할 내용을 기술하세요
		/*
		해당 VO 클래스 :
			@Component 설정
		
		DI :
			<context:annotation-config/>
			<context:component-scan base-package="패키지명"/>
		 */
//		[1단계:확인] 2. 스프링 컨테이너에 z10_vo 패키지에 클래스를 등록하여, 1:1연관관계가 있는 펜과 종이 객체를 선언하고,
//		      코드상 자동 설정관계가 있게 처리하고 호출하세요
		String path = "springweb\\z10_homework\\HW0706_di.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		Pen pen = ctx.getBean("pen", Pen.class);
		pen.setColor("빨강");
		pen.setMade("모나미");
		System.out.println(pen.getColor());
		System.out.println(pen.getMade());
		Note note = ctx.getBean("note", Note.class);
		note.setKind("무제");
		note.setPen(pen);
		System.out.println(note.getKind());
		System.out.println(note.getPen());
		note.write();
		
//		[1단계:확인] 3. 공통 설정 파일을 java 폴드 밑에 msg/msg01로 설정하고, 좋아하는 음악, 가수를 설정하고,
//		      이를 vo로 만들어 호출되게 처리하여 출력결과를 확인하세요.
		Music music = ctx.getBean("music", Music.class);
		System.out.println(music.getMname());
		System.out.println(music.getSinger());
	}

}
