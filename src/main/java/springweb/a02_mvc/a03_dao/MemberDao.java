package springweb.a02_mvc.a03_dao;
// springweb.a02_mvc.a03_dao.MemberDao

import org.springframework.stereotype.Repository;

import springweb.a02_mvc.a04_vo.Member;

@Repository
public interface MemberDao {
	public int checkMember(String id);
	public Member getMember(Member login);
}
