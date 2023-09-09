package domain;

import java.sql.Date;

public class SearchDTO {

	  private String tic_code;
	   private String tic_name;
	   private String tic_prof;
	   private String reg_code;
	   private String lcate_code;
	   private String lcate_name;
	   private String scate_code;
	   private String scate_name;
	   private String gen_code;
	   private String gen_name;
	   private int tic_price;
	   private String tic_loc;
	   private Date tic_regist;
	   private int newb;
	   private int tic_kids;
	   private String place;
	   private String place_add;
	   private String reg_name;
	   private String tic_class;
	   private int msale;
	   private String stic_price;
	   private double ravg;
	   private int rcount;
	   private String tgwon_name;
	   private String dgwon_name;
	   private int sticket;
	public SearchDTO() {
		super();
	}
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
	public String getTic_prof() {
		return tic_prof;
	}
	public void setTic_prof(String tic_prof) {
		this.tic_prof = tic_prof;
	}
	public String getReg_code() {
		return reg_code;
	}
	public void setReg_code(String reg_code) {
		this.reg_code = reg_code;
	}
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
	public String getScate_code() {
		return scate_code;
	}
	public void setScate_code(String scate_code) {
		this.scate_code = scate_code;
	}
	public String getScate_name() {
		return scate_name;
	}
	public void setScate_name(String scate_name) {
		this.scate_name = scate_name;
	}
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
	public int getTic_price() {
		return tic_price;
	}
	public void setTic_price(int tic_price) {
		this.tic_price = tic_price;
	}
	public String getTic_loc() {
		return tic_loc;
	}
	public void setTic_loc(String tic_loc) {
		this.tic_loc = tic_loc;
	}
	public Date getTic_regist() {
		return tic_regist;
	}
	public void setTic_regist(Date tic_regist) {
		this.tic_regist = tic_regist;
	}
	public int getNewb() {
		return newb;
	}
	public void setNewb(int newb) {
		this.newb = newb;
	}
	public int getTic_kids() {
		return tic_kids;
	}
	public void setTic_kids(int tic_kids) {
		this.tic_kids = tic_kids;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPlace_add() {
		return place_add;
	}
	public void setPlace_add(String place_add) {
		this.place_add = place_add;
	}
	public String getReg_name() {
		return reg_name;
	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	public String getTic_class() {
		return tic_class;
	}
	public void setTic_class(String tic_class) {
		this.tic_class = tic_class;
	}
	public int getMsale() {
		return msale;
	}
	public void setMsale(int msale) {
		this.msale = msale;
	}
	public String getStic_price() {
		return stic_price;
	}
	public void setStic_price(String stic_price) {
		this.stic_price = stic_price;
	}
	public double getRavg() {
		return ravg;
	}
	public void setRavg(double ravg) {
		this.ravg = ravg;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public String getTgwon_name() {
		return tgwon_name;
	}
	public void setTgwon_name(String tgwon_name) {
		this.tgwon_name = tgwon_name;
	}
	public String getDgwon_name() {
		return dgwon_name;
	}
	public void setDgwon_name(String dgwon_name) {
		this.dgwon_name = dgwon_name;
	}
	public int getSticket() {
		return sticket;
	}
	public void setSticket(int sticket) {
		this.sticket = sticket;
	}
	public SearchDTO(String tic_code, String tic_name, String tic_prof, String reg_code, String lcate_code,
			String lcate_name, String scate_code, String scate_name, String gen_code, String gen_name, int tic_price,
			String tic_loc, Date tic_regist, int newb, int tic_kids, String place, String place_add, String reg_name,
			String tic_class, int msale, String stic_price, double ravg, int rcount, String tgwon_name,
			String dgwon_name, int sticket) {
		super();
		this.tic_code = tic_code;
		this.tic_name = tic_name;
		this.tic_prof = tic_prof;
		this.reg_code = reg_code;
		this.lcate_code = lcate_code;
		this.lcate_name = lcate_name;
		this.scate_code = scate_code;
		this.scate_name = scate_name;
		this.gen_code = gen_code;
		this.gen_name = gen_name;
		this.tic_price = tic_price;
		this.tic_loc = tic_loc;
		this.tic_regist = tic_regist;
		this.newb = newb;
		this.tic_kids = tic_kids;
		this.place = place;
		this.place_add = place_add;
		this.reg_name = reg_name;
		this.tic_class = tic_class;
		this.msale = msale;
		this.stic_price = stic_price;
		this.ravg = ravg;
		this.rcount = rcount;
		this.tgwon_name = tgwon_name;
		this.dgwon_name = dgwon_name;
		this.sticket = sticket;
	}
	public SearchDTO(String tic_code, String tic_name, String tic_prof, String lcate_name, String scate_name,
			String gen_name, int tic_price, String tic_loc, String place, String place_add, String reg_name,
			String tic_class, int msale, String stic_price, double ravg, int rcount, String tgwon_name,
			String dgwon_name) {
		super();
		this.tic_code = tic_code;
		this.tic_name = tic_name;
		this.tic_prof = tic_prof;
		this.lcate_name = lcate_name;
		this.scate_name = scate_name;
		this.gen_name = gen_name;
		this.tic_price = tic_price;
		this.tic_loc = tic_loc;
		this.place = place;
		this.place_add = place_add;
		this.reg_name = reg_name;
		this.tic_class = tic_class;
		this.msale = msale;
		this.stic_price = stic_price;
		this.ravg = ravg;
		this.rcount = rcount;
		this.tgwon_name = tgwon_name;
		this.dgwon_name = dgwon_name;

		
	}
	
	
	
}







