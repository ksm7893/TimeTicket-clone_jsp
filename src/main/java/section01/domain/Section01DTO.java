package section01.domain;

import java.util.Date;

public class Section01DTO {
	private String tic_code;
	private String tic_time;
	private String tic_loc;
	private String tic_class;
	private String tic_prof;
	private String tic_back;
	private String tic_name;
	private int tic_price;
	private int sale_pay;
	private Date tic_regist; 
	private Double new_bar; 
	private String tic_age;
	private String tic_run_ti;
	private String reg_name;
	private String lcate_name;
	private String scate_name;
	private String gen_name;
	private int gwon_sale;

	
	
	public Section01DTO() {
		super();
	}



	public Section01DTO(String tic_code, String tic_time, String tic_loc, String tic_class, String tic_prof,
			String tic_back, String tic_name, int tic_price, int sale_pay, Date tic_regist, Double new_bar,
			String tic_age, String tic_run_ti, String reg_name, String lcate_name, String scate_name, String gen_name,
			int gwon_sale) {
		super();
		this.tic_code = tic_code;
		this.tic_time = tic_time;
		this.tic_loc = tic_loc;
		this.tic_class = tic_class;
		this.tic_prof = tic_prof;
		this.tic_back = tic_back;
		this.tic_name = tic_name;
		this.tic_price = tic_price;
		this.sale_pay = sale_pay;
		this.tic_regist = tic_regist;
		this.new_bar = new_bar;
		this.tic_age = tic_age;
		this.tic_run_ti = tic_run_ti;
		this.reg_name = reg_name;
		this.lcate_name = lcate_name;
		this.scate_name = scate_name;
		this.gen_name = gen_name;
		this.gwon_sale = gwon_sale;
	}



	public String getTic_code() {
		return tic_code;
	}



	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}



	public String getTic_time() {
		return tic_time;
	}



	public void setTic_time(String tic_time) {
		this.tic_time = tic_time;
	}



	public String getTic_loc() {
		return tic_loc;
	}



	public void setTic_loc(String tic_loc) {
		this.tic_loc = tic_loc;
	}



	public String getTic_class() {
		return tic_class;
	}



	public void setTic_class(String tic_class) {
		this.tic_class = tic_class;
	}



	public String getTic_prof() {
		return tic_prof;
	}



	public void setTic_prof(String tic_prof) {
		this.tic_prof = tic_prof;
	}



	public String getTic_back() {
		return tic_back;
	}



	public void setTic_back(String tic_back) {
		this.tic_back = tic_back;
	}



	public String getTic_name() {
		return tic_name;
	}



	public void setTic_name(String tic_name) {
		this.tic_name = tic_name;
	}



	public int getTic_price() {
		return tic_price;
	}



	public void setTic_price(int tic_price) {
		this.tic_price = tic_price;
	}



	public int getSale_pay() {
		return sale_pay;
	}



	public void setSale_pay(int sale_pay) {
		this.sale_pay = sale_pay;
	}



	public Date getTic_regist() {
		return tic_regist;
	}



	public void setTic_regist(Date tic_regist) {
		this.tic_regist = tic_regist;
	}


	
	public Double getNew_bar() {
		return new_bar;
	}



	public void setNew_bar(Double new_bar) {
		this.new_bar = new_bar;
	}



	public String getTic_age() {
		return tic_age;
	}



	public void setTic_age(String tic_age) {
		this.tic_age = tic_age;
	}



	public String getTic_run_ti() {
		return tic_run_ti;
	}



	public void setTic_run_ti(String tic_run_ti) {
		this.tic_run_ti = tic_run_ti;
	}



	public String getReg_name() {
		return reg_name;
	}



	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}



	public String getLcate_name() {
		return lcate_name;
	}



	public void setLcate_name(String lcate_name) {
		this.lcate_name = lcate_name;
	}



	public String getScate_name() {
		return scate_name;
	}



	public void setScate_name(String scate_name) {
		this.scate_name = scate_name;
	}



	public String getGen_name() {
		return gen_name;
	}



	public void setGen_name(String gen_name) {
		this.gen_name = gen_name;
	}



	public int getGwon_sale() {
		return gwon_sale;
	}



	public void setGwon_sale(int gwon_sale) {
		this.gwon_sale = gwon_sale;
	}
	
}
