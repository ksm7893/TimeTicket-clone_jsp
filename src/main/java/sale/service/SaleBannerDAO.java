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
	
public String timeString(String contextPath , Connection conn) throws SQLException{
		
		// 타임세일 배너 부분
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
		
		  // 오늘할인 배너 부분
	      String sql = "SELECT tic_code,tic_name,tic_price,stic_price,m_sale,tic_prof "
	              + "FROM ( "
	              + "        WITH "
	              + "        todaysale as (SELECT DISTINCT tic_code,gwon_sale sale "
	              + "                    FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num "
	              + "                    WHERE REGEXP_LIKE(gwon_name,'오늘할인') AND sysdate BETWEEN r.regi_stime AND r.regi_etime), "
				  + "        maxsale as (SELECT DISTINCT MAX(GWON_SALE) AS m_sale, tic_code "
				  + "                    FROM opt o JOIN gwon g ON o.o_code = g.o_code LEFT JOIN registration r ON r.regi_num = g.regi_num "
				  + "                    WHERE g.regi_num IS NULL OR sysdate BETWEEN r.regi_stime AND r.regi_etime"
				  + "					 GROUP BY tic_code) "
	              + "        SELECT t.tic_code,tic_name,tic_price,NVL2(sale,(100-sale)/100*tic_price,tic_price) stic_price,tic_prof,NVL2(m_sale,m_sale,0) m_sale "
	              + "        FROM ticket t,maxsale,todaysale "
	              + "        WHERE t.tic_code = maxsale.tic_code AND t.tic_code = todaysale.tic_code "
	              + "        )";

		this.pstmt = conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code,tic_name,tic_prof;
		int m_sale,tic_price,stic_price;
		
		String todayContent="";
		
		if(this.rs.next()) {
			do {
				
				todayContent+="<li class='swiper-slide'>"
						+ "	        			<a class='product_num' href='/timeticket/timeticket/detail/view.do?tic_code="+this.rs.getString("tic_code")+"' value='"+this.rs.getString("tic_code")+"'>"
						+ "	        				<div class='ticket_info'>"
						+ "	        					<div class='ticket_info_discount'>"
						+ "	        						<span>"+this.rs.getInt("m_sale")+"%</span>"
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
