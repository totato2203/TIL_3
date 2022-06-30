package springweb.z01_vo;

public class Product001 {
	private int pno;
	private String pname;
	private int price;
	private int rcnt;
	public Product001() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product001(int pno, String pname, int price, int rcnt) {
		super();
		this.pno = pno;
		this.pname = pname; 
		this.price = price;
		this.rcnt = rcnt;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}


}