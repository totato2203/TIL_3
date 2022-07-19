package springweb.a02_mvc.a03_dao;
// springweb.a02_mvc.a03_dao.DaoExp01


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import springweb.a02_mvc.a04_vo.Dept;
import springweb.a02_mvc.a04_vo.DeptEmp01;
import springweb.a02_mvc.a04_vo.DeptMsal;
import springweb.a02_mvc.a04_vo.Emp;
import springweb.a02_mvc.a04_vo.EmpQ;
import springweb.a02_mvc.a04_vo.JobAvg;
import springweb.a02_mvc.a04_vo.Salgrade;

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
	
	public List<EmpQ> getEmpList();
	
	public List<JobAvg> getJobAvg();
	

	public void deleteEmp(String job);
	
	public List<Emp> getEmpJob(String job);
	public void deleteQua(String div);
	public DeptMsal getDeptMaxSal(int deptno);
	
	public List<Emp> schEmpList02(Emp sch);
	public void insertEmp02(Emp ins);

	public void insertDept(Dept ins);
	
	public List<Emp> getEmpList2(Map<String, String> map);
	public List<Dept> getDeptList(Map<String, String> map);

	public JobAvg getAvgSal(String job);
	public JobAvg getAvgSalJob(String job);
	public List<Salgrade> schSalList(Salgrade sch);
	public void insertSalgrade(Salgrade ins);
	
	public Emp getDetail(int empno);
	public void updateEmp03(Emp upt);
	public void deleteEmp02(int empno); 
	
	
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
