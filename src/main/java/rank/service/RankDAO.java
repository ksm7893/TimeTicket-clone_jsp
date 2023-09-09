package rank.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RankDAO {
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	public ArrayList<RankDTO> select(Connection conn) throws SQLException{
		ArrayList<RankDTO> list=null;
		String sql = " SELECT * "
				+ " FROM ( "
				+ "        SELECT t.tic_code,tic_name,tic_prof,SUM(book_cnt) booksum,RANK() OVER(ORDER BY SUM(book_cnt) DESC) bookrank "
				+ "        FROM payed p LEFT JOIN gwon g ON p.gwon_code = g.gwon_code "
				+ "                    LEFT JOIN opt o ON o.o_code = g.o_code "
				+ "                    LEFT JOIN ticket t ON t.tic_code = o.tic_code "
				+ "        GROUP BY t.tic_code,tic_name,tic_prof "
				+ "        ) "
				+ " WHERE bookrank BETWEEN 1 AND 3 ";
		this.pstmt = conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		String tic_code;
		String tic_name;
		String tic_prof;
		int booksum;
		int bookrank;
		
		if(this.rs.next()) {
			list = new ArrayList<RankDTO>();
			do {
				tic_code = this.rs.getString("tic_code");
				tic_name = this.rs.getString("tic_name");
				tic_prof = this.rs.getString("tic_prof");
				booksum = this.rs.getInt("booksum");
				bookrank = this.rs.getInt("bookrank");
				RankDTO dto = new RankDTO(tic_code, tic_name, tic_prof, booksum, bookrank);
				
				list.add(dto);
				
			} while (this.rs.next());
		}
		
		return list;
	}
}
