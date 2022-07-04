package a01_diexp.z01_vo;

public class Note {
	private String kind;
	private Pen pen;
	public Note() {}
	public Note(String kind) {
		this.kind = kind;
	}
	public void write() {
		System.out.print(kind + " 공책에 ");
		if(pen != null) {
			System.out.print(pen.getColor() + " 색상인 ");
			System.out.println(pen.getMade() + " 제조사에서 만든 펜을 쓰고 있습니다!");
		}else {
			System.out.println("펜을 쓰지 않고 있습니다!!");
		}
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public Pen getPen() {
		return pen;
	}
	public void setPen(Pen pen) {
		this.pen = pen;
	}
}
