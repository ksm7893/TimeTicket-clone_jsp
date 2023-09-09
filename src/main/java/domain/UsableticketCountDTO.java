package domain;

public class UsableticketCountDTO {
	
	//1. 필드 선언
	private String mem_id;
	private int useable_tic_count;
	
	//생성자
	public UsableticketCountDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//gettersetter
	public UsableticketCountDTO(String mem_id, int useable_tic_count) {
		super();
		this.mem_id = mem_id;
		this.useable_tic_count = useable_tic_count;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getUseable_tic_count() {
		return useable_tic_count;
	}

	public void setUseable_tic_count(int useable_tic_count) {
		this.useable_tic_count = useable_tic_count;
	}


}
