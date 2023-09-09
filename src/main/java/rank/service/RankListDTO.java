package rank.service;

public class RankListDTO {
	private String tic_code;
	private String tic_name;
	private String tic_price;
	private String tic_prof;
	private String lcate_code;
	private String lcate_name;
	private String scate_code;
	private String scate_name;
	private String gen_code;
	private String gen_name;
	private int sale;
	private String stic_price;
	
	//constructor
	public RankListDTO(String tic_code, String tic_name, String tic_price, String tic_prof, String lcate_code,
			String lcate_name, String scate_code, String scate_name, String gen_code, String gen_name, int sale,
			String stic_price) {
		super();
		this.tic_code = tic_code;
		this.tic_name = tic_name;
		this.tic_price = tic_price;
		this.tic_prof = tic_prof;
		this.lcate_code = lcate_code;
		this.lcate_name = lcate_name;
		this.scate_code = scate_code;
		this.scate_name = scate_name;
		this.gen_code = gen_code;
		this.gen_name = gen_name;
		this.sale = sale;
		this.stic_price = stic_price;
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
	public String getTic_price() {
		return tic_price;
	}
	public void setTic_price(String tic_price) {
		this.tic_price = tic_price;
	}
	public String getTic_prof() {
		return tic_prof;
	}
	public void setTic_prof(String tic_prof) {
		this.tic_prof = tic_prof;
	}
	public String getLcate_code() {
		return lcate_code;
	}
	public void setLcate_code(String lcate_code) {
		this.lcate_code = lcate_code;
	}
	public String getLcate_name() {
		return lcate_name;
	}
	public void setLcate_name(String lcate_name) {
		this.lcate_name = lcate_name;
	}
	public String getScate_code() {
		return scate_code;
	}
	public void setScate_code(String scate_code) {
		this.scate_code = scate_code;
	}
	public String getScate_name() {
		return scate_name;
	}
	public void setScate_name(String scate_name) {
		this.scate_name = scate_name;
	}
	public String getGen_code() {
		return gen_code;
	}
	public void setGen_code(String gen_code) {
		this.gen_code = gen_code;
	}
	public String getGen_name() {
		return gen_name;
	}
	public void setGen_name(String gen_name) {
		this.gen_name = gen_name;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getStic_price() {
		return stic_price;
	}
	public void setStic_price(String stic_price) {
		this.stic_price = stic_price;
	}
	
	
}
