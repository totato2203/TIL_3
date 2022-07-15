package springweb.a02_mvc.a01_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a02_mvc.a04_vo.Emp;
import springweb.a02_mvc.a02_service.EmpService;
import springweb.a02_mvc.a04_vo.DeptMsal;
import springweb.a02_mvc.a04_vo.JobAvg;

@Controller
public class EmpController {
	@Autowired(required = false)
	private EmpService service;
	/*
	// http://localhost:7080/springweb/empList01.do
	
	@RequestMapping("empList01.do")
	public String empList(Emp sch, Model d) {
		d.addAttribute("empList", service.getEmpList(sch));
		return "WEB-INF\\views\\a02_mvc\\a01_empList.jsp";
	}
	// ex) http://localhost:7080/springweb/schJob.do
	// 화면
	// 직책명 검색 : [   ][검색]
	// 사원명 직책명 급여
	// WEB-INF\views\a02_mvc\a02_jobSearch.jsp
	
	// 1. EmpService에 검색하는 기능 메소드 선언, dao 호출
	// public List<Emp> getEmpJob(String job);
	
	// 2. controller 메소드 선언, 요청값 처리, 모델 데이터 처리
	
	
	// http://localhost:7080/springweb/schJob.do
	@RequestMapping("schJob.do")
	public String jobSearch(
			@RequestParam(value = "job", defaultValue = "") String job,
			Model d) {
		System.out.println("요청 : " + job);
		d.addAttribute("jobList", service.getEmpJob(job));
		return "WEB-INF\\views\\a02_mvc\\a02_jobSearch.jsp";
	}
	
	/*
	1. 초기화면 호출 : http://localhost:7080/springweb/schJob.do
	2. service단 처리 : EmpService.java
		dao 호출하여 return
		public List<Emp> getEmpJob(String job){
			return dao2.getEmpJob(job);
		}
	3. controller단 모델 설정 : EmpController.java
		d.addAttribute("jobList", service.getEmpJob(job));
	4. view(jsp) : a02_jobSearch.jsp
		1) 요청값 name="job"
		2) <c:forEach var="emp" items="${jobList}">
			<td>${emp.ename}</td><td>${emp.job}</td><td>${emp.sal}</td>
			</c:forEach>
	 
	

	
	// 2) 직책으로 평균 급여 검색
	// public JobAvg getAvgSalJob(String job);
	// http://localhost:7080/springweb/getAvgSalJob.do
	@RequestMapping("getAvgSalJob.do")
	public String getAvgSalJob(@RequestParam(value="job",
					defaultValue="") String job, Model d) {
		d.addAttribute("emp", service.getAvgSalJob(job));
		return "WEB-INF\\views\\a02_mvc\\a04_salJob.jsp";
	}
	
	// 3) 부서번호로 최고 급여 검색
	// public DeptMsal getDeptMaxSal(int deptno);
	// http://localhost:7080/springweb/deptMaxSal.do
	@RequestMapping("deptMaxSal.do")
	public String deptMaxSal(@RequestParam(value="deptno",
					defaultValue="") int deptno, Model d) {
		d.addAttribute("msal", service.getDeptMaxSal(deptno));
		return "WEB-INF\\views\\a02_mvc\\a05_deptMaxSal.jsp";
	}
	*/
	
	// 1) 사원번호로 상세 사원정보 검색
	// http://localhost:7080/springweb/getDetail.do
	@RequestMapping("getDetail.do")
	public String getDetail(@RequestParam(value="empno",
					defaultValue="0") int empno, Model d){
		d.addAttribute("emp", service.getDetail(empno));
		
		return "WEB-INF\\views\\a02_mvc\\a03_empDetail.jsp";
	}
	
	@RequestMapping("empDetail.do")
	public String empDetail(@RequestParam(value="empno",
			defaultValue="0") int empno, Model d){
		d.addAttribute("emp", service.getDetail(empno));
		
		return "WEB-INF\\views\\a02_mvc\\a03_empDetail02.jsp";
	}
	
	@RequestMapping("updateEmp03.do")
	public String updateEmp03(Emp upt, Model d) {
		System.out.println("수정 : " + upt.getEname());
		d.addAttribute("emp", service.updateEmp03(upt));
		d.addAttribute("proc", "upt");
		return "WEB-INF\\views\\a02_mvc\\a03_empDetail02.jsp";
	}
	
	@RequestMapping("deleteEmp02.do")
	public String deleteEmp02(@RequestParam("empno") int empno, Model d) {
		System.out.println("삭제 : " + empno);
		service.deleteEmp02(empno);
		d.addAttribute("proc", "del");
		return "WEB-INF\\views\\a02_mvc\\a03_empDetail02.jsp";
	}

	// http://localhost:7080/springweb/empList02.do
	@RequestMapping("empList02.do")
	public String ajaxExp() {
		return "WEB-INF\\views\\a02_mvc\\a07_empAjax.jsp";
	}
	
	
	// http://localhost:7080/springweb/ajaxEmp.do
	// ename=안녕맨&job=사원
	@RequestMapping("ajaxEmp.do")
	public String ajaxEmp(Emp sch, Model d) {
		d.addAttribute("empList", service.getEmpList(sch));

		return "pageJsonReport";
	}
	
	// http://localhost:7080/springweb/ajaxDept.do
	public String ajaxDept(Model d) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("dname", "");
		map.put("loc", "");
		d.addAttribute("dlist", service.getDeptList(map));
		return "pageJsonReport";
	}
	// http://localhost:7080/springweb/deptList10.do
	@RequestMapping("deptList10.do")
	public String deptList10() {
		return "WEB-INF\\views\\a02_mvc\\a08_deptAjax.jsp";
	}
	
	// http://localhost:7080/springweb/ajaxEmpDetail.do?empno=7839
	// {emp:{empno:@@@...}}
	@RequestMapping("ajaxEmpDetail.do")
	public String ajaxEmpDetail(@RequestParam("empno") int empno, Model d) {
		d.addAttribute("emp", service.getDetail(empno));
		return "pageJsonReport";
	}
}

