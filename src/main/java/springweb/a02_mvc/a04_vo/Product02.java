package springweb.a02_mvc.a04_vo;

public class Product02 {
	private String pname;
	private int price;
	private int cnt;
	private int sum;
	public Product02() {}
	public Product02(String pname, int price, int cnt, int sum) {
		this.pname = pname;
		this.price = price;
		this.cnt = cnt;
		this.sum = sum;
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
}
