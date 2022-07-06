package a01_diexp.z07_vo;

import org.springframework.beans.factory.annotation.Value;

public class Product {
	@Value("${prod.pname}")
	private String pname;
	@Value("${prod.price}")
	private int price;
	@Value("${prod.cnt}")
	private int cnt;
	public Product() {
		// TODO Auto-generated constructor stub
	}
	public Product(String pname, int price, int cnt) {
		this.pname = pname;
		this.price = price;
		this.cnt = cnt;
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
}
