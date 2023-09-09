package sale.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.util.JdbcUtil;

public class TodaySaleDAOImpl {
	
	private Connection conn;
	
	public Connection getConn() {
		return conn;
	}
	
	private PreparedStatement pstmt;
	private ResultSet rs;

	public TodaySaleDAOImpl() {
		super();
	}

	public TodaySaleDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public String timesaleList(String contextPath) throws SQLException {
		DecimalFormat df = new DecimalFormat("#,###");
		
		String tic_code;	
		String reg_name;
		String lcate_code;	
		String scate_code;	
		String scate_name;
		String gen_code;	
		String tic_time;		
		String tic_loc;		
		String tic_class;	
		String tic_prof;	
		String tic_name;
		String gwon_names="";
		int m_sale = 0;
		int tic_price;
		String sale_pay = "";
		Date tic_regist;	
		int tic_count;
		Double areview = null;
		int creview = 0;
		Double new_bar=0.0;
		System.out.println(contextPath);
		// 인기순으로 정렬됨
		String sql = " SELECT DISTINCT t.tic_code, reg_name, t.lcate_code, scate_name, gen_code, tic_time, tic_loc, tic_class, tic_prof, tic_name, tic_regist, tic_count "
				+ " FROM ticket t JOIN s_category s ON t.scate_code = s.scate_code "
				+ "               JOIN region r ON t.reg_code = r.reg_code "
				+ "               JOIN opt o ON t.tic_code = o.tic_code "
				+ "               JOIN gwon g ON g.o_code = o.o_code "
				+ "               JOIN registration e ON g.regi_num = e.regi_num "
				+ " WHERE s.lcate_code = 'lcate_1' AND gwon_name = '타임세일' AND sysdate BETWEEN regi_stime AND regi_etime "
				+ " ORDER BY tic_code ";
	      
	      String sql2 = " SELECT * "
	            + " FROM (SELECT ROUND(AVG(rev_point), 1) as areview, COUNT(book_code) as creview,t.tic_code "
	            + "       FROM ticket t JOIN review r ON t.tic_code =  r.tic_code "
	            + "       GROUP BY t.tic_code)t "
	            + " WHERE t.tic_code = ?";
	      
	      String sql3 = " SELECT o.tic_code, MAX(gwon_sale) as m_sale, (100-MAX(gwon_sale))/100*tic_price as sale_pay "
	      		+ " FROM ticket t JOIN opt o ON t.tic_code = o.tic_code "
	      		+ "               JOIN gwon g ON g.o_code = o.o_code "
	      		+ "               JOIN registration r ON g.regi_num = r.regi_num "
	      		+ " WHERE t.tic_code = ? AND sysdate BETWEEN regi_stime AND regi_etime "
		      	+ " GROUP BY o.tic_code, tic_price ";
	      
	      String sql4 = " WITH source "
		      		+ " AS "
		      		+ " ( "
		      		+ "   SELECT DISTINCT t.tic_code, gwon_name, sysdate - tic_regist as new_bar "
		      		+ "   FROM ticket t JOIN opt o ON t.tic_code = o.tic_code "
		      		+ "                 JOIN gwon g ON g.o_code = o.o_code "
		      		+ "                 JOIN registration r ON g.regi_num = r.regi_num "
		      		+ "   WHERE t.tic_code = ? AND sysdate BETWEEN regi_stime AND regi_etime "
		      		+ " ) "
		      		+ " SELECT tic_code, LISTAGG( CAST ( gwon_name AS VARCHAR(50) ),',') WITHIN GROUP(ORDER BY tic_code ) AS gwon_names, new_bar "
		      		+ " FROM source "
		      		+ " GROUP BY tic_code, new_bar "
		      		+ " ORDER BY tic_code ASC ";
	      
	      PreparedStatement pstmt2 = null;
	      PreparedStatement pstmt3 = null;
	      PreparedStatement pstmt4 = null;
	      ResultSet rs2 = null;
	      ResultSet rs3 = null;
	      ResultSet rs4 = null;
	      String timesaleList=null;
	      try {
	         this.pstmt = this.conn.prepareStatement(sql);
	         this.rs = this.pstmt.executeQuery();
	         int i=1;
	         if( this.rs.next() ) {
	        	 timesaleList="<table width='100%' border='0' cellpadding='0' cellspacing='0'>";
	        	 if(i%4 == 1) {
	        		 timesaleList+="<tr>";
	        	 }
	            do {
	   
	               tic_code = this.rs.getString("tic_code");
	               reg_name = this.rs.getString("reg_name");
	               scate_name = this.rs.getString("scate_name");
	               tic_prof = this.rs.getString("tic_prof");
	               tic_name = this.rs.getString("tic_name");
	               
	               
	               areview = 0.0;
	       	       creview = 0;
	               pstmt2 = conn.prepareStatement(sql2);
	               pstmt2.setString(1, tic_code);
	               rs2 = pstmt2.executeQuery();
	               if(rs2.next()) {
	                  areview = rs2.getDouble("areview");
	                  creview = rs2.getInt("creview");
	               
	               }
	               
	               pstmt3 = conn.prepareStatement(sql3);
	               pstmt3.setString(1, tic_code);
	               rs3 = pstmt3.executeQuery();
	               if (rs3.next()) {
	            	   m_sale = rs3.getInt("m_sale");
	            	   sale_pay = df.format(rs3.getInt("sale_pay"));
	            	 
	            	}
	               
	               pstmt4 = conn.prepareStatement(sql4);
	               pstmt4.setString(1, tic_code);
	               rs4 = pstmt4.executeQuery();
	               if (rs4.next()) {
	            	   gwon_names = rs4.getString("gwon_names");
	            	   new_bar = rs4.getDouble("new_bar");
	            	
	               }
	               
	               timesaleList+="<td valign=top align=left><!-- main은 category보다 contents 간격이 넓음 --> "
	               		+ "<a href='/timeticket/timeticket/detail/view.do?tic_code="+tic_code+"' \">"
	               		+ "  <table cellspacing=\"0\" width=\"277\" style=\"margin-bottom:30px;\">"
	               		+ "  <tr>"
	               		+ "    <td>"
	               		+ "      <table cellspacing=\"0\" style=\"table-layout:fixed; width:250px; \">"
	               		+ "      <tr>"
	               		+ "        <td>"
	               		+ "          <div style='position:relative; overflow:hidden; border:1px solid #e5e5e5; width:250px; height:350px; border-radius:10px;'>"
	               		+ "            <img src='/timeticket/timeticket/images/"+tic_prof+"' class='expand_img'  style='width:250px; height:350px; border-radius:8px;'>"
	               				+ "<div style='position:absolute; top:15px; left:10px;'>";
	               					if(new_bar<=7) {
	               						timesaleList+="<span class='promo_new'>NEW</span>";
	               					}
	               					if(gwon_names.contains("오늘할인")) {
	               						timesaleList+="<span class='promo_today'>오늘할인</span>";
	               					}
	               					if(gwon_names.contains("타임세일")){
	               						timesaleList+="<span class='promo_timesale'>타임세일</span>";
	               		            }
	               					timesaleList+= "</div>"
	               				+ "          </div>"
	               		+ "        </td>"
	               		+ "      </tr>"
	               		+ "      <tr>"
	               		+ "        <td style='padding-top:15px;'>"
	               		+ "          <div class='category_rows_span'>"
	               		+ "            <span>"+reg_name+"</span>"
	               		+ "            <span>"+scate_name+"</span>"
	               		+ "          </div>"
	               		+ "        </td>"
	               		+ "      </tr>"
	               		+ "      <tr>"
	               		+ "        <td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap; padding:13px 0 0 2px;' align='left'>"
	               		+ "          <span class='category_rows_title'>"+tic_name+"</span>"
	               		+ "        </td>"
	               		+ "      </tr>"
	               		+ "      <tr>"
	               		+ "        <td style='padding:10px 0 0 2px; vertical-align:bottom;'>"
	               		+ "          <div style='display:flex; justify-content:space-between;'>"
	               		+ "            <div style='padding-top:4px;'>"
	               		+ "              <span style='; font-size:15px; color:#000; font-weight:400;";
	               		if(creview == 0) {
	               			timesaleList+="display:none;";
	               		}
	               		timesaleList+= "'>"
	               		+ "                  <img src='"+contextPath+"/timeticket/images/ico_star.png' style='width:15px; vertical-align:-1px; padding-right:3px;' alt='별점'>"+areview+"<span style='font-size:14px; color:#777; font-weight:400; padding-left:3px;'>("+creview+")</span>"
	               		+ "              </span>"
	               		+ "              <span style='display:none;;'></span>"
	               		+ "            </div>"
	               		+ "            <div>"
	               		+ "              <span class='category_rows_sale' style='text-align:right;'>"
	               		+ "                "+m_sale+"%"
	               		+ "              </span>"
	               		+ "              <span class='category_rows_price' style='text-align:right; border:1px solid rgba(0,0,0,0);'>"
	               		+ "                "+sale_pay+"원"
	               		+ "              </span>"
	               		+ "            </div>"
	               		+ "          </div>"
	               		+ "        </td>"
	               		+ "      </tr>"
	               		+ "      </table>"
	               		+ "    </td>"
	               		+ "  </tr>"
	               		+ "  </table>"
	               		+ "  </a>"
	               		+ "  <div style=\"padding:15px 0;\"></div>"
	               		+ ""
	               		+ "</td>";	
	               					
	               					if(i%4 == 0) {
	               						timesaleList+="</tr>";
	               	        	 }
	               	i++;
	            } while ( rs.next() );
	            timesaleList+="</table>";
			}
	         
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(pstmt3);
			JdbcUtil.close(pstmt4);
			JdbcUtil.close(rs);	
			JdbcUtil.close(rs2);	
			JdbcUtil.close(rs3);
			JdbcUtil.close(rs4);
		} // finally
	     
		return timesaleList;
	}
	
