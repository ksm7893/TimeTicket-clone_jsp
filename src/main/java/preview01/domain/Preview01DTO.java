package preview01.domain;

import java.util.Date;

public class Preview01DTO {
	private String tic_code;
	private int  total_rev;
	private Double avg_rev;
	   
	   
	   
	public Preview01DTO() {
		super();
	}



	public Preview01DTO(String tic_code, int total_rev, Double avg_rev) {
		super();
		this.tic_code = tic_code;
		this.total_rev = total_rev;
		this.avg_rev = avg_rev;
	}



	public String getTic_code() {
		return tic_code;
	}



	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}



	public int getTotal_rev() {
		return total_rev;
	}



	public void setTotal_rev(int total_rev) {
		this.total_rev = total_rev;
	}



	public Double getAvg_rev() {
		return avg_rev;
	}



	public void setAvg_rev(Double avg_rev) {
		this.avg_rev = avg_rev;
	}
	
}
