package preview02.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

import com.util.JdbcUtil;



public class Preview02DAOImpl implements Preview02DAO {

	private Connection conn;


	public Connection getConn() {
		return conn;
	}


	private PreparedStatement pstmt;
	private ResultSet rs;


	public Preview02DAOImpl() {
		super();
	}

	
	public Preview02DAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public ArrayList<Preview02DTO> preview2(String tic_code) throws SQLException {
		ArrayList<Preview02DTO> plist = null;
		Preview02DTO p2dto = null;
		
		
		int rev_point;	
		String rev_img;
		Date rev_date; 
		String rev_cont;
		String mem_name;
		
		
		String sql = "SELECT * "
				+ "FROM( "
				+ "    SELECT row_number() OVER(ORDER BY rev_date DESC) SEQ, t.* "
				+ "            FROM( "
				+ "                    SELECT DISTINCT t.tic_code, r.rev_point, r.rev_img, r.rev_date, r.rev_cont, m.mem_name "
				+ "                    FROM review r LEFT JOIN ticket t ON  t.tic_code =  r.tic_code "
				+ "                                  LEFT JOIN mem m ON  m.mem_id =  r.mem_id "
				+ "                    WHERE t.tic_code = ? "
				+ "                     ) t "
				+ "        ) s "
				+ "WHERE seq < 3 ";
		
		
		try {
		pstmt = this.conn.prepareStatement(sql);
		
		this.pstmt.setString(1, tic_code); 
		
		rs = this.pstmt.executeQuery();
		
		
		if( this.rs.next() ) {	
			plist = new ArrayList<Preview02DTO>();
			do {								
				p2dto = new Preview02DTO();
				
				tic_code = this.rs.getString("tic_code");
				rev_point = this.rs.getInt("rev_point");
				rev_img = this.rs.getString("rev_img");			
				rev_date = rs.getDate("rev_date");
				rev_cont = rs.getString("rev_cont");
				mem_name = rs.getString("mem_name");
				
				
				
				p2dto.setTic_code(tic_code);
				p2dto.setRev_point(rev_point);
				p2dto.setRev_img(rev_img);
				p2dto.setRev_date(rev_date);
				p2dto.setRev_cont(rev_cont);
				p2dto.setMem_name(mem_name);
				plist.add(p2dto);				
			}while (rs.next());	
		} // if
		}catch(Exception e) {
	         System.out.println("> Preview02DAO preview2() Exception " + e.toString());
		 } finally {
	           JdbcUtil.close(pstmt);    
	      } // finally
		
		return plist;
	}
}