	public String todayList(String contextPath) throws SQLException {
		DecimalFormat df = new DecimalFormat("#,###");
		
		String tic_code;	
		String reg_name;
		String lcate_code;	
		String scate_code;	
		String scate_name;
		String gen_code;	
		String tic_time;		
		String tic_loc;		
		String tic_class;	
		String tic_prof;	
		String tic_name;
		String gwon_names="";
		int m_sale = 0;
		int tic_price;
		String sale_pay = "";
		Date tic_regist;	
		int tic_count;
		Double areview = null;
		int creview = 0;
		Double new_bar=0.0;
		System.out.println(contextPath);
		// 인기순으로 정렬됨
		String sql = " SELECT DISTINCT t.tic_code, reg_name, t.lcate_code, scate_name, gen_code, tic_time, tic_loc, tic_class, tic_prof, tic_name, tic_regist, tic_count "
				+ " FROM ticket t JOIN s_category s ON t.scate_code = s.scate_code "
				+ "               JOIN region r ON t.reg_code = r.reg_code "
				+ "               JOIN opt o ON t.tic_code = o.tic_code "
				+ "               JOIN gwon g ON g.o_code = o.o_code "
				+ "               JOIN registration e ON g.regi_num = e.regi_num "
				+ " WHERE s.lcate_code = 'lcate_1' AND gwon_name = '오늘할인' "
				+ " ORDER BY tic_code ";
	      
	      String sql2 = " SELECT * "
	            + " FROM (SELECT ROUND(AVG(rev_point), 1) as areview, COUNT(book_code) as creview,t.tic_code "
	            + "       FROM ticket t JOIN review r ON t.tic_code =  r.tic_code "
	            + "       GROUP BY t.tic_code)t "
	            + " WHERE t.tic_code = ?";
	      
	      String sql3 = " SELECT o.tic_code, MAX(gwon_sale) as m_sale, (100-MAX(gwon_sale))/100*tic_price as sale_pay "
	      		+ " FROM ticket t JOIN opt o ON t.tic_code = o.tic_code "
	      		+ "               JOIN gwon g ON g.o_code = o.o_code "
	      		+ "               JOIN registration r ON g.regi_num = r.regi_num "
	      		+ " WHERE t.tic_code = ? AND sysdate BETWEEN regi_stime AND regi_etime "
		      	+ " GROUP BY o.tic_code, tic_price ";
	      
	      String sql4 = " WITH source "
		      		+ " AS "
		      		+ " ( "
		      		+ "   SELECT DISTINCT t.tic_code, gwon_name, sysdate - tic_regist as new_bar "
		      		+ "   FROM ticket t JOIN opt o ON t.tic_code = o.tic_code "
		      		+ "                 JOIN gwon g ON g.o_code = o.o_code "
		      		+ "                 JOIN registration r ON g.regi_num = r.regi_num "
		      		+ "   WHERE t.tic_code = ? AND sysdate BETWEEN regi_stime AND regi_etime "
		      		+ " ) "
		      		+ " SELECT tic_code, LISTAGG( CAST ( gwon_name AS VARCHAR(50) ),',') WITHIN GROUP(ORDER BY tic_code ) AS gwon_names, new_bar "
		      		+ " FROM source "
		      		+ " GROUP BY tic_code, new_bar "
		      		+ " ORDER BY tic_code ASC ";
	      
	      PreparedStatement pstmt2 = null;
	      PreparedStatement pstmt3 = null;
	      PreparedStatement pstmt4 = null;
	      ResultSet rs2 = null;
	      ResultSet rs3 = null;
	      ResultSet rs4 = null;
	      String todayList=null;
	      try {
	         this.pstmt = this.conn.prepareStatement(sql);
	         this.rs = this.pstmt.executeQuery();
	         int i=1;
	         if( this.rs.next() ) {
	        	 todayList="<table width='100%' border='0' cellpadding='0' cellspacing='0'>";
	        	 if(i%4 == 1) {
	        		 todayList+="<tr>";
	        	 }
	            do {
	   
	               tic_code = this.rs.getString("tic_code");
	               reg_name = this.rs.getString("reg_name");
	               scate_name = this.rs.getString("scate_name");
	               tic_prof = this.rs.getString("tic_prof");
	               tic_name = this.rs.getString("tic_name");
	               
	               pstmt2 = conn.prepareStatement(sql2);
	               pstmt2.setString(1, tic_code);
	               rs2 = pstmt2.executeQuery();
	               
	               areview = 0.0;
	       	       creview = 0;
	               if(rs2.next()) {
	                  areview = rs2.getDouble("areview");
	                  creview = rs2.getInt("creview");
	                  
	               }
	               
	               pstmt3 = conn.prepareStatement(sql3);
	               pstmt3.setString(1, tic_code);
	               rs3 = pstmt3.executeQuery();
	               if (rs3.next()) {
	            	   m_sale = rs3.getInt("m_sale");
	            	   sale_pay = df.format(rs3.getInt("sale_pay"));
	            	   
	            	}
	               
	               pstmt4 = conn.prepareStatement(sql4);
	               pstmt4.setString(1, tic_code);
	               rs4 = pstmt4.executeQuery();
	               if (rs4.next()) {
	            	   gwon_names = rs4.getString("gwon_names");
	            	   new_bar = rs4.getDouble("new_bar");
	            	   
	               }
	               
	               todayList+="<td valign=top align=left><!-- main은 category보다 contents 간격이 넓음 --> "
	               		+ "<a href='/timeticket/timeticket/detail/view.do?tic_code="+tic_code+"' \">"
	               		+ "  <table cellspacing=\"0\" width=\"277\" style=\"margin-bottom:30px;\">"
	               		+ "  <tr>"
	               		+ "    <td>"
	               		+ "      <table cellspacing=\"0\" style=\"table-layout:fixed; width:250px; \">"
	               		+ "      <tr>"
	               		+ "        <td>"
	               		+ "          <div style='position:relative; overflow:hidden; border:1px solid #e5e5e5; width:250px; height:350px; border-radius:10px;'>"
	               		+ "            <img src='"+contextPath+"/timeticket/images/"+tic_prof+"' class='expand_img'  style='width:250px; height:350px; border-radius:8px;'>"
	               				+ "<div style='position:absolute; top:15px; left:10px;'>";
	               					if(new_bar<=7) {
	               						todayList+="<span class='promo_new'>NEW</span>";
	               					}
									
									  // if(gwon_names.contains("오늘할인")) {
									  todayList+="<span class='promo_today'>오늘할인</span>"; // }
									 
	               					if(gwon_names.contains("타임세일")){
	               						todayList+="<span class='promo_timesale'>타임세일</span>";
	               		            }
	               		todayList+= "</div>"
	               				+ "          </div>"
	               		+ "        </td>"
	               		+ "      </tr>"
	               		+ "      <tr>"
	               		+ "        <td style='padding-top:15px;'>"
	               		+ "          <div class='category_rows_span'>"
	               		+ "            <span>"+reg_name+"</span>"
	               		+ "            <span>"+scate_name+"</span>"
	               		+ "          </div>"
	               		+ "        </td>"
	               		+ "      </tr>"
	               		+ "      <tr>"
	               		+ "        <td style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap; padding:13px 0 0 2px;' align='left'>"
	               		+ "          <span class='category_rows_title'>"+tic_name+"</span>"
	               		+ "        </td>"
	               		+ "      </tr>"
	               		+ "      <tr>"
	               		+ "        <td style='padding:10px 0 0 2px; vertical-align:bottom;'>"
	               		+ "          <div style='display:flex; justify-content:space-between;'>"
	               		+ "            <div style='padding-top:4px;'>"
	               		+ "              <span style='; font-size:15px; color:#000; font-weight:400;";
		               		if(creview == 0) {
		               			todayList+="display:none;";
		               		}
	               		todayList+=";'>";
	               		todayList+="                  <img src='"+contextPath+"/timeticket/images/ico_star.png' style='width:15px; vertical-align:-1px; padding-right:3px;' alt='별점'>"+areview+"<span style='font-size:14px; color:#777; font-weight:400; padding-left:3px;'>("+creview+")</span>"
	               		+ "              </span>"
	               		+ "              <span style='display:none;;'></span>"
	               		+ "            </div>"
	               		+ "            <div>"
	               		+ "              <span class='category_rows_sale' style='text-align:right;'>"
	               		+ "                "+m_sale+"%"
	               		+ "              </span>"
	               		+ "              <span class='category_rows_price' style='text-align:right; border:1px solid rgba(0,0,0,0);'>"
	               		+ "                "+sale_pay+"원"
	               		+ "              </span>"
	               		+ "            </div>"
	               		+ "          </div>"
	               		+ "        </td>"
	               		+ "      </tr>"
	               		+ "      </table>"
	               		+ "    </td>"
	               		+ "  </tr>"
	               		+ "  </table>"
	               		+ "  </a>"
	               		+ "  <div style=\"padding:15px 0;\"></div>"
	               		+ ""
	               		+ "</td>";	
	               					
	               					if(i%4 == 0) {
	               	        		 todayList+="</tr>";
	               	        	 }
	               					
	               
	               	i++;
	            } while ( rs.next() );
	            todayList+="</table>";
			}
	         
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(pstmt3);
			JdbcUtil.close(pstmt4);
			JdbcUtil.close(rs);	
			JdbcUtil.close(rs2);	
			JdbcUtil.close(rs3);
			JdbcUtil.close(rs4);
		} // finally
	     
		return todayList;
	}
	
}
