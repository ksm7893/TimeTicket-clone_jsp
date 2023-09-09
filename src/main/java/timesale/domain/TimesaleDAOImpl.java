package timesale.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.util.JdbcUtil;


public class TimesaleDAOImpl implements TimesaleDAO {

	private Connection conn;


	public Connection getConn() {
		return conn;
	}


	private PreparedStatement pstmt;
	private ResultSet rs;


	public TimesaleDAOImpl() {
		super();
	}

	
	public TimesaleDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public TimesaleDTO timeview(String tic_code) throws SQLException {
		
		String gwon_name;
		int gwon_sale;
		String ts_etime;
		Date regi_etime;
		
		
		
		String sql = "SELECT DISTINCT t.tic_code, gw.gwon_name, gw.gwon_sale, to_char( regis.regi_etime, 'MM.DD') as ts_etime, regis.regi_etime  "
				+ "FROM gwon gw LEFT JOIN opt o ON  gw.o_code =  o.o_code "
				+ "            LEFT JOIN ticket t ON o.tic_code = t.tic_code "
				+ "            LEFT JOIN registration regis  ON regis.regi_num = gw.regi_num  "
				+ "WHERE t.tic_code = ? AND gw.gwon_name = '타임세일' "
				+ "      AND to_char( regis.regi_etime , 'YYYYMM') = to_char( sysdate, 'YYYYMM') ";

		
		TimesaleDTO tvdto = null;
		try {
		pstmt = this.conn.prepareStatement(sql);
		
		this.pstmt.setString(1, tic_code); 
		 		
		rs = this.pstmt.executeQuery();
		
		
		if( this.rs.next() ) {	
			do {								
				tvdto = new TimesaleDTO();
				
				tic_code = this.rs.getString("tic_code");	
				gwon_name = this.rs.getString("gwon_name");
				gwon_sale = this.rs.getInt("gwon_sale");
				ts_etime = this.rs.getString("ts_etime");
				regi_etime = this.rs.getDate("regi_etime");
				
						
				tvdto.setTic_code(tic_code);
				tvdto.setGwon_name(gwon_name);
				tvdto.setGwon_sale(gwon_sale);
				tvdto.setTs_etime(ts_etime);
				tvdto.setRegi_etime(regi_etime);				
			}while (rs.next());	
		} // if
		}catch(Exception e) {
	         System.out.println("> TimesaleDAO timeview() Exception " + e.toString());
		 } finally {
	           JdbcUtil.close(pstmt);    
	      } // finally
		
		return tvdto;
	}
}
