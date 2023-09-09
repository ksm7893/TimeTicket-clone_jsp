package domain;

import java.util.Date;

public class ReviewDTO {
	
	//1. 필드 선언
	
	private String tic_code;
	private String tic_name;
	private String tic_back;
	private String mem_id;
	private String mem_name;
	private int mem_point;
	private String book_code;
	private int rev_point;
	private String rev_img;
	private Date rev_date;
	private String rev_cont;
	private Date o_date;
	private String o_time;
	private String o_option;
	private String gwon_name;
	private int book_price;
	private Date book_date;
	private int book_cnt;
	private String book_stat;
	
	
	// 생성자
	public ReviewDTO() {
		super();
	}
	
	public ReviewDTO(String tic_code, String tic_name, String tic_back, String mem_id, String mem_name, int mem_point,
			String book_code, int rev_point, String rev_img, Date rev_date, String rev_cont, Date o_date, String o_time,
			String o_option, String gwon_name, int book_price, Date book_date, int book_cnt, String book_stat) {
		super();
		this.tic_code = tic_code;
		this.tic_name = tic_name;
		this.tic_back = tic_back;
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_point = mem_point;
		this.book_code = book_code;
		this.rev_point = rev_point;
		this.rev_img = rev_img;
		this.rev_date = rev_date;
		this.rev_cont = rev_cont;
		this.o_date = o_date;
		this.o_time = o_time;
		this.o_option = o_option;
		this.gwon_name = gwon_name;
		this.book_price = book_price;
		this.book_date = book_date;
		this.book_cnt = book_cnt;
		this.book_stat = book_stat;
	}

	
	//getter, setter
	
	public String getTic_code() {
		return tic_code;
	}

	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}

	public String getTic_name() {
		return tic_name;
	}

	public void setTic_name(String tic_name) {
		this.tic_name = tic_name;
	}

	public String getTic_back() {
		return tic_back;
	}

	public void setTic_back(String tic_back) {
		this.tic_back = tic_back;
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

	public int getMem_point() {
		return mem_point;
	}

	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}

	public String getBook_code() {
		return book_code;
	}

	public void setBook_code(String book_code) {
		this.book_code = book_code;
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

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public String getO_time() {
		return o_time;
	}

	public void setO_time(String o_time) {
		this.o_time = o_time;
	}

	public String getO_option() {
		return o_option;
	}

	public void setO_option(String o_option) {
		this.o_option = o_option;
	}

	public String getGwon_name() {
		return gwon_name;
	}

	public void setGwon_name(String gwon_name) {
		this.gwon_name = gwon_name;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public Date getBook_date() {
		return book_date;
	}

	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}

	public int getBook_cnt() {
		return book_cnt;
	}

	public void setBook_cnt(int book_cnt) {
		this.book_cnt = book_cnt;
	}

	public String getBook_stat() {
		return book_stat;
	}

	public void setBook_stat(String book_stat) {
		this.book_stat = book_stat;
	}


	

}//ReviewDTO
