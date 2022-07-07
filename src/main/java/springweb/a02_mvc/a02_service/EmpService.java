package springweb.a02_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.EmpDao;
import springweb.a02_mvc.a04_vo.Emp;

@Service
public class EmpService {
	@Autowired(required = false)
	private EmpDao dao;
	
	public List<Emp> getEmpList(Emp sch){
		return dao.getEmpList(sch);
	}
}
