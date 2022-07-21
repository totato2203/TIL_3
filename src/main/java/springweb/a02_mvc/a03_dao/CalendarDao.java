package springweb.a02_mvc.a03_dao;
// springweb.a02_mvc.a03_dao.CalendarDao
// public List<Calendar> getCalList();

import java.util.List;

import org.springframework.stereotype.Repository;

import springweb.a02_mvc.a04_vo.Calendar;

@Repository
public interface CalendarDao {

	public List<Calendar> getCalList();
	public void insertCalendar(Calendar ins);
}
