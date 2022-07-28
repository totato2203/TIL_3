package springweb.a02_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {
	
	// 채팅 초기 화면
	// http://localhost:7080/springweb/chattingFrm.do
	@RequestMapping("chattingFrm.do")
	public String chattingFrm() {
		return "WEB-INF\\views\\a02_mvc\\a21_chatting.jsp"; // a21_chatting.jsp
	}
}
