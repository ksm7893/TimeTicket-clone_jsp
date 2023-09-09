package preview01.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

import com.util.JdbcUtil;

import preview02.domain.Preview02DTO;


public class Preview01DAOImpl implements Preview01DAO {

	private Connection conn;


	public Connection getConn() {
		return conn;
	}


	private PreparedStatement pstmt;
	private ResultSet rs;


	public Preview01DAOImpl() {
		super();
	}

	
	public Preview01DAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public Preview01DTO preview1(String tic_code) throws SQLException {
		
		int  total_rev=0;
		Double avg_rev;
		
		
		
		String sql = "select count(r.book_code) as total_rev, sum(rev_point)/count(rev_point) as avg_rev "
				+ "from review r LEFT JOIN ticket t ON  t.tic_code =  r.tic_code "
				+ "where t.tic_code = ? ";
		
		
		Preview01DTO p1dto = null;
		try {
		pstmt = this.conn.prepareStatement(sql);
		
		this.pstmt.setString(1, tic_code);  
		 		
		rs = this.pstmt.executeQuery();
		
		
		if( this.rs.next() ) {	
			do {								
				p1dto = new Preview01DTO();
				
				// tic_code = this.rs.getString("tic_code");
				total_rev = this.rs.getInt("total_rev");
				avg_rev = this.rs.getDouble("avg_rev");
				
				
				p1dto.setTotal_rev(total_rev);
				p1dto.setAvg_rev(avg_rev);				
			}while (rs.next());	
		} // if
		}catch(Exception e) {
	         System.out.println("> Preview01DAO preview1() Exception " + e.toString());
		 } finally {
	           JdbcUtil.close(pstmt);    
	      } // finally
		
		return p1dto;
	}
}
