package springweb.z10_homework;

import java.util.List;

import springweb.a02_mvc.a04_vo.DeptMsal;
import springweb.a02_mvc.a04_vo.Emp;

public class HW0711 {

}

//2022-07-11
//[1단계:개념] 1. mybatis와 단일 매개변수와 다중매개변수를 처리하는 방식을 기술하세요.
/*
	1. 단일 매개변수
		sql : 
			select *
			from emp
			where empno = #{empno}
		
		dao : springweb.a02_mvc.a03_dao.DaoExp01
			public Emp getDetail(int empno);
			
		mapper : resource\mapper\DaoExp01Mapper.xml
			<select id="getDetail" resultType="emp" parameterType="int">
				select *
				from emp
				where empno = #{empno}
			</select>
			
		service : springweb.a02_mvc.a02_service.EmpService
			Emp emp = dao2.getDetail(7369);
			if(emp != null)
				Systemp.out.println("사원명 : " + emp.getEname());

	2. 다중 매개변수
		sql :
			select *
			from emp
			where empno = #{empno}
			and 
 */
//[1단계:개념] 2. map으로 매개변수 처리할 때, Map의 기본 기능과 mybatis에서 처리하는 방식을 기술하세요.
/*
		sql : 
			select *
			from emp
			where 1=1
			and ename like '%' || #{ename} || '%'
			and job like '%' || #{job} || '%'
		dao :
			public List<Emp> getEmpList2(Map<String, String> map);
		mapper : map은 string과 동일하게 내장되어 지원한다.
			<select id="getEmpList2" resultType="emp" parameterType="hashMap">
				select *
				from emp
				where 1=1
				<if test="ename != null">
					and ename like '%' || #{ename} || '%'
				</if>
				<if test="job != null">
					and job like '%' || #{job} || '%'
				</if>
			</select>
		service : 
			Map<String, String> schMap = new HashMap<String, String>();
			schMap.put("ename", "A");
			schMap.put("job", "MAN");
			List<Emp> emplist2 = dao2.getEmpList2(schMap);
			System.out.println("사원정보조회(Map활용) : " + emplist2.size());
 */
//[1단계:개념] 3. mybatis에서 조건절 처리에 대한 기본 형식을 기술하세요.
/*
	<if test="조건문">
		반복문
	</if>
 */
//[1단계:확인] 4. 아래의 sql을 mybatis를 활용하여 처리하세요.
//      1) 직책을 입력하여 직책의 평균급여를 직책과 함께 데이터 가져옮
/*
	sql : 
		SELECT job, round(avg(sal)) avgsal
		FROM emp01
		WHERE job = #{job}
		GROUP BY job
	vo : JobAvg.java (새로 만든 경우 mybatis.Spring.xml에 alias 선언)
	dao : 
		public JobAvg getAvgSal(String job);
	mapper : 
		<select id="getAvgSal" resultType="jobavg" parameterType="string">
			SELECT job, round(avg(sal)) avgsal
			FROM emp01
			WHERE job = #{job}
			GROUP BY job
		</select>
	service : 
		JobAvg jobavg = dao2.getAvgSal("MANAGER");
		if(jobavg != null)
			System.out.println(jobavg.getJob() + " 직책의 평균 급여 : " + jobavg.getAvgsal());
		
 */
//      2) 급여의 범위(시작/마지막)을 지정하여 사원 정보를 가져오기
/*
	sql : 
		select *
		from emp01
		where sal between #{losal} and #{hisal}
	vo : Salgrade.java (새로 만들면 mybatis.Spring.xml에 선언)
		public Salgrade(int losal, int hisal);
	dao : 
		public List<Salgrade> schSalList(Salgrade sch);
	mapper : 
		<select id="schSalList" resultType="salgrade" parameterType="int">
			select *
			from emp01
			where sal between #{losal} and #{hisal}
		</select>
	service : 
		List<Salgrade> sallist = dao2.schSalList(new Salgrade(1000, 3000));
		if(sallist != null && sallist.size() > 0){
			System.out.println("사원정보 검색 건수 : " + sallist.size());
		}
 */
//      3) salgrade테이블의 정보를 입력 처리
/*
	sql : 
		insert into salgrade01 values(6, 10000, 14999)
		insert into salgrade01 values(#{grade}, #{losal}, #{hisal})
	vo : Salgrade.java
	dao : public void insertSalgrade(Salgrade ins);
	mapper : 
		<insert id="insertSalgrade" parameterType="salgrade">
			insert into salgrade01 values(#{grade}, #{losal}, #{hisal})
		</insert>
	service : 
		
 */
