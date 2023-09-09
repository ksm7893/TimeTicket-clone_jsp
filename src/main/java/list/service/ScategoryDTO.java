package list.service;

public class ScategoryDTO {
	private String scate_code;
	private String lcate_code;
	private String scate_name;
	private String lcate_name;
	
	
	//constructor
	public ScategoryDTO() {
		super();
	}
	
	public ScategoryDTO(String scate_code, String lcate_code, String scate_name, String lcate_name) {
		super();
		this.scate_code = scate_code;
		this.lcate_code = lcate_code;
		this.scate_name = scate_name;
		this.lcate_name = lcate_name;
	}

	//getter / setter
	public String getScate_code() {
		return scate_code;
	}
	public void setScate_code(String scate_code) {
		this.scate_code = scate_code;
	}
	public String getLcate_code() {
		return lcate_code;
	}
	public void setLcate_code(String lcate_code) {
		this.lcate_code = lcate_code;
	}
	public String getScate_name() {
		return scate_name;
	}
	public void setScate_name(String scate_name) {
		this.scate_name = scate_name;
	}

	public String getLcate_name() {
		return lcate_name;
	}

	public void setLcate_name(String lcate_name) {
		this.lcate_name = lcate_name;
	}
	
	
}
