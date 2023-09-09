package sale.service;

public class SaleBannerDTO {
	private String tic_code;
	private String tic_name;
	private String tic_price;
	private String stic_price;
	private int sale;
	private String tic_prof;
	
	//constructor
	public SaleBannerDTO(String tic_code, String tic_name, String tic_price, String stic_price, int sale,
			String tic_prof) {
		super();
		this.tic_code = tic_code;
		this.tic_name = tic_name;
		this.tic_price = tic_price;
		this.stic_price = stic_price;
		this.sale = sale;
		this.tic_prof = tic_prof;
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
	public String getStic_price() {
		return stic_price;
	}
	public void setStic_price(String stic_price) {
		this.stic_price = stic_price;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getTic_prof() {
		return tic_prof;
	}
	public void setTic_prof(String tic_prof) {
		this.tic_prof = tic_prof;
	}
	
	
	
}
