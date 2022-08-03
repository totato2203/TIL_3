package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import springweb.a02_mvc.a02_service.MailSenderService;
import springweb.a02_mvc.a04_vo.Mail;

@Controller
public class MailController {
	
	@Autowired(required=false)
	private MailSenderService service;
	
	// http://localhost:7080/springweb/mailForm.do
	@GetMapping("mailForm.do")
	public String mailForm() {
		return "WEB-INF\\views\\a02_mvc\\a22_mailForm.jsp";
	}
	@PostMapping("mailSender.do")
	public String mailSender(Mail mail, Model d) {
		d.addAttribute("msg", service.sendMail(mail));
		return "WEB-INF\\views\\a02_mvc\\a22_mailForm.jsp";
	}
}
