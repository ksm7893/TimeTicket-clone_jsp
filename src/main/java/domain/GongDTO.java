package domain;

import java.sql.Date;

public class GongDTO {
	
	private int no;
	private String noti_num;
	private Date noti_date;
	private String noti_title;
	private String noti_cont;
	private int order_num;
	public GongDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getNoti_num() {
		return noti_num;
	}
	public void setNoti_num(String noti_num) {
		this.noti_num = noti_num;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_cont() {
		return noti_cont;
	}
	public void setNoti_cont(String noti_cont) {
		this.noti_cont = noti_cont;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public GongDTO(int no, String noti_num, Date noti_date, String noti_title, String noti_cont, int order_num) {
		super();
		this.no = no;
		this.noti_num = noti_num;
		this.noti_date = noti_date;
		this.noti_title = noti_title;
		this.noti_cont = noti_cont;
		this.order_num = order_num;
	}
	public GongDTO(String noti_num, Date noti_date, String noti_title, String noti_cont) {
		this.noti_num = noti_num;
		this.noti_date = noti_date;
		this.noti_title = noti_title;
		this.noti_cont = noti_cont;
	}

	public GongDTO(int no, String noti_num, int order_num, Date noti_date, String noti_title, String noti_cont) {
		this.no =no;
		this.noti_num=noti_num;
		this.order_num=order_num;
		this.noti_date = noti_date;
		this.noti_title = noti_title;
		this.noti_cont = noti_cont;
	}


	
	
}







