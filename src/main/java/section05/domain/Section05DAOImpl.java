package section05.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

import com.util.JdbcUtil;


public class Section05DAOImpl implements Section05DAO {

	private Connection conn;


	public Connection getConn() {
		return conn;
	}


	private PreparedStatement pstmt;
	private ResultSet rs;


	public Section05DAOImpl() {
		super();
	}

	
	public Section05DAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public Section05DTO refundview(String tic_code) throws SQLException {
			
		String ref_rule;
		String ref_cau;
		String ref_way;
		
		
		
		String sql = "SELECT DISTINCT t.tic_code, re.ref_rule, re.ref_cau, re.ref_way "
							+ "FROM refund_rule re JOIN ticket t ON  t.tic_code =  re.tic_code "
							+ "WHERE t.tic_code = 'tic_1' ";

		
		Section05DTO redto = null;
		try {
		pstmt = this.conn.prepareStatement(sql);
		
		// this.pstmt.setString(1, tic_code); // WHERE tic_code = ? 이것도 나중에 파라미터 적용해주기 
		 		
		rs = this.pstmt.executeQuery();
		
		
		if( this.rs.next() ) {	
			do {				
				
				redto = new Section05DTO();
				
				tic_code = this.rs.getString("tic_code");
				ref_rule = this.rs.getString("ref_rule");
				ref_cau = this.rs.getString("ref_cau");
				ref_way = this.rs.getString("ref_way");
				
			
				redto.setTic_code(tic_code);
				redto.setRef_rule(ref_rule);
				redto.setRef_cau(ref_cau);
				redto.setRef_way(ref_way);
			}while (rs.next());	
		} // if
		}catch(Exception e) {
	         System.out.println("> Exception " + e.toString());
		 } finally {
	           JdbcUtil.close(pstmt);    
	      
	      } // finally
		
		return redto;
		
	}
}
