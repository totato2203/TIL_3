package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.EmpService;
import springweb.a02_mvc.a04_vo.Emp;

@Controller
public class EmpController {
	@Autowired(required = false)
	private EmpService service;
	// http://localhost:7080/springweb/empList01.do
	
	@RequestMapping("empList01.do")
	public String empList(Emp sch, Model d) {
		d.addAttribute("empList", service.getEmpList(sch));
		return "WEB-INF\\views\\a02_mvc\\a01_empList.jsp";
	}

}

