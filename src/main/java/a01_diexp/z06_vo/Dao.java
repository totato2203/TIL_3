package a01_diexp.z06_vo;

// a01_diexp.z06_vo.Dao
public class Dao {
	private String jdbcDriver;
	private String url;
	private String user;
	private String pass;
	public Dao() {
		// TODO Auto-generated constructor stub
	}
	public Dao(String jdbcDriver, String user, String pass) {
		this.jdbcDriver = jdbcDriver;
		this.user = user;
		this.pass = pass;
	}
	public String getJdbcDriver() {
		return jdbcDriver;
	}
	public void setJdbcDriver(String jdbcDriver) {
		this.jdbcDriver = jdbcDriver;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
