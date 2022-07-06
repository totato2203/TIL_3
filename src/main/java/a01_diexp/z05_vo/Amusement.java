package a01_diexp.z05_vo;

public class Amusement {
	private String loc;
	private Person person;
	public Amusement() {}
	public Amusement(String loc) {
		this.loc = loc;
	}
	public void play() {
		System.out.print(loc + "에 위치한 놀이공원에 ");
		if(person != null) {
			System.out.print("이름이 " + person.getName() + "이고 ");
			System.out.print("연령이 " + person.getAge() + "세이며 ");
			System.out.println(person.getLoc() + " 지역에서 온 손님이 있습니다!!");
		}else {
			System.out.println("사람이 없습니다!!");
		}
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	
}
