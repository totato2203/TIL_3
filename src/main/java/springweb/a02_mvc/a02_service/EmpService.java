package springweb.a02_mvc.a02_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a04_vo.Emp;
import springweb.a02_mvc.a03_dao.DaoExp01;
import springweb.a02_mvc.a03_dao.EmpDao;
import springweb.a02_mvc.a04_vo.Dept;
import springweb.a02_mvc.a04_vo.DeptEmp01;
import springweb.a02_mvc.a04_vo.DeptMsal;
import springweb.a02_mvc.a04_vo.JobAvg;
import springweb.a02_mvc.a04_vo.Salgrade;

// springweb.a02_mvc.a02_service.EmpService

@Service
public class EmpService {
	@Autowired(required = false)
	private EmpDao dao;
	
	@Autowired(required = false)
	private DaoExp01 dao2;
	
	public List<Emp> getEmpList(Emp sch){
		
		System.out.println("사원번호가 있는지? " + dao2.hasEmp());
		// mybatis
		// dao2 = new DaoExp01Imple();
		DeptEmp01 de = dao2.getDeptEmp();
		System.out.println("객체 생성 여부 : " + de);
		System.out.println("사원명 : " + de.getEname());
		System.out.println("부서번호 : " + de.getDname());
		
		Salgrade salg = dao2.getSalgrade();
		System.out.println("급여 등급");
		System.out.println(salg.getGrade());
		System.out.println(salg.getHisal());
		System.out.println(salg.getLosal());
		
		System.out.println("# 다중 행 데이터 확인 #");
		System.out.println(dao2.getEmpnos().get(0) + "사원정보 개수 : " + dao2.getEmpnos().size());
		System.out.println(dao2.getEnames().get(1) + "급여명 개수 : " + dao2.getEnames().size());
		System.out.println(dao2.getSalaries().get(2) + "급여 개수 : "+ dao2.getSalaries().size());
		
		System.out.println(dao2.getJobs().size() + " : " + dao2.getJobs().get(0));
		
		System.out.println("# 다중 열 / 다중 행 데이터 확인 #");
		System.out.println(dao2.getEmpList30().size());
		
		System.out.println("# 과제 4번 #");
		System.out.println("데이터 건수 : " + dao2.getEmpList().size());
		
		System.out.println("# 과제 5번 #");
		for(JobAvg av : dao2.getJobAvg()) {
			System.out.println(av.getJob() + "\t" + av.getAvgsal());
		}
		
		Emp emp = dao2.getDetail(7369);
		if(emp != null)
			System.out.println("사원명 : " + emp.getEname());
		
		System.out.println("# 사원 정보 삭제 #");
		dao2.deleteEmp("CLERK");
		
		List<Emp> jobList = dao2.getEmpJob("MANAGER");
		
		System.out.println("# 1/4분기 데이터 삭제 #");
		dao2.deleteQua("1");
		
		DeptMsal maxSalList = dao2.getDeptMaxSal(30);
		if(maxSalList != null)
			System.out.println(maxSalList.getDeptno() + "부서의 최고 급여 : " + maxSalList.getMsal());
		
		List<Emp> empSchList = dao2.schEmpList02(new Emp("CLARK", "MANAGER", 2450));
		if(empSchList != null && empSchList.size() > 0){
			System.out.println("사원정보 검색 건수 : " + empSchList.size());
		}
		System.out.println("# 사원 정보 등록 #");
		dao2.insertEmp02(new Emp(9000, "홍길동", "대리"));

		
		System.out.println("# 부서 정보 등록 #");
		dao2.insertDept(new Dept(99, "기획", "서울 홍대"));
		
		Map<String, String> schMap = new HashMap<String, String>();
		schMap.put("ename", "A");
		schMap.put("job", "MAN");
		List<Emp> emplist2 = dao2.getEmpList2(schMap);
		System.out.println("사원정보조회(Map활용) : " + emplist2.size());

		Map<String, String> schMap2 = new HashMap<String, String>();
		schMap2.put("dname", "A");
		schMap2.put("loc", "A");
	
		
		JobAvg jobavg = dao2.getAvgSal("MANAGER");
		if(jobavg != null)
			System.out.println(jobavg.getJob() + " 직책의 평균 급여 : " + jobavg.getAvgsal());
		
		List<Salgrade> sallist = dao2.schSalList(new Salgrade(1000, 3000));
		if(sallist != null && sallist.size() > 0){
			System.out.println("사원정보 검색 건수 : " + sallist.size());
		}
		
		System.out.println("# Salgrade 정보 수정 #");
		dao2.insertSalgrade(new Salgrade(6, 10000, 14999));
		
		
		return dao.getEmpList(sch);
	}
	
	public List<Emp> getEmpJob(String job){
		List<Emp> jobList = dao2.getEmpJob("MANAGER");
		
		return dao2.getEmpJob(job);
	}

	public JobAvg getAvgSalJob(String job) {
		return dao2.getAvgSalJob(job);
	}
	public DeptMsal getDeptMaxSal(int deptno) {
		return dao2.getDeptMaxSal(deptno);
	}
	
	
	public Emp getDetail(int empno) {
		return dao2.getDetail(empno);
	}

	public Emp updateEmp03(Emp upt) {
		dao2.updateEmp03(upt);
		return dao2.getDetail(upt.getEmpno());
	}
	public void deleteEmp02(int empno) {
		dao2.deleteEmp02(empno);
	}
	
	public List<Dept> getDeptList(Map map){
		return dao2.getDeptList(map);
	}
}
