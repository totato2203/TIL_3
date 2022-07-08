package springweb.a02_mvc.a04_vo;
// springweb.a02_mvc.a04_vo.DeptEmp01

public class DeptEmp01 {
	private String dname;
	private String ename;
	private double sal;
	private String loc;
	public DeptEmp01() {}
	public DeptEmp01(String dname, String ename, double sal, String loc) {
		this.dname = dname;
		this.ename = ename;
		this.sal = sal;
		this.loc = loc;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
