package a01_diexp.z03_vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("cpu01")
public class Cpu {
	private String spec;
	// source 상에 객체가 할당될 수 있게 선언
	// container에 해당 객체가 로딩되어 있을 때, 자동으로 할당할 수 있게 처리된다.
	@Autowired
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
