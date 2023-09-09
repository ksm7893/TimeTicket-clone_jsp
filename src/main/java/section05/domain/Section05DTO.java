package section05.domain;

import java.util.Date;

public class Section05DTO {
	private String tic_code;
	private String ref_rule;
	private String ref_cau;
	private String ref_way;
	
	
	
	public Section05DTO() {
		super();
	}



	public Section05DTO(String tic_code, String ref_rule, String ref_cau, String ref_way) {
		super();
		this.tic_code = tic_code;
		this.ref_rule = ref_rule;
		this.ref_cau = ref_cau;
		this.ref_way = ref_way;
	}



	public String getTic_code() {
		return tic_code;
	}



	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}



	public String getRef_rule() {
		return ref_rule;
	}



	public void setRef_rule(String ref_rule) {
		this.ref_rule = ref_rule;
	}



	public String getRef_cau() {
		return ref_cau;
	}



	public void setRef_cau(String ref_cau) {
		this.ref_cau = ref_cau;
	}



	public String getRef_way() {
		return ref_way;
	}



	public void setRef_way(String ref_way) {
		this.ref_way = ref_way;
	}	

}
