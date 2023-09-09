package todaysale.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

import com.util.JdbcUtil;


public class TodaysaleDAOImpl implements TodaysaleDAO {

	private Connection conn;


	public Connection getConn() {
		return conn;
	}


	private PreparedStatement pstmt;
	private ResultSet rs;


	public TodaysaleDAOImpl() {
		super();
	}

	
	public TodaysaleDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public TodaysaleDTO todayview(String tic_code) throws SQLException {
		
		String gwon_name;
		int gwon_sale;
		String tds_fulltime;
		String tds_time;
		String tds_minute;
		String tds_second;
		Date regi_etime;
		
		
		
		String sql = "SELECT DISTINCT tic_code, gw.gwon_name, gw.gwon_sale, to_char( regis.regi_etime, 'HH24:MI:SS') as tds_fulltime, "
				+ "                to_char( regis.regi_etime, 'HH24') as tds_time, "
				+ "                to_char( regis.regi_etime, 'MI') as tds_minute,to_char( regis.regi_etime, 'SS') as tds_second, "
				+ "                regis.regi_etime "
				+ "FROM gwon gw  JOIN opt o ON  gw.o_code =  o.o_code "
				+ "              JOIN registration regis  ON regis.regi_num = gw.regi_num "
				+ "WHERE o.tic_code = ? and REGEXP_LIKE(gw.gwon_name,'오늘할인') "
				+ "       AND sysdate BETWEEN regis.regi_stime AND regis.regi_etime ";

		
		TodaysaleDTO tdvdto = null;
		try {
		pstmt = this.conn.prepareStatement(sql);
		
		this.pstmt.setString(1, tic_code); 
		 		
		rs = this.pstmt.executeQuery();
		
		
		if( this.rs.next() ) {	
			do {								
				tdvdto = new TodaysaleDTO();
				
				tic_code = this.rs.getString("tic_code");	
				gwon_name = this.rs.getString("gwon_name");
				gwon_sale = this.rs.getInt("gwon_sale");
				tds_fulltime = this.rs.getString("tds_fulltime");
				tds_time = this.rs.getString("tds_time");
				tds_minute = this.rs.getString("tds_minute");
				tds_second = this.rs.getString("tds_second");
				regi_etime = this.rs.getDate("regi_etime");
				
						
				tdvdto.setTic_code(tic_code);
				tdvdto.setGwon_name(gwon_name);
				tdvdto.setGwon_sale(gwon_sale);
				tdvdto.setTds_fulltime(tds_fulltime);
				tdvdto.setTds_time(tds_time);
				tdvdto.setTds_minute(tds_minute);
				tdvdto.setTds_second(tds_second);
				tdvdto.setRegi_etime(regi_etime);				
			}while (rs.next());	
		} // if
		}catch(Exception e) {
	         System.out.println("> TodaysaleDAO todayview() Exception " + e.toString());
		 } finally {
	           JdbcUtil.close(pstmt);    
	      } // finally
		
		return tdvdto;
	}
}
