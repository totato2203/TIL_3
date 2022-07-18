package springweb.a02_mvc.a04_vo;

public class Circle {
	private double radius;
	private double dimension;
	public Circle() {}
	public Circle(double radius, double dimension) {
		this.radius = radius;
		this.dimension = dimension;
	}
	public double getRadius() {
		return radius;
	}
	public void setRadius(double radius) {
		this.radius = radius;
	}
	public double getDimension() {
		return dimension;
	}
	public void setDimension(double dimension) {
		this.dimension = dimension;
	}
	
}
