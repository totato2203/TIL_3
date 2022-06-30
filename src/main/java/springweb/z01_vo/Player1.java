package springweb.z01_vo;

public class Player1 {
	private String playerName;
	private String rank;
	public Player1() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Player1(String playerName, String rank) {
		super();
		this.playerName = playerName;
		this.rank = rank;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	
}
