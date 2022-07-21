package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.CalendarService;
import springweb.a02_mvc.a04_vo.Calendar;

@Controller
public class FullCalendarController {
	@Autowired(required = false)
	private CalendarService service;
	// http://localhost:7080/springweb/calendar.do callist
	@RequestMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\a02_mvc\\a20_fullcalendar.jsp";
	}
	// http://localhost:7080/springweb/calList.do
	@RequestMapping("calList.do")
	public String calList(Model d) {
		d.addAttribute("callist", service.getCalList());
		return "pageJsonReport";
	}
	// http://localhost:7080/springweb/calInsert.do
	@RequestMapping("calInsert.do")
	public String calInsert(Calendar ins) {
		service.insertCalendar(ins);
		
		// 등록 후, 초기화면으로 이동
		return "redirect://calendar.do";
	}
}
