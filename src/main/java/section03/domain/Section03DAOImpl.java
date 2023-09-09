package section03.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

import com.util.JdbcUtil;


public class Section03DAOImpl implements Section03DAO {

	private Connection conn;


	public Connection getConn() {
		return conn;
	}


	private PreparedStatement pstmt;
	private ResultSet rs;


	public Section03DAOImpl() {
		super();
	}

	
	public Section03DAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public Section03DTO infoview(String tic_code) throws SQLException {
		
		String info;
		String info_agenc;
		String info_use;
		String tic_pic_in;
		String info_note;
		String info_host;
		String info_num;
		String info_link;
		
		
		
		String sql = "SELECT DISTINCT t.tic_code, i.info, i.info_agenc, i.info_use, i.tic_pic_in ,i.info_note, i.info_host, i.info_num, i.info_link "
				+ "FROM info i  JOIN ticket t ON  t.tic_code =  i.tic_code "
				+ "WHERE t.tic_code = ? ";

		
		Section03DTO idto = null;
		try {
		pstmt = this.conn.prepareStatement(sql);
		
		this.pstmt.setString(1, tic_code); 
		 		
		rs = this.pstmt.executeQuery();
		
		
		if( this.rs.next() ) {	
			do {				
				
				idto = new Section03DTO();
				
				tic_code = this.rs.getString("tic_code");
				info = this.rs.getString("info");
				info_agenc = this.rs.getString("info_agenc");
				info_use = this.rs.getString("info_use");
				tic_pic_in = this.rs.getString("tic_pic_in");
				info_note = this.rs.getString("info_note");;
				info_host = this.rs.getString("info_host");
				info_num = this.rs.getString("info_num");
				info_link = this.rs.getString("info_link");
				
				
				idto.setTic_code(tic_code);
				idto.setInfo(info);
				idto.setInfo_agenc(info_agenc);
				idto.setInfo_use(info_use);
				idto.setTic_pic_in(tic_pic_in);
				idto.setInfo_note(info_note);
				idto.setInfo_host(info_host);
				idto.setInfo_num(info_num);
				idto.setInfo_link(info_link);
				
			}while (rs.next());	
		} // if
		}catch(Exception e) {
	         System.out.println("> Exception " + e.toString());
		 } finally {
	           JdbcUtil.close(pstmt);    
	       
	      } // finally
		
		return idto;
	}
}
