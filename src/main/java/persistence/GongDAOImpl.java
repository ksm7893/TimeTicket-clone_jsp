package persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.GongDTO;

public class GongDAOImpl implements GongDAO {
	
	private Connection conn;
	// getter
	public Connection getConn() {
		return conn;
	}
		
	private PreparedStatement pstmt;
	private ResultSet rs;
			
	public GongDAOImpl() {
		super();		
	}
	public GongDAOImpl( Connection conn ) {
		super();		
		this.conn = conn;
	}
		
	@Override
	public ArrayList<GongDTO> selectGong(int currentPage, int numberPerPage) throws SQLException {
		System.out.println("gongdao 호출");
		ArrayList<GongDTO> glist = null;
		GongDTO dto = null;
		this.rs=null;
		this.pstmt=null;
		int no;
		int order_num;
		String noti_title,noti_num;
		String noti_cont;
		Date  noti_date;
		
	
		int begin = ( currentPage - 1 ) * numberPerPage + 1;
		int end = begin + numberPerPage - 1;
		
		System.out.println(begin +"/" + end);
		String sql = "SELECT * "
					   + " FROM( "
					   + "        SELECT ROWNUM no, t.* "
					   + "        FROM( "
					   + "                SELECT to_number(REPLACE(noti_num, 'noti_', '')) AS order_num, noti_num, noti_date, noti_title, noti_cont  "
					   + "                FROM notice "
					   + "                ORDER BY noti_date DESC "
					   + "             ) t "
					   + "     ) m "
					   + " WHERE m.no BETWEEN ? AND ? ";
			

		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, begin);
		this.pstmt.setInt(2, end);
		this.rs = this.pstmt.executeQuery();
		if( this.rs.next() ) {
			glist = new ArrayList<GongDTO>();
			do {
				no = this.rs.getInt("no");
				
				 order_num = this.rs.getInt("order_num");
				 
				 noti_num = this.rs.getString("noti_num");
		
				 noti_date = this.rs.getDate("noti_date");	
	
				 noti_title = this.rs.getString("noti_title");
			
				 noti_cont = this.rs.getString("noti_cont");				
			
				dto = new GongDTO(no,noti_num,order_num,noti_date , noti_title,noti_cont);

				glist.add( dto );
			} while ( this.rs.next() );
		} // if
			
		this.pstmt.close();
		this.rs.close();
			
		return glist;
	} // select

	

	@Override
	public GongDTO view(String fr_code) throws SQLException {
		String sql =     " SELECT  noti_num,noti_date,noti_title ,noti_cont  "
				+ " FROM notice "
				+ " WHERE regexp_like(noti_num , ? ,'i')";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, fr_code);  
		this.rs = this.pstmt.executeQuery();
		String noti_num;
	
		Date noti_date;
		String noti_title;
		String noti_cont;
	
		GongDTO dto = null;
		if( this.rs.next() ) {
			 
			 noti_num = this.rs.getString("noti_num");
			 noti_date = this.rs.getDate("noti_date");	
			 noti_title = this.rs.getString("noti_title");
			 noti_cont = this.rs.getString("noti_cont");				
	
			dto = new GongDTO(noti_num,noti_date, noti_title,noti_cont);
		} // view

		return dto;
	}

	 	
	
	
	
	
	
	@Override
	// 총 페이지수 반환하는 메서드
	public int getTotal() throws SQLException {
		
		
		String sql = "SELECT COUNT(*) "
				+ "FROM notice ";
		  int total = 0;
	      this.pstmt = this.conn.prepareStatement(sql);
	      this.rs = this.pstmt.executeQuery();      
	      if( rs.next() ) {
	         total = this.rs.getInt(1);
	      }      
	      this.pstmt.close();
	      this.rs.close();
	      return total;
	} // getTotal
	
}
