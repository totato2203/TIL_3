package springweb.a02_mvc.a04_vo;

public class Person02 {
	private String name;
	private double height;
	private double weight;
	public Person02() {}
	public Person02(String name, double height, double weight) {
		this.name = name;
		this.height = height;
		this.weight = weight;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	
}
