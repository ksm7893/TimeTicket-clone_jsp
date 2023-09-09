package domain;

public class LcateDTO {
	
	private String lcate_code;
	private String lcate_name;

	
	//기본 생성자
	public LcateDTO() {
		super();
	}
	
	public LcateDTO(String lcate_code, String lcate_name) {
		super();
		this.lcate_code = lcate_code;
		this.lcate_name = lcate_name;
	}
	
	//getter, setter

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
	

}//class LcateDTO
