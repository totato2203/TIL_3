package springweb.a02_mvc.a03_dao;

import org.springframework.stereotype.Repository;

import springweb.a02_mvc.a04_vo.BoardFile;

// springweb.a02_mvc.a03_dao.DaoExp
@Repository
public interface DaoExp {
	public void insertFile(BoardFile file);
}
