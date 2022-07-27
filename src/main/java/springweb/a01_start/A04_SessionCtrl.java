package springweb.a01_start;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import springweb.z01_vo.Member;
import springweb.z01_vo.Product;

@Controller
@SessionAttributes("member") // spring에서 session 설정 1
public class A04_SessionCtrl {
	// session으로 설정할 객체를 ModelAttribute로 설정한다.
	@ModelAttribute("member")
	public Member getMember() {
		return new Member();
	}
	// http://localhost:7080/springweb/login77.do
	@RequestMapping("login77.do")
	public String login77() {
		return "WEB-INF\\views\\a01_basic\\a11_login.jsp"; // a11_login.jsp
	}
	@RequestMapping("login88.do")
	public String login88(@ModelAttribute("member") Member m, Model d) {
		String page = "a11_login.jsp";
		if(m.getId().equals("himan") && m.getPw().equals("8888")) {
			m.setName("홍길동");
			m.setAuth("관리자");
			m.setPoint(10000);
			page = "a12_main.jsp";
			d.addAttribute("loginMsg", "로그인 성공");
		}else {
			d.addAttribute("loginMsg", "로그인 실패");
		}
		return "WEB-INF\\views\\a01_basic\\" + page; // a12_main.jsp
	}
	@RequestMapping("menu01.do")
	public String main() {
		return "WEB-INF\\views\\a01_basic\\a13_menu01.jsp"; // a13_menu01.jsp
	}
	
	
	// http://localhost:7080/springweb/sessionexp01.do
	@RequestMapping("sessionexp01.do")
	public String sessionexp01(HttpServletRequest request) {
		HttpSession session =  request.getSession();
		session.setAttribute("m01", new Member("홍길동", "관리자"));
		return "WEB-INF\\views\\a01_basic\\a10_session01.jsp";
	}

	@RequestMapping("sessionexp02.do")
	public String sessionexp02() {
		
		return "WEB-INF\\views\\a01_basic\\a10_session02.jsp";
	}
	
	// http://localhost:7080/springweb/callSession03.do
	@RequestMapping("callSession03.do")
	public String sessionexp03(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("prod", new Product("사과", 2000, 3));
		return "WEB-INF\\views\\a01_basic\\a10_session03.jsp";
	}

	@RequestMapping("callSession04.do")
	public String sessionexp04() {
		
		return "WEB-INF\\views\\a01_basic\\a10_session04.jsp";
	}
}
