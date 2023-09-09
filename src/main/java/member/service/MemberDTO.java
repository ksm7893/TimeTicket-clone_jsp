package member.service;

import java.sql.Date;

public class MemberDTO {
	private String mem_id ;
	private String mem_pw;
	private String mem_name;
	private String mem_mail;
	private String mem_num;
	private Date mem_join;
	private int mem_point;
	
	public MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_mail, String mem_num, Date mem_join,
			int mem_point) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_mail = mem_mail;
		this.mem_num = mem_num;
		this.mem_join = mem_join;
		this.mem_point = mem_point;
	}
	public MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_mail, String mem_num,
			int mem_point) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_mail = mem_mail;
		this.mem_num = mem_num;
		this.mem_point = mem_point;
	}
	public MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_mail, String mem_num) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_mail = mem_mail;
		this.mem_num = mem_num;
	}
	public MemberDTO(String mem_id) {
		super();
		this.mem_id = mem_id;
	}
	//getter/setter
	public String getmem_id() {
		return mem_id;
	}
	public void setmem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getmem_pw() {
		return mem_pw;
	}
	public void setmem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getmem_name() {
		return mem_name;
	}
	public void setmem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getmem_mail() {
		return mem_mail;
	}
	public void setmem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	public String getmem_num() {
		return mem_num;
	}
	public void setmem_num(String mem_num) {
		this.mem_num = mem_num;
	}
	public Date getmem_join() {
		return mem_join;
	}
	public void setmem_join(Date mem_join) {
		this.mem_join = mem_join;
	}
	public int getmem_point() {
		return mem_point;
	}
	public void setmem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	
	
}
