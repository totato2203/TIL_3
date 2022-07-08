package springweb.a02_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.DaoExp01;
import springweb.a02_mvc.a03_dao.EmpDao;
import springweb.a02_mvc.a04_vo.DeptEmp01;
import springweb.a02_mvc.a04_vo.Emp;
import springweb.a02_mvc.a04_vo.Salgrade;

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
		
		return dao.getEmpList(sch);
	}
}
