package preview02.domain;

import java.util.Date;

public class Preview02DTO {
	private String tic_code;
	private int rev_point;	
	private String rev_img;
	private Date rev_date; 
	private String rev_cont;
	private String mem_name;
	
	
	
	public Preview02DTO() {
		super();
	}



	public Preview02DTO(String tic_code, int rev_point, String rev_img, Date rev_date, String rev_cont,
			String mem_name) {
		super();
		this.tic_code = tic_code;
		this.rev_point = rev_point;
		this.rev_img = rev_img;
		this.rev_date = rev_date;
		this.rev_cont = rev_cont;
		this.mem_name = mem_name;
	}



	public String getTic_code() {
		return tic_code;
	}



	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}



	public int getRev_point() {
		return rev_point;
	}



	public void setRev_point(int rev_point) {
		this.rev_point = rev_point;
	}



	public String getRev_img() {
		return rev_img;
	}



	public void setRev_img(String rev_img) {
		this.rev_img = rev_img;
	}



	public Date getRev_date() {
		return rev_date;
	}



	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}



	public String getRev_cont() {
		return rev_cont;
	}



	public void setRev_cont(String rev_cont) {
		this.rev_cont = rev_cont;
	}



	public String getMem_name() {
		return mem_name;
	}



	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
}
