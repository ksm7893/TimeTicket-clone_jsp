package list.service;

public class RegionDTO {
	private String reg_code;
	private String reg_name;
	
	//constructor
	public RegionDTO(String reg_code, String reg_name) {
		this.reg_code = reg_code;
		this.reg_name = reg_name;
	}
	
	public RegionDTO() {
	}
	
	//getter/setter
	public String getReg_code() {
		return reg_code;
	}
	public void setReg_code(String reg_code) {
		this.reg_code = reg_code;
	}
	public String getReg_name() {
		return reg_name;
	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	
	
	
}
