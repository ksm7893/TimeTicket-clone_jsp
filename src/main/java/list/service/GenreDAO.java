package list.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GenreDAO {
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	public ArrayList<GenreDTO> select(String scate_code,Connection conn) throws SQLException{
		ArrayList<GenreDTO> list = null;
		String sql = "SELECT * FROM genre "
				+" WHERE REGEXP_LIKE(scate_code,?,'i')";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, scate_code);
		rs = pstmt.executeQuery();
		String gen_code,gen_name;
		if(rs.next()) {
			list = new ArrayList<GenreDTO>();
			do {
				gen_code = rs.getString("gen_code");
				gen_name = rs.getString("gen_name");
				GenreDTO dto = new GenreDTO(gen_code, gen_name);
				list.add(dto);
			} while (rs.next());
		}
		return list;
	}
}
