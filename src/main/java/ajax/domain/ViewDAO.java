package ajax.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import preview02.domain.Preview02DTO;
import section03.domain.Section03DTO;
import section04.domain.Section04DTO;
import section05.domain.Section05DTO;

public class ViewDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public String info(Connection conn, String ticcode) throws SQLException{
		ArrayList<Section03DTO> list = null;
	
		
		String sql = "SELECT t.tic_code, i.info, i.info_agenc, i.info_use, i.tic_pic_in ,i.info_note, i.info_host, "
				+ "        i.info_num, i.info_link , p.place, p.place_add, p.place_park, p.place_lat ,p.place_lon, re.ref_rule, re.ref_cau, re.ref_way "
				+ "FROM ticket t LEFT JOIN info i ON  t.tic_code = i.tic_code "
				+ "            LEFT JOIN place p ON  t.tic_code = p.tic_code  "
				+ "            LEFT JOIN refund_rule re ON  t.tic_code = re.tic_code "
				+ "WHERE t.tic_code = ? ";
		
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, ticcode);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code,info,info_agenc,info_use,tic_pic_in,info_note,info_host,info_num,info_link,
				place,place_add,place_park,ref_rule,ref_cau,ref_way;
		double place_lat,place_lon;
		
		
		JSONObject jsonData = new JSONObject();
		JSONArray infoViewArr = null;
		
		if(this.rs.next()) {
			infoViewArr = new JSONArray();
			do {
				tic_code = this.rs.getString("tic_code");
				info = this.rs.getString("info");
				info_agenc = this.rs.getString("info_agenc");
				info_use = this.rs.getString("info_use");
				tic_pic_in =  this.rs.getString("tic_pic_in");
				info_note =  this.rs.getString("info_note");
				info_host =  this.rs.getString("info_host");
				info_num =  this.rs.getString("info_num");
				info_link =  this.rs.getString("info_link");
				place =  this.rs.getString("place");
				place_add = this.rs.getString("place_add");
				place_park =  this.rs.getString("place_park");
				place_lat =  this.rs.getDouble("place_lat");
				place_lon =  this.rs.getDouble("place_lon");
				ref_rule =  this.rs.getString("ref_rule");
				ref_cau =  this.rs.getString("ref_cau");
				ref_way =  this.rs.getString("ref_way");
				
				
				JSONObject viewinfo = new JSONObject();
				viewinfo.put("tic_code", tic_code);
				viewinfo.put("info", info);
				viewinfo.put("info_agenc", info_agenc);
				viewinfo.put("info_use", info_use);
				viewinfo.put("tic_pic_in", tic_pic_in);
				viewinfo.put("info_note", info_note);
				viewinfo.put("info_host", info_host);
				viewinfo.put("info_num", info_num);
				viewinfo.put("info_link", info_link);
				viewinfo.put("place", place);
				viewinfo.put("place_add", place_add);
				viewinfo.put("place_park", place_park);
				viewinfo.put("place_lat", place_lat);
				viewinfo.put("place_lon", place_lon);
				viewinfo.put("ref_rule", ref_rule);
				viewinfo.put("ref_cau", ref_cau);
				viewinfo.put("ref_way", ref_way);
				// 
				infoViewArr.add(viewinfo);
			} while (this.rs.next());
		}
			jsonData.put("infoViewArr", infoViewArr);
			
		return jsonData.toString();
	}
	
	
	
	public String view(Connection conn, String ticcode) throws SQLException{
		ArrayList<Preview02DTO> list = null;
	
		
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
		ArrayList<Section04DTO> list = null;
		
		
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
	
	
	
	public String viewref(Connection conn, String ticcode) throws SQLException{
		ArrayList<Section05DTO> list = null;
		
		
		String sql = "SELECT DISTINCT t.tic_code, re.ref_rule, re.ref_cau, re.ref_way "
				+ "FROM refund_rule re JOIN ticket t ON  t.tic_code =  re.tic_code "
				+ "WHERE t.tic_code = ? ";
		
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, ticcode);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code, ref_rule, ref_cau, ref_way;
		
		JSONObject jsonData = new JSONObject();
		JSONArray refViewArr = null;
		
		
		if(this.rs.next()) {
			refViewArr = new JSONArray();
			do {
				tic_code = this.rs.getString("tic_code");
				ref_rule = this.rs.getString("ref_rule");
				ref_cau = this.rs.getString("ref_cau");
				ref_way = this.rs.getString("ref_way");
				
				JSONObject viewref = new JSONObject();
				viewref.put("tic_code", tic_code);
				viewref.put("ref_rule", ref_rule);
				viewref.put("ref_cau", ref_cau);
				viewref.put("ref_way", ref_way);

				
				refViewArr.add(viewref);
			} while (this.rs.next());							
		}
			jsonData.put("refViewArr", refViewArr);
		
			return jsonData.toString();
	}
}
