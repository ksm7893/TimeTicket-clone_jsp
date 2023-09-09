package domain;

import java.sql.Date;

public class EdetailDTO {

	public String eve_code;
	public String tic_code;
	public String tic_name;
	public String tic_prof;
	public String eve_cond;
	public String eve_stdate;
	public String eve_eddate;
	public String eve_anno;
	public int eve_tar;
	public String place;
	public String scate_name;
	public String tic_age;
	public EdetailDTO() {
		super();
		}
	public String getEve_code() {
		return eve_code;
	}
	public void setEve_code(String eve_code) {
		this.eve_code = eve_code;
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
	public String getEve_cond() {
		return eve_cond;
	}
	public void setEve_cond(String eve_cond) {
		this.eve_cond = eve_cond;
	}
	public String getEve_stdate() {
		return eve_stdate;
	}
	public void setEve_stdate(String eve_stdate) {
		this.eve_stdate = eve_stdate;
	}
	public String getEve_eddate() {
		return eve_eddate;
	}
	public void setEve_eddate(String eve_eddate) {
		this.eve_eddate = eve_eddate;
	}
	public String getEve_anno() {
		return eve_anno;
	}
	public void setEve_anno(String eve_anno) {
		this.eve_anno = eve_anno;
	}
	public int getEve_tar() {
		return eve_tar;
	}
	public void setEve_tar(int eve_tar) {
		this.eve_tar = eve_tar;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getScate_name() {
		return scate_name;
	}
	public void setScate_name(String scate_name) {
		this.scate_name = scate_name;
	}
	public String getTic_age() {
		return tic_age;
	}
	public void setTic_age(String tic_age) {
		this.tic_age = tic_age;
	}
	public EdetailDTO(String eve_code, String tic_code, String tic_name, String tic_prof, String eve_cond,
			String eve_stdate, String eve_eddate, String eve_anno, int eve_tar, String place, String scate_name,
			String tic_age) {
		super();
		this.eve_code = eve_code;
		this.tic_code = tic_code;
		this.tic_name = tic_name;
		this.tic_prof = tic_prof;
		this.eve_cond = eve_cond;
		this.eve_stdate = eve_stdate;
		this.eve_eddate = eve_eddate;
		this.eve_anno = eve_anno;
		this.eve_tar = eve_tar;
		this.place = place;
		this.scate_name = scate_name;
		this.tic_age = tic_age;
	}
	
	public EdetailDTO(String eve_code, String tic_code, String tic_name, String eve_cond, int eve_tar, String eve_stdate,
			String eve_eddate, String eve_anno, String tic_prof, String scate_name) {
		super();
		this.eve_code = eve_code;
		this.tic_code = tic_code;
		this.tic_name = tic_name;
		this.eve_cond = eve_cond;
		this.eve_tar = eve_tar;
		this.eve_stdate = eve_stdate;
		this.eve_eddate = eve_eddate;
		this.eve_anno = eve_anno;
		this.tic_prof = tic_prof;
		this.scate_name = scate_name;
	}
	
	
}







