package section04.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

import com.util.JdbcUtil;


public class Section04DAOImpl implements Section04DAO {

	private Connection conn;


	public Connection getConn() {
		return conn;
	}


	private PreparedStatement pstmt;
	private ResultSet rs;


	public Section04DAOImpl() {
		super();
	}

	
	public Section04DAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public Section04DTO placeview(String tic_code) throws SQLException {
		
		String place;
		String place_add;
		String place_park;
		double place_lat;
		double place_lon;
		
		
	
		String sql = "SELECT DISTINCT t.tic_code, p.place, p.place_add, p.place_park, p.place_lat ,p.place_lon "
				+ "FROM place p JOIN ticket t ON  t.tic_code =  p.tic_code "
				+ "WHERE t.tic_code = ? ";

		
		Section04DTO pdto = null;
		try {
		pstmt = this.conn.prepareStatement(sql);
		
		this.pstmt.setString(1, tic_code); 
		 		
		rs = this.pstmt.executeQuery();
		
		
		if( this.rs.next() ) {	
			do {				
				
				pdto = new Section04DTO();
				
				tic_code = this.rs.getString("tic_code");
				place = this.rs.getString("place");
				place_add = this.rs.getString("place_add");
				place_park = this.rs.getString("place_park");
				place_lat = this.rs.getDouble("place_lat");
				place_lon = this.rs.getDouble("place_lon");
				
			
				
				pdto.setTic_code(tic_code);
				pdto.setPlace(place);
				pdto.setPlace_add(place_add);
				pdto.setPlace_park(place_park);
				pdto.setPlace_lat(place_lat);
				pdto.setPlace_lon(place_lon);
			}while (rs.next());	
		} // if
		}catch(Exception e) {
	         System.out.println("> Exception " + e.toString());
		 } finally {
	           JdbcUtil.close(pstmt);    
	       
	      } // finally
		
		return pdto;
	}
}
