package domain;

import java.sql.Date;

public class FreqDTO {

   private int no;
   private String freq_code;
   private String freq_name;
   private String freq_cont;
   private int order_num;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getFreq_code() {
	return freq_code;
}
public void setFreq_code(String freq_code) {
	this.freq_code = freq_code;
}
public String getFreq_name() {
	return freq_name;
}
public void setFreq_name(String freq_name) {
	this.freq_name = freq_name;
}
public String getFreq_cont() {
	return freq_cont;
}
public void setFreq_cont(String freq_cont) {
	this.freq_cont = freq_cont;
}
public int getOrder_num() {
	return order_num;
}
public void setOrder_num(int order_num) {
	this.order_num = order_num;
}
public FreqDTO(int no, String freq_code, String freq_name, String freq_cont, int order_num) {
	super();
	this.no = no;
	this.freq_code = freq_code;
	this.freq_name = freq_name;
	this.freq_cont = freq_cont;
	this.order_num = order_num;
}
public FreqDTO() {
	super();
	
}
public FreqDTO(String freq_code, String freq_name, String freq_cont) {
	this.freq_code = freq_code;
	this.freq_name = freq_name;
	this.freq_cont = freq_cont;
}

   
   
}


