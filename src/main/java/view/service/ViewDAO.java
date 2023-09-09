package view.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ViewDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public String view(Connection conn, String ticcode) throws SQLException{
	
		
		String sql = "SELECT DISTINCT t.tic_code, r.rev_point, r.rev_img, r.rev_date, r.rev_cont, m.mem_name "
				+ "FROM review r LEFT JOIN ticket t ON  t.tic_code =  r.tic_code "
				+ "            LEFT JOIN mem m ON  m.mem_id =  r.mem_id "
				+ "WHERE t.tic_code = ? ";
		
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, ticcode);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code,rev_img,rev_cont,mem_name;
		int rev_point;
		Date rev_date;
		
		JSONObject jsonData = new JSONObject();
		JSONArray ViewArr = null;
		
		if(this.rs.next()) {
			ViewArr = new JSONArray();
			do {
				tic_code = this.rs.getString("tic_code");
				rev_img = this.rs.getString("rev_img");
				rev_cont = this.rs.getString("rev_cont");
				mem_name = this.rs.getString("mem_name");
				rev_point =  this.rs.getInt("rev_point");
				rev_date = this.rs.getDate("rev_date");
				
				
				JSONObject viewre = new JSONObject();
				viewre.put("tic_code", tic_code);
				viewre.put("rev_img", rev_img);
				viewre.put("rev_cont", rev_cont);
				viewre.put("mem_name", mem_name);
				viewre.put("rev_point", rev_point);
				viewre.put("rev_date", rev_date.toLocaleString());
				
				// 
				ViewArr.add(viewre);
			} while (this.rs.next());
		}
			jsonData.put("ViewArr", ViewArr);
			
		return jsonData.toString();
	}
	
	
	
	public String viewplace(Connection conn, String ticcode) throws SQLException{
		
		
		String sql = "SELECT DISTINCT t.tic_code, p.place, p.place_add, p.place_park, p.place_lat ,p.place_lon "
				+ "FROM place p JOIN ticket t ON  t.tic_code =  p.tic_code "
				+ "WHERE t.tic_code = ? ";
		
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, ticcode);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code,place,place_add,place_park;
		double place_lat, place_lon;
		
		JSONObject jsonData = new JSONObject();
		JSONArray placeViewArr = null;
		
		
		if(this.rs.next()) {
			placeViewArr = new JSONArray();
			do {
				tic_code = this.rs.getString("tic_code");
				place = this.rs.getString("place");
				place_add = this.rs.getString("place_add");
				place_park = this.rs.getString("place_park");
				place_lat =  this.rs.getDouble("place_lat");
				place_lon =  this.rs.getDouble("place_lon");
				
				JSONObject viewpl = new JSONObject();
				viewpl.put("tic_code", tic_code);
				viewpl.put("place", place);
				viewpl.put("place_add", place_add);
				viewpl.put("place_park", place_park);
				viewpl.put("place_lat", place_lat);
				viewpl.put("place_lon", place_lon);
				
				placeViewArr.add(viewpl);
			} while (this.rs.next());							
		}
			jsonData.put("placeViewArr", placeViewArr);
		
			return jsonData.toString();
	}
}
