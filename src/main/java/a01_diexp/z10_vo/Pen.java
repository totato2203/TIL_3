package a01_diexp.z10_vo;

import org.springframework.stereotype.Component;

@Component
public class Pen {
	private String color;
	private String made;
	public Pen() {}
	public Pen(String color, String made) {
		this.color = color;
		this.made = made;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getMade() {
		return made;
	}
	public void setMade(String made) {
		this.made = made;
	}
	
}
