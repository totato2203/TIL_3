package springweb.a02_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a02_mvc.a04_vo.Calcu;
import springweb.a02_mvc.a04_vo.Circle;
import springweb.a02_mvc.a04_vo.Music;
import springweb.a02_mvc.a04_vo.Person02;
import springweb.a02_mvc.a04_vo.Player;
import springweb.a02_mvc.a04_vo.Product02;
import springweb.z01_vo.Member;
import springweb.z01_vo.Person;
import springweb.z01_vo.Product;

@Controller
public class AjaxController {

	// http://localhost:7080/springweb/ajax01.do
	@RequestMapping("ajax01.do")
	public String ajax01(Model d) {
		d.addAttribute("data01", "안녕하세요");
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/springweb/ajax02.do
	@RequestMapping("ajax02.do")
	public String ajax02(Model d) {
		d.addAttribute("msg", "반가워요");
		
		return "pageJsonReport";
	}

	// http://localhost:7080/springweb/ajax03.do
	@RequestMapping("ajax03.do")
	public String ajax03(Model d) {
		d.addAttribute("person", new Person("홍길동", 25, "서울 신림동"));
		// {"person", {name:"홍길동", age:25, loc:"서울 신림"}}
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/springweb/ajax04.do
	@RequestMapping("ajax04.do")
	public String ajax04(Model d) {
		d.addAttribute("product", new Product("사과", 2000, 3));
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/springweb/ajax05.do
	@RequestMapping("ajax05.do")
	public String ajax05(Person p, Model d) {
		d.addAttribute("person", p);
		return "pageJsonReport";
	}
	// $.ajax({data:"name=@@@&age=@@@&loc=@@@"})
// http://localhost:7080/springweb/ajax06.do?mtitle=보고싶었어&singer=WSG워너비
// {music:{"mtitle":"보고싶었어","singer":"WSG워너비"}}
	@RequestMapping("ajax06.do")
	public String ajax06(Music m, Model d) {
		d.addAttribute("music", m);
		return "pageJsonReport";
	}

// http://localhost:7080/springweb/ajax07.do?name=손흥민&record=10
// {scplayer:{"name":"손흥민","record":"10"}}
	@RequestMapping("ajax07.do")
	public String ajax07(Player pl, Model d) {
		d.addAttribute("player", pl);
		return "pageJsonReport";
	}
// http://localhost:7080/springweb/ajax08.do?id=himan&pw=7777
//		{"valid":true} // {"valid":false}
	@RequestMapping("ajax08.do")
	public String ajax08(Member m, Model d) {
		d.addAttribute("valid", m.getId().equals("himan") && m.getPw().equals("7777"));
		return "pageJsonReport";
	}
// ex) 회원 등록 여부 확인. 요청값을 id로 등록된 회원이면 hasMember:true, 등록 가능한 회원이면 hasMember:false
	// http://localhost:7080/springweb/ajax09.do?id=himan
	@RequestMapping("ajax09.do")
	public String ajax09(@RequestParam(value = "id", defaultValue = "") String id, Model d) {
		d.addAttribute("hasMember", id.equals("himan"));
		return "pageJsonReport";
	}
// ex1) http://localhost:7080/springweb/ajax10.do?num01=100&num02=2000
//	{"calResult":{"num01":100, "num02":2000, sum:2100}}
	/*
	1) url 패턴
	2) query string : 1개 또는 객체 결정? vo 확인
	3) vo 선언 (Calcu)
		private int num01;
		private int num02;
		private int num03;
	4) 메소드를 선언
	5) 모델데이터
		cal.setSum(cal.getNum02() + cal.getNum01());
		d.addAttribute("calResult", cal);
	 */
	@RequestMapping("ajax10.do")
	public String ajax10(Calcu cal, Model d) {
		cal.setSum(cal.getNum01() + cal.getNum02());
		d.addAttribute("calResult", cal);
		return"pageJsonReport";
	}
	
	
	// http://localhost:7080/springweb/ajax11.do?name=홍길동&height=175.5&weight=68.5
	@RequestMapping("ajax11.do")
	public String ajax11(Person02 p01, Model d) {
		d.addAttribute("p01", p01);
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/springweb/ajax12.do?radius=50.2
	@RequestMapping("ajax12.do")
	public String ajax12(@RequestParam("radius") double radius, Model d) {
		Circle circle = new Circle();
		circle.setRadius(radius);
		circle.setDimension(radius * radius * 3.14);
		
		d.addAttribute("circle", circle);
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/springweb/ajax13.do?pname=사과&price=2000&cnt=3
	@RequestMapping("ajax13.do")
	public String ajax13(Product02 prod02, Model d) {
		prod02.setSum(prod02.getPrice() * prod02.getCnt());
		// 요청값을 객체로 사용하면 ModelAttribute라는 개념에 의해서
		// 요청값 + model 처리해주는 객체가 default로 설정된다.
		// 모델어트리뷰트의 기본 default 모델명은 class명의 소문자 형태이다.
		d.addAttribute("prod02", prod02);
		return "pageJsonReport";
	}
	
	// http://localhost:7080/springweb/ajax14.do?pname=사과&price=2000&cnt=3
	@RequestMapping("ajax14.do")
	public String ajax14(@ModelAttribute("prod") Product02 prod, Model d) {
		prod.setSum(prod.getPrice() * prod.getCnt());
		// 요청값을 객체로 사용하면 ModelAttribute라는 개념에 의해서
		// 요청값 + model 처리해주는 객체가 default로 설정된다.
		// 모델어트리뷰트의 기본 default 모델명은 class명의 소문자 형태이다.
		return "pageJsonReport";
	}
	
}
