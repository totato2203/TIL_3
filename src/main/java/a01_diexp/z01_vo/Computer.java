package a01_diexp.z01_vo;

public class Computer {
	private String kind;
	private Cpu cpu;
	public Computer() {}
	public Computer(String kind) {
		this.kind = kind;
	}
	public void checkComInfo() {
		System.out.print(kind + " 컴퓨터는 ");
		if(cpu != null) {
			System.out.print(cpu.getSpec() + "의 사양을 갖고 있고 ");
			System.out.println(cpu.getMade() + " 제조사에서 만들어진 CPU가 장착되어 있습니다!!");
		}else {
			System.out.println("CPU가 장착되어 있지 않습니다!!");
		}
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public Cpu getCpu() {
		return cpu;
	}
	public void setCpu(Cpu cpu) {
		this.cpu = cpu;
	}
	
}
