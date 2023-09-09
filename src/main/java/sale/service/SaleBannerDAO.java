package sale.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SaleBannerDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public JSONObject timeselect(Connection conn) throws SQLException{
		ArrayList<SaleBannerDTO> list = null;
		DecimalFormat df = new DecimalFormat("#,###");
		
		String sql = "SELECT tic_code,tic_name,tic_price,stic_price,sale,tic_prof "
				+ "FROM ( "
				+ "        WITH "
				+ "        timesale as (SELECT DISTINCT tic_code,gwon_sale sale "
				+ "                    FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num "
				+ "                    WHERE REGEXP_LIKE(gwon_name,'타임세일') AND sysdate BETWEEN r.regi_stime AND r.regi_etime) "
				+ "        SELECT t.tic_code,tic_name,tic_price,NVL2(sale,(100-sale)/100*tic_price,tic_price) stic_price,tic_prof,NVL2(sale,sale,0) sale "
				+ "        FROM ticket t,timesale "
				+ "        WHERE t.tic_code = timesale.tic_code "
				+ "        )";
		
		this.pstmt = conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code,tic_name,tic_prof;
		int tic_price,stic_price,sale;
		JSONObject jsonData = new JSONObject();
		JSONArray timeArr = null;
		
		if(this.rs.next()) {
			timeArr = new JSONArray();
			do {
				tic_code = this.rs.getString("tic_code");
				tic_name = this.rs.getString("tic_name");
				tic_price = this.rs.getInt("tic_price");
				stic_price = this.rs.getInt("stic_price");
				sale = this.rs.getInt("sale");
				tic_prof = this.rs.getString("tic_prof");
				
				JSONObject timecol = new JSONObject();
				timecol.put("tic_code", tic_code);
				timecol.put("tic_name", tic_name);
				timecol.put("tic_price", tic_price);
				timecol.put("stic_price", stic_price);
				timecol.put("sale", sale);
				timecol.put("tic_prof", tic_prof);
				
				// 
				timeArr.add(timecol);
			} while (this.rs.next());
		}
			jsonData.put("timeList", timeArr);
		return jsonData;
	}
	
	
	public JSONObject todayselect(Connection conn) throws SQLException{
		ArrayList<SaleBannerDTO> list = null;
		DecimalFormat df = new DecimalFormat("#,###");
		
		String sql = "SELECT tic_code,tic_name,tic_price,stic_price,sale,tic_prof "
				+ "FROM ( "
				+ "        WITH "
				+ "        timesale as (SELECT DISTINCT tic_code,gwon_sale sale "
				+ "                    FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num "
				+ "                    WHERE REGEXP_LIKE(gwon_name,'오늘할인') AND sysdate BETWEEN r.regi_stime AND r.regi_etime) "
				+ "        SELECT t.tic_code,tic_name,tic_price,NVL2(sale,(100-sale)/100*tic_price,tic_price) stic_price,tic_prof,NVL2(sale,sale,0) sale "
				+ "        FROM ticket t,timesale "
				+ "        WHERE t.tic_code = timesale.tic_code "
				+ "        )";
		
		this.pstmt = conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code,tic_name,tic_prof;
		int sale,tic_price,stic_price;
		JSONObject jsonData = new JSONObject();
		JSONArray todayArr = null;
		
		if(this.rs.next()) {
			todayArr = new JSONArray();
			do {
				tic_code = this.rs.getString("tic_code");
				tic_name = this.rs.getString("tic_name");
				tic_price = this.rs.getInt("tic_price");
				stic_price = this.rs.getInt("stic_price");
				sale = this.rs.getInt("sale");
				tic_prof = this.rs.getString("tic_prof");
				
				JSONObject todaycol = new JSONObject();
				todaycol.put("tic_code", tic_code);
				todaycol.put("tic_name", tic_name);
				todaycol.put("tic_price", tic_price);
				todaycol.put("stic_price", stic_price);
				todaycol.put("sale", sale);
				todaycol.put("tic_prof", tic_prof);
				
				
				todayArr.add(todaycol);
			} while (this.rs.next());
		}
		jsonData.put("todayList", todayArr);
		return jsonData;
	}
	
	
