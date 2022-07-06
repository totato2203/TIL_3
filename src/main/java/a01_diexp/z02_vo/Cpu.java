package a01_diexp.z02_vo;

import org.springframework.stereotype.Component;

@Component
public class Cpu {
	private String spec;
	private String made;
	public Cpu() {}
	public Cpu(String spec, String made) {
		this.spec = spec;
		this.made = made;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getMade() {
		return made;
	}
	public void setMade(String made) {
		this.made = made;
	}
}
