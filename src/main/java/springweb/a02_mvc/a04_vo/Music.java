package springweb.a02_mvc.a04_vo;

public class Music {
	private String mtitle;
	private String singer;
	public Music() {}
	public Music(String mtitle, String singer) {
		this.mtitle = mtitle;
		this.singer = singer;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	
}
