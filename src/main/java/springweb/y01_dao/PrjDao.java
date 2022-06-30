package springweb.y01_dao;
// webprj.dao.A04_PreDAO

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import springweb.z01_vo.Emp;
import springweb.z01_vo.Member;
import springweb.z01_vo.Product001;
import springweb.z01_vo.Dept;

// DAO(Database Access Object)
// 전화기와 동일 : 연결/대화/결과를 통해 받은 데이터/종료 - 자원해제, 예외처리
public class PrjDao {
	private Connection con; // 연결 객체
	private PreparedStatement pstmt; // 대화 객체
	private ResultSet rs; // data를 받는 결과 객체 SELECT sql의 처리 결과로 활용
	public void setConn() throws SQLException { // 예외를 외부에 던져 한꺼번에 처리할 수 있게 함
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String info = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(info, "scott", "tiger");
			System.out.println("접속성공!!");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 에러 : " + e.getMessage());
		}
	}
	
	// 3. 각 기능별 메소드
	//	1) emp를 출력하는 기능메소드
	public void showEmp() {
		// 선언한 공통 연결 메소드 호출
		try {
			// 1. 필드에 선언된 private Connection con;에 객체가 생성된다.
			setConn();
			
			// 2. 대화객체 선언
			//		1) sql문 작성
			String sql = "select * from emp";
			// sql문 안에 (;)을 붙이지 않는다. (위 형태처럼 선언해야함) (sql문 복붙할 때 주의)
			//	==> DB 에러: ORA-00911: invalid character
			// 계층적으로 연관 관계로 객체가 만들어진다.
			// 드라이버 객체 ==> DB 처리는 연결객체 ==> 대화가 결과객체 (상호 간에 연동하여 객체 생성)
			
			//		2) 대화객체 생성
			pstmt = con.prepareStatement(sql);
			
			//		3) 대화객체를 통해 결과객체 생성, 매개변수로 sql문을 할당 처리한다.
			rs = pstmt.executeQuery();
			//		4) 전체 데이터 가져오기
			//			저장된 개수만큼 next()를 호출
			int cnt = 1;
			while(rs.next()) { // 행 단위로 이동되게 한다.
				System.out.print(cnt + "행\t" + rs.getInt("empno") + "\t");
				System.out.print(rs.getString("ename") + "\t");
				System.out.print(rs.getString("job") + "\t");
				System.out.print(rs.getInt("mgr") + "\t");
				System.out.print(rs.getDate("hiredate") + "\t");
				System.out.print(rs.getDouble("sal") + "\t");
				System.out.print(rs.getDouble("comm") + "\t");
				System.out.print(rs.getInt("deptno") + "\n");
				cnt++;
			}
			// 자원해제(열린 순서 반대 방향)
			rs.close();
			pstmt.close();
			con.close();
			// 예외 처리
			// 기본 예외 : DB - SQLException
			// 일반 예외 : Exception
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		}finally {
			// 예외 상관없이 처리할 내용
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	// ex) getEmpCnt()를 PreparedStatement로 처리해서 에러가 없게 하세요.
	// 단일 row sql 처리
	public int getEmpCnt() {
		int cnt = 0;
		// -----[* 핵심코드]
		String sql = "select count(*) cnt from emp";
		// 연결
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			// 하나의 데이터 결과 처리이기 때문에 바로 처리
			// ----- [* 핵심코드]
			rs.next();
			cnt = rs.getInt("cnt");
			//
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}
	
	
	// 단일 row sql 처리
	public int getEmpCnt(int deptno) {
		int cnt = 0;
		// -----[* 핵심코드]
		String sql = "select count(*) cnt from emp where deptno = " + deptno;
		// 연결
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			// 하나의 데이터 결과 처리이기 때문에 바로 처리
			// ----- [* 핵심코드]
			rs.next();
			cnt = rs.getInt("cnt");
			//
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}
	// 단일 row sql 처리
	// ex) 아래 내용을 ? mapping 되게 처리하세요.
	public int getEmpCnt(String job) {
		int cnt = 0;
		// -----[* 핵심코드]
		String sql = "select count(*) cnt from emp where job = ?";
		// 홑따옴표('') 붙이면 안 됨! (아래에서 데이터 타입을 정했기 때문)
		
		// 연결
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			// ?에 mapping될 데이터를 타입에 맞게 처리한다.
			
			pstmt.setString(1, job);
			// deptno로 연동할 데이터가 정수형이고, 첫번째 ?에 연동할 데이터
			// ?는 1부터 시작해서 증가시킨다.
			
			rs = pstmt.executeQuery();
			// 하나의 데이터 결과 처리이기 때문에 바로 처리
			// ----- [* 핵심코드]
			rs.next();
			cnt = rs.getInt("cnt");
			//
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}
	public ArrayList<Dept> getDeptList(String deptno, String loc) {
		ArrayList<Dept> deptList = new ArrayList<Dept>();
			try {
				setConn();
				String sql = "select * from dept where dname like '%'||''||'%' and loc like '%'||''||'%'";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					deptList.add(new Dept(
						rs.getInt("deptno"),
						rs.getString("dname"),
						rs.getString("loc"))
					);
				}
				//
				rs.close();
				pstmt.close();
				con.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				if(rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			return deptList;
		}
	
	public ArrayList<Emp> getEmpList(String ename) {
		ArrayList<Emp> empList = new ArrayList<Emp>();
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM emp\r\n"
					+ "WHERE ename LIKE '%' || ? || '%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ename);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				empList.add(new Emp(
					rs.getInt("empno"),
					rs.getString("ename"),
					rs.getString("job"),
					rs.getInt("mgr"),
					rs.getDate("hiredate"),
					rs.getDouble("sal"),
					rs.getDouble("comm"),
					rs.getInt("deptno"))
				);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB 에러: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return empList;
	}
	
	
	// # return 객체 설정과 키워드 검색
	
	public void insertEmp(Emp ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "INSERT INTO emp values(?, ?, ?, ?,\r\n"
					+ "	to_date(?, 'YYYY-MM-DD'), ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getEmpno());
			pstmt.setString(2, ins.getEname());
			pstmt.setString(3, ins.getJob());
			pstmt.setInt(4, ins.getMgr());
			pstmt.setString(5, ins.getHiredateS());
			pstmt.setDouble(6, ins.getSal());
			pstmt.setDouble(7,  ins.getComm());
			pstmt.setInt(8, ins.getDeptno());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB 에러: " + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
		public void updateEmp(Emp ins) {
			try {
				setConn();
				con.setAutoCommit(false);
				String sql = "UPDATE emp\r\n"
						+ "	SET ename = ?,\r\n"
						+ "		job = ?,\r\n"
						+ "		mgr = ?,\r\n"
						+ "		hiredate = to_date(?, 'YYYY-MM-DD'),\r\n"
						+ "		sal = ?,\r\n"
						+ "		comm = ?,\r\n"
						+ "		deptno = ?\r\n"
						+ "WHERE empno = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, ins.getEname());
				pstmt.setString(2, ins.getJob());
				pstmt.setInt(3, ins.getMgr());
				pstmt.setString(4, ins.getHiredateS());
				pstmt.setDouble(5, ins.getSal());
				pstmt.setDouble(6, ins.getComm());
				pstmt.setInt(7, ins.getDeptno());
				pstmt.setInt(8, ins.getEmpno());
				pstmt.executeUpdate();
				con.commit();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("DB 에러: " + e.getMessage());
				// commit 전에 예외가 발생하면 rollback 처리
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} catch (Exception e) {
				System.out.println("일반 예외 : " + e.getMessage());
			}finally {
				if(rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
			public void deleteEmp(int empno) {
				try {
					setConn();
					con.setAutoCommit(false);
					String sql = "DELETE FROM emp\r\n"
							+ "WHERE empno = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, empno);
					pstmt.executeUpdate();
					con.commit();
					pstmt.close();
					con.close();
				} catch (SQLException e) {
					System.out.println("DB 에러: " + e.getMessage());
					// commit 전에 예외가 발생하면 rollback 처리
					try {
						con.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				} catch (Exception e) {
					System.out.println("일반 예외 : " + e.getMessage());
				}finally {
					if(rs != null) {
						try {
							rs.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					if(pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					if(con != null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			}

	public ArrayList<Emp> getEmpList(Map<String, String> map) {
				ArrayList<Emp> empList = new ArrayList<Emp>();
				try {
					setConn();
					String sql = "SELECT *\r\n"
							+ "FROM emp\r\n"
							+ "WHERE ename LIKE '%' || ? || '%'\r\n"
							+ "AND job LIKE '%' || ? || '%'";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, map.get("ename"));
					pstmt.setString(2, map.get("job"));
					rs = pstmt.executeQuery();
					while(rs.next()) {
						empList.add(new Emp(
							rs.getInt("empno"),
							rs.getString("ename"),
							rs.getString("job"),
							rs.getInt("mgr"),
							rs.getDate("hiredate"),
							rs.getDouble("sal"),
							rs.getDouble("comm"),
							rs.getInt("deptno"))
						);
					}
					rs.close();
					pstmt.close();
					con.close();
				} catch (SQLException e) {
					System.out.println("DB 에러: " + e.getMessage());
				} catch (Exception e) {
					System.out.println("일반 예외 : " + e.getMessage());
				}finally {
					if(rs != null) {
						try {
							rs.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					if(pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					if(con != null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
				return empList;
			}

	public ArrayList<Emp> getEmpList2(Emp sch) {
		ArrayList<Emp> empList = new ArrayList<Emp>();
		try {
			setConn();
			String sql = "select * from emp where ename like '%' || ? || '%' and job like '%' || ? || '%'";
			// 1. 에러 대비 : sql
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			// 2. ?와 mapping 되는 데이터 개수, type(유형), null
			pstmt.setString(1, sch.getEname());
			pstmt.setString(2, sch.getJob());
			rs = pstmt.executeQuery();
			// 1. 에러 대비 : sql	System.out.println() 반드시 확인
			// 2. ?와 mapping 되는 데이터 개수, type(유형), null
			// 3. rs.getInt("empno") : select은 선택 컬럼과 타입
			while(rs.next()) {
				empList.add(new Emp(
					rs.getInt("empno"),
					rs.getString("ename"),
					rs.getString("job"),
					rs.getInt("mgr"),
					rs.getDate("hiredate"),
					rs.getDouble("sal"),
					rs.getDouble("comm"),
					rs.getInt("deptno"))
				);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB 에러: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return empList;
	}

	public ArrayList<Emp> getEmpList3(Emp sch) {
		ArrayList<Emp> empList = new ArrayList<Emp>();
		try {
			setConn();
			String sql = "select * from emp where 1=1 ";
					if(sch.getEname() != null) {
						sql += "AND ename LIKE '%' || ? || '%' \r\n";
					}
					if(sch.getJob() != null) {
						sql += "AND job LIKE '%' || ? || '%'";
					}
					
			// 1. 에러 대비 : sql
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			// 2. ?와 mapping 되는 데이터 개수, type(유형), null
			// 1. 에러 대비 : sql	System.out.println() 반드시 확인
			// 2. ?와 mapping 되는 데이터 개수, type(유형), null
			// 3. rs.getInt("empno") : select은 선택 컬럼과 타입
			int cnt = 1;
			if(sch.getEname() != null) {
				pstmt.setString(cnt++, sch.getEname());
			}
			if(sch.getJob() != null) {
				pstmt.setString(cnt++, sch.getJob());
			}
			rs = pstmt.executeQuery();
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB 에러: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return empList;
	}

	public ArrayList<Dept> getDeptList2(Dept sch) {
		ArrayList<Dept> deptList = new ArrayList<Dept>();
		try {
			setConn();
			String sql = "select * from dept where dname like '%'|| ? ||'%' and loc like '%'|| ? ||'%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getDname());
			pstmt.setString(2, sch.getLoc());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				deptList.add(new Dept(
					rs.getInt("deptno"),
					rs.getString("dname"),
					rs.getString("loc"))
				);
			}
			//
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return deptList;
	}
	
	public Emp getEmpDetail(int empno) {
		Emp emp = new Emp();
		try {
			setConn();
			String sql = "SELECT empno, ename, job, mgr,"
					+ "to_char(hiredate, 'YYYY-MM-DD') hiredateS,"
					+ "sal, comm, deptno \n"
					+ "FROM EMP\n"
					+ "WHERE empno = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				emp = new Emp(
							rs.getInt("empno"),
							rs.getString("ename"),
							rs.getString("job"),
							rs.getInt("mgr"),
							rs.getString("hiredateS"),
							rs.getDouble("sal"),
							rs.getDouble("comm"),
							rs.getInt("deptno"));
			}

			// 자원해제
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return emp;
	}
	
	public void insertDept(Dept ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "INSERT INTO DEPT values(?,?,?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ins.getDeptno());
			pstmt.setString(2, ins.getDname());
			pstmt.setString(3, ins.getLoc());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public Dept getDeptDetail(int deptno) {
		Dept dept = new Dept();
		try {
			setConn();
			String sql = "SELECT deptno, dname, loc\n"
					+ "FROM dept\n"
					+ "WHERE deptno = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dept = new Dept(
							rs.getInt("deptno"),
							rs.getString("dname"),
							rs.getString("loc")
						);
			}
			// 자원해제
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return dept;
	}
	
	public ArrayList<Member> getMemList(Member sch) {
		ArrayList<Member> memList = new ArrayList<Member>();
		try {
			setConn();
			String sql = "select * \n"
						+ "from member \n"
						+ "where id like '%'|| ? ||'%' \n"
						+ "and pw like '%'|| ? ||'%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getId());
			pstmt.setString(2, sch.getPw());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memList.add(new Member(
								rs.getString("id"),
								rs.getString("pw"),
								rs.getString("name"), 
								rs.getInt("point"),
								rs.getString("auth") )
								);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return memList;
	}

	public void insertMember(Member ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "INSERT INTO Member011 values(?,?,?,?,?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPw());
			pstmt.setString(3, ins.getName());
			pstmt.setInt(4, ins.getPoint());
			pstmt.setString(5, ins.getAuth());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public Product001 getProductDetail(int pno) {
		Product001 pd = null;
		try {
			setConn();
			String sql = "SELECT *\n"
					+ "FROM product001\n"
					+ "WHERE pno = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pd = new Product001(
							rs.getInt("pno"),
							rs.getString("pname"),
							rs.getInt("price"),
							rs.getInt("rcnt")
						);
			}
			// 자원해제
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return pd;
	}

	public ArrayList<Member> getMemList(String id, String pw) {
		ArrayList<Member> memList = new ArrayList<Member>();
		try {
			setConn();
			String sql = "select * \n"
						+ "from member \n"
						+ "where id like '%'|| ? ||'%' \n"
						+ "and pw like '%'|| ? ||'%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memList.add(new Member(
								rs.getString("id"),
								rs.getString("pw"),
								rs.getString("name"), 
								rs.getInt("point"),
								rs.getString("auth") )
								);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return memList;
	}

	public void updateDept(Dept ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "UPDATE dept\r\n"
					+ "	SET dname = ?,\r\n"
					+ "		loc = ?,\r\n"
					+ "WHERE deptno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getDname());
			pstmt.setString(2, ins.getLoc());
			pstmt.setInt(3, ins.getDeptno());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB 에러: " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static void main(String[] args) {
		// 실제는 외부에서 위 DAO의 특정한 객체를 호출하는데,
		// 그 전에 테스트로 main()에서 객체를 생성해본다.
		
		PrjDao dao = new PrjDao();
		/*
		Map<String, String> sch = new HashMap<String, String>();
		sch.put("ename", "A");
		sch.put("job", "");
		
		ArrayList<Emp> empList = dao.getEmpList(sch);
		for(Emp e : empList) {
			System.out.print(e.getEmpno() + "\t");
			System.out.print(e.getEname() + "\t");
			System.out.print(e.getJob() + "\t");
			System.out.print(e.getMgr() + "\t");
			System.out.print(e.getHiredate() + "\t");
			System.out.print(e.getComm() + "\t");
			System.out.print(e.getDeptno() + "\n");
		}
		
		dao.showEmp();
		
		System.out.println("사원정보의 개수 : " + dao.getEmpCnt());
		System.out.println("부서번호(10)별 개수 : " + dao.getEmpCnt(10));
		System.out.println("부서번호(20)별 개수 : " + dao.getEmpCnt(20));
		System.out.println("부서번호(30)별 개수 : " + dao.getEmpCnt(30));
		System.out.println("직업별 개수 : " + dao.getEmpCnt("PRESIDENT"));
		
		*/
		
		
//		dao.insertEmp(new Emp01(1002, "김철수", "차장", 7780, "2010-10-10", 3333, 100, 10));
		
//		dao.deleteEmp(7499);
		
		
		ArrayList<Member> MemList = dao.getMemList("", "");
			 for(Member m:MemList) {
			 	System.out.print(m.getId() + "\t");
			 	System.out.print(m.getPw() + "\t");
			 	System.out.print(m.getName() + "\t");
			 	System.out.print(m.getPoint() + "\t");
				System.out.print(m.getAuth() + "\n");
			}
		
		
	}

}
