package todaysale.domain;

import java.util.Date;

public class TodaysaleDTO {
	private String tic_code;
	private String gwon_name;
	private int gwon_sale;
	private String tds_fulltime;
	private String tds_time;
	private String tds_minute;
	private String tds_second;
	private Date regi_etime;
	
	
	
	public TodaysaleDTO() {
		super();
	}



	public TodaysaleDTO(String tic_code, String gwon_name, int gwon_sale, String tds_fulltime, String tds_time,
			String tds_minute, String tds_second, Date regi_etime) {
		super();
		this.tic_code = tic_code;
		this.gwon_name = gwon_name;
		this.gwon_sale = gwon_sale;
		this.tds_fulltime = tds_fulltime;
		this.tds_time = tds_time;
		this.tds_minute = tds_minute;
		this.tds_second = tds_second;
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



	public String getTds_fulltime() {
		return tds_fulltime;
	}



	public void setTds_fulltime(String tds_fulltime) {
		this.tds_fulltime = tds_fulltime;
	}



	public String getTds_time() {
		return tds_time;
	}



	public void setTds_time(String tds_time) {
		this.tds_time = tds_time;
	}



	public String getTds_minute() {
		return tds_minute;
	}



	public void setTds_minute(String tds_minute) {
		this.tds_minute = tds_minute;
	}



	public String getTds_second() {
		return tds_second;
	}



	public void setTds_second(String tds_second) {
		this.tds_second = tds_second;
	}



	public Date getRegi_etime() {
		return regi_etime;
	}



	public void setRegi_etime(Date regi_etime) {
		this.regi_etime = regi_etime;
	}
	
}
