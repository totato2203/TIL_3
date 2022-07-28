package springweb.a02_mvc.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.MemberDao;
import springweb.a02_mvc.a04_vo.Member;

@Service
public class MemberService {
	@Autowired(required=false)
	private MemberDao dao;
	public int checkMember(String id) {
		return dao.checkMember(id);
	}
	public Member getMember(Member m) {
		return dao.getMember(m);
	}
}
