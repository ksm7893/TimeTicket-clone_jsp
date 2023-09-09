package timesale.domain;

import java.util.Date;

public class TimesaleDTO {
	private String tic_code;
	private String gwon_name;
	private int gwon_sale;
	private String ts_etime;
	private Date regi_etime;

	
	
	public TimesaleDTO() {
		super();
	}

	

	public TimesaleDTO(String tic_code, String gwon_name, int gwon_sale, String ts_etime, Date regi_etime) {
		super();
		this.tic_code = tic_code;
		this.gwon_name = gwon_name;
		this.gwon_sale = gwon_sale;
		this.ts_etime = ts_etime;
		this.regi_etime = regi_etime;
	}



	public String getTic_code() {
		return tic_code;
	}



	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}



	public String getGwon_name() {
		return gwon_name;
	}



	public void setGwon_name(String gwon_name) {
		this.gwon_name = gwon_name;
	}



	public int getGwon_sale() {
		return gwon_sale;
	}



	public void setGwon_sale(int gwon_sale) {
		this.gwon_sale = gwon_sale;
	}



	public String getTs_etime() {
		return ts_etime;
	}



	public void setTs_etime(String ts_etime) {
		this.ts_etime = ts_etime;
	}



	public Date getRegi_etime() {
		return regi_etime;
	}



	public void setRegi_etime(Date regi_etime) {
		this.regi_etime = regi_etime;
	}

}
