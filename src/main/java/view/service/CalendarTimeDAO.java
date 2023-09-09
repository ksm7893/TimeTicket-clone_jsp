package view.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CalendarTimeDAO {
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public JSONObject timeSelect(int year , int month , int date , String tic_code , Connection conn) throws SQLException{
		
		String odate = String.format("%d%02d%02d", year,month,date);
		
		String sql = "SELECT DISTINCT o_time"
				+ " FROM opt o LEFT JOIN gwon g ON o.o_code = g.o_code"
				+ " WHERE tic_code = ? AND TO_CHAR(o_date,'yyyyMMdd') = ?";
		
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, tic_code);
		this.pstmt.setString(2, odate);
		this.rs = this.pstmt.executeQuery();
		
		JSONObject jsonData = new JSONObject();
		JSONArray timeArr = new JSONArray();
		
		String o_time;
		
		if(this.rs.next()) {
			timeArr = new JSONArray();
			do {
				o_time = this.rs.getString("o_time");
				timeArr.add(o_time);		
		
			} while (this.rs.next());
		}
			jsonData.put("otime", timeArr);
		return jsonData;
	}
	public JSONObject gwonSelect(int year , int month , int date ,String time , String tic_code , Connection conn) throws SQLException{
		
		String odate = String.format("%d%02d%02d", year,month,date);
		
		String sql = "SELECT * "
				+ " FROM ( "
				+ "        SELECT  g.gwon_code,gwon_name,gwon_count-NVL2(book_cnt,sum(book_cnt),0) gwon_count,tic_price,gwon_sale ,(100-NVL2(gwon_sale,gwon_sale,0))/100*tic_price stic_price "
				+ "        FROM opt o LEFT JOIN gwon g ON o.o_code = g.o_code "
				+ "                    LEFT JOIN payed p ON g.gwon_code = p.gwon_code "
				+ "                    LEFT JOIN ticket t ON o.tic_code = t.tic_code "
				+ "        WHERE o.tic_code = ? AND TO_CHAR(o_date,'yyyyMMdd') = ? AND o_time = ? "
				+ "        GROUP BY g.gwon_code,gwon_name,gwon_count,book_cnt,tic_price,gwon_sale "
				+ "    ) ";
		
		String sql2 = "SELECT COUNT(book_cnt) paycnt"
				+ " FROM payed "
				+ " WHERE gwon_code = ?";
		
		
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, tic_code);
		this.pstmt.setString(2, odate);
		this.pstmt.setString(3, time);
		this.rs = this.pstmt.executeQuery();
		
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		ResultSet rs2 = null;
		
		JSONObject jsonData = new JSONObject();
		JSONArray gwonArr = new JSONArray();
		
		String gwon_code;
		int payCnt =0; 
		if(this.rs.next()) {
			gwonArr = new JSONArray();
			do {
				payCnt =0;
				JSONObject gwoninfo = new JSONObject();
				gwon_code = this.rs.getString("gwon_code");
				pstmt2.setString(1, gwon_code);
				rs2 = pstmt2.executeQuery();
				if(rs2.next()) {
					payCnt = rs2.getInt("paycnt");
				}
				gwoninfo.put("gwon_code", gwon_code);
				gwoninfo.put("gwon_name", this.rs.getString("gwon_name"));
				payCnt = this.rs.getInt("gwon_count")-payCnt;
				gwoninfo.put("gwon_count", payCnt);
				gwoninfo.put("tic_price",this.rs.getInt("stic_price"));
				gwonArr.add(gwoninfo);
		
			} while (this.rs.next());
		}
			jsonData.put("gwon", gwonArr);
		return jsonData;
	}
}
