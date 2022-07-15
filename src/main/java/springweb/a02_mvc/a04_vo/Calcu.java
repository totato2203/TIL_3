package springweb.a02_mvc.a04_vo;

public class Calcu {
	private int num01;
	private int num02;
	private int sum;
	public Calcu() {}
	public Calcu(int num01, int num02, int sum) {
		this.num01 = num01;
		this.num02 = num02;
		this.sum = sum;
	}
	public int getNum01() {
		return num01;
	}
	public void setNum01(int num01) {
		this.num01 = num01;
	}
	public int getNum02() {
		return num02;
	}
	public void setNum02(int num02) {
		this.num02 = num02;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
}
