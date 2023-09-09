package section03.domain;


public class Section03DTO {
	private String tic_code;
	private String info;
	private String info_agenc;
	private String info_use;
	private String tic_pic_in;
	private String info_note;
	private String info_host;
	private String info_num;
	private String info_link;
	
	
	
	public Section03DTO() {
		super();
	}



	public Section03DTO(String tic_code, String info, String info_agenc, String info_use, String tic_pic_in,
			String info_note, String info_host, String info_num, String info_link) {
		super();
		this.tic_code = tic_code;
		this.info = info;
		this.info_agenc = info_agenc;
		this.info_use = info_use;
		this.tic_pic_in = tic_pic_in;
		this.info_note = info_note;
		this.info_host = info_host;
		this.info_num = info_num;
		this.info_link = info_link;
	}



	public String getTic_code() {
		return tic_code;
	}



	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}



	public String getInfo() {
		return info;
	}



	public void setInfo(String info) {
		this.info = info;
	}



	public String getInfo_agenc() {
		return info_agenc;
	}



	public void setInfo_agenc(String info_agenc) {
		this.info_agenc = info_agenc;
	}



	public String getInfo_use() {
		return info_use;
	}



	public void setInfo_use(String info_use) {
		this.info_use = info_use;
	}



	public String getTic_pic_in() {
		return tic_pic_in;
	}



	public void setTic_pic_in(String tic_pic_in) {
		this.tic_pic_in = tic_pic_in;
	}



	public String getInfo_note() {
		return info_note;
	}



	public void setInfo_note(String info_note) {
		this.info_note = info_note;
	}



	public String getInfo_host() {
		return info_host;
	}



	public void setInfo_host(String info_host) {
		this.info_host = info_host;
	}



	public String getInfo_num() {
		return info_num;
	}



	public void setInfo_num(String info_num) {
		this.info_num = info_num;
	}



	public String getInfo_link() {
		return info_link;
	}



	public void setInfo_link(String info_link) {
		this.info_link = info_link;
	}

}