public String timeString(String contextPath , Connection conn) throws SQLException{
		
		String sql = "SELECT tic_code,tic_name,tic_price,stic_price,sale,tic_prof "
				+ "FROM ( "
				+ "        WITH "
				+ "        timesale as (SELECT DISTINCT tic_code,gwon_sale sale "
				+ "                    FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num "
				+ "                    WHERE REGEXP_LIKE(gwon_name,'타임세일') AND sysdate BETWEEN r.regi_stime AND r.regi_etime) "
				+ "        SELECT t.tic_code,tic_name,tic_price,NVL2(sale,(100-sale)/100*tic_price,tic_price) stic_price,tic_prof,NVL2(sale,sale,0) sale "
				+ "        FROM ticket t,timesale "
				+ "        WHERE t.tic_code = timesale.tic_code "
				+ "        )";
		
		this.pstmt = conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code,tic_name,tic_prof;
		int sale,tic_price,stic_price;
		
		String timeContent="";
		
		if(this.rs.next()) {
			do {
				
				timeContent+="<li class='swiper-slide'>"
						+ "	        			<a class='product_num' href='/timeticket/timeticket/detail/view.do?tic_code="+this.rs.getString("tic_code")+"' value='"+this.rs.getString("tic_code")+"'>"
						+ "	        				<div class='ticket_info'>"
						+ "	        					<div class='ticket_info_discount'>"
						+ "	        						<span>"+this.rs.getInt("sale")+"%</span>"
						+ "	        					</div>"
						+ "	        				</div>"
						+ "	        				<div class='reco_ticket'>"
						+ "	        					<div class='timesale_thum'>"
						+ "	        						<div></div>"
						+"										<img src='"+contextPath+"/timeticket/images/"+this.rs.getString("tic_prof")+"' alt='"+this.rs.getString("tic_name")+"' style='box-shadow: rgba(0, 0, 0, 0.3) 10px 10px 20px, rgba(0, 0, 0, 0.22) 0px 5px 12px;'/> "
						+ "	        					</div>"
						+ "	        				</div>"
						+ "	        			</a>"
						+ "	        			<input class='full_price' type='hidden' value='"+this.rs.getInt("tic_price")+"'>"
						+ "	        			<input class='timesale_price' type='hidden' value='"+this.rs.getString("stic_price")+"'>"
						+ "	        			<input class='todaysale_price' type='hidden' value='"+this.rs.getString("stic_price")+"'>"
						+ "	        			<input class='timesale_condition_hidden' type='hidden' value='평일 1인 타임세일 기준'>"
						+ "        			</li>"
						+ "                          ";
				
				
			} while (this.rs.next());
			timeContent+="</table>";
		}
		return timeContent;
}


	public String todayString(String contextPath , Connection conn) throws SQLException{
		/*
		String sql = "SELECT tic_code,tic_name,tic_price,stic_price,sale,tic_prof "
				+ "FROM ( "
				+ "        WITH "
				+ "        timesale as (SELECT DISTINCT tic_code,gwon_sale sale "
				+ "                    FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num "
				+ "                    WHERE REGEXP_LIKE(gwon_name,'오늘할인') AND sysdate BETWEEN r.regi_stime AND r.regi_etime) "
				+ "        SELECT t.tic_code,tic_name,tic_price,NVL2(sale,(100-sale)/100*tic_price,tic_price) stic_price,tic_prof,NVL2(sale,sale,0) sale "
				+ "        FROM ticket t,timesale "
				+ "        WHERE t.tic_code = timesale.tic_code "
				+ "        )";
		*/
		
		String sql = "WITH timesale AS ( "
				+ "    SELECT DISTINCT tic_code, gwon_sale AS sale "
				+ "    FROM gwon g "
				+ "    JOIN opt o ON g.o_code = o.o_code "
				+ "    JOIN registration r ON r.regi_num = g.regi_num "
				+ "    WHERE REGEXP_LIKE(gwon_name, '오늘할인') "
				+ "), "
				+ "ticket_rank AS ( "
				+ "    SELECT t.tic_code, tic_name, tic_price, NVL2(ts.sale, (100 - ts.sale) / 100 * tic_price, tic_price) AS stic_price, tic_prof, NVL2(ts.sale, ts.sale, 0) AS sale, "
				+ "        ROW_NUMBER() OVER (PARTITION BY t.tic_code ORDER BY t.tic_code) AS row_num "
				+ "    FROM ticket t "
				+ "    JOIN timesale ts ON t.tic_code = ts.tic_code "
				+ ") "
				+ "SELECT tic_code, tic_name, tic_price, stic_price, sale, tic_prof "
				+ "FROM ticket_rank "
				+ "WHERE row_num = 1 ";

		this.pstmt = conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code,tic_name,tic_prof;
		int sale,tic_price,stic_price;
		
		String todayContent="";
		
		if(this.rs.next()) {
			do {
				
				todayContent+="<li class='swiper-slide'>"
						+ "	        			<a class='product_num' href='/timeticket/timeticket/detail/view.do?tic_code="+this.rs.getString("tic_code")+"' value='"+this.rs.getString("tic_code")+"'>"
						+ "	        				<div class='ticket_info'>"
						+ "	        					<div class='ticket_info_discount'>"
						+ "	        						<span>"+this.rs.getInt("sale")+"%</span>"
						+ "	        					</div>"
						+ "	        				</div>"
						+ "	        				<div class='reco_ticket'>"
						+ "	        					<div class='timesale_thum'>"
						+ "	        						<div></div>"
						+ "										<img src='"+contextPath+"/timeticket/images/"+this.rs.getString("tic_prof")+"' alt='"+this.rs.getString("tic_name")+"' style='box-shadow: rgba(0, 0, 0, 0.3) 10px 10px 20px, rgba(0, 0, 0, 0.22) 0px 5px 12px;'/> "
						+ "	        					</div>"
						+ "	        				</div>"
						+ "	        			</a>"
						+ "	        			<input class='full_price' type='hidden' value='"+this.rs.getInt("tic_price")+"'>"
						+ "	        			<input class='timesale_price' type='hidden' value='"+this.rs.getString("stic_price")+"'>"
						+ "	        			<input class='todaysale_price' type='hidden' value='"+this.rs.getString("stic_price")+"'>"
						+ "	        			<input class='timesale_condition_hidden' type='hidden' value='오늘의 최저가격 기준'>"
						+ "        			</li>"
						+ "                          ";
				
				
			} while (this.rs.next());
			todayContent+="</table>";
		}
		return todayContent;
	}
	
}
