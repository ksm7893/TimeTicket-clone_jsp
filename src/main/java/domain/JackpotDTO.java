package domain;

import java.sql.Date;

public class  JackpotDTO{
	private String mem_id;
	private String mem_name;
	private String mem_num;
	public JackpotDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_num() {
		return mem_num;
	}
	public void setMem_num(String mem_num) {
		this.mem_num = mem_num;
	}
	public JackpotDTO(String mem_id, String mem_name, String mem_num) {
		super();
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_num = mem_num;
	}

	
}







