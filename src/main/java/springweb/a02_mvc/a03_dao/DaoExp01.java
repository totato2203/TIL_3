package springweb.a02_mvc.a03_dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import springweb.a02_mvc.a04_vo.DeptEmp01;
import springweb.a02_mvc.a04_vo.Emp;
import springweb.a02_mvc.a04_vo.Salgrade;

// springweb.a02_mvc.a03_dao.DaoExp01
@Repository
public interface DaoExp01 {

	public int getEmpCount();
	public double getEmpSal();
	public double getSalSum();
	public String getEmpJob();
	public boolean hasEmp();
	public DeptEmp01 getDeptEmp();
	public Salgrade getSalgrade();
	
	public List<String> getEnames();
	public List<Integer> getEmpnos();
	public List<Double> getSalaries();
	
	public List<String> getJobs();
	
	public List<Emp> getEmpList30();
	
	
/*
SELECT sal
FROM emp
WHERE empno = 7369;

SELECT sum(sal)
FROM emp
WHERE deptno = 10;

SELECT job
FROM emp
WHERE empno = 7499;

SELECT count(*)
FROM emp
WHERE empno = 7369

메소드 3개 추가 mapper에서 선언 처리
*/
}
