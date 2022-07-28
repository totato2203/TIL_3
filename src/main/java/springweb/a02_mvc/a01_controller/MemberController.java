package springweb.a02_mvc.a01_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import springweb.a02_mvc.a02_service.MemberService;
import springweb.a02_mvc.a04_vo.Member;

@SessionAttributes("member")
@Controller
public class MemberController {
	@Autowired(required=false)
	private MemberService service;
	
	@ModelAttribute("member")
	public Member getMember() {
		return new Member();
	}
	// 회원가입 초기화면 a14_regMember.jsp
	// http://localhost:7080/springweb/memberReg.do
	@RequestMapping("memberReg.do")
	public String memberReg() {
		return "WEB-INF\\views\\a01_basic\\a14_regMember.jsp";
	}
	
	// ajax 처리 pageJsonReport
	@RequestMapping("hasMember.do")
	public String hasMember(@RequestParam("id") String id, Model d) {
		// 해당 회원이 있을 때 true, 없을 때 false
		d.addAttribute("hasMember", service.checkMember(id) == 0 ? false : true);
		return "pageJsonReport";
	}
	
	// 로그인 화면 a15_login.jsp
	// http://localhost:7080/springweb/loginMember.do
	@RequestMapping("loginMember.do")
	public String loginMember(@ModelAttribute("member") Member m,
			HttpServletRequest request) {
		if(m.getId() != null) {
			Member mem = service.getMember(m);
			System.out.println(m.getName());
			HttpSession session = request.getSession();
			if(mem != null) { // DB에 데이터가 있을 때 session 처리
				session.setAttribute("mem", mem);
			}
			// 로그아웃 시
			// session.removeAttribute("mem");
		}
		
		return "WEB-INF\\views\\a01_basic\\a15_login.jsp";
	}
	
}
