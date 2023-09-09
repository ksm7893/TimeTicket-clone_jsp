package list.service;

public class GenreDTO {
	private String gen_code;
	private String gen_name;
	
	//constructor
	public GenreDTO(String gen_code, String gen_name) {
		super();
		this.gen_code = gen_code;
		this.gen_name = gen_name;
	}
	
	//getter/setter
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
	
	
}
