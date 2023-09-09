package rank.service;

public class RankDTO {
	private String tic_code;
	private String tic_name;
	private String tic_prof;
	private int booksum;
	private int bookrank;
	
	//constructor
	public RankDTO(String tic_code, String tic_name, String tic_prof, int booksum, int bookrank) {
		super();
		this.tic_code = tic_code;
		this.tic_name = tic_name;
		this.tic_prof = tic_prof;
		this.booksum = booksum;
		this.bookrank = bookrank;
	}
	
	//getter/setter
	public String getTic_code() {
		return tic_code;
	}
	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}
	public String getTic_name() {
		return tic_name;
	}
	public void setTic_name(String tic_name) {
		this.tic_name = tic_name;
	}
	public String getTic_prof() {
		return tic_prof;
	}
	public void setTic_prof(String tic_prof) {
		this.tic_prof = tic_prof;
	}
	public int getBooksum() {
		return booksum;
	}
	public void setBooksum(int booksum) {
		this.booksum = booksum;
	}
	public int getBookrank() {
		return bookrank;
	}
	public void setBookrank(int bookrank) {
		this.bookrank = bookrank;
	}
}
