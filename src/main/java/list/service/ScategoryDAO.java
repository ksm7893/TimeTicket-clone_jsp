package list.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ScategoryDAO {
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public ArrayList<ScategoryDTO> select(String lcate_code,Connection conn) throws SQLException {
		ScategoryDTO dto = null;
		ArrayList<ScategoryDTO> list = null;
		String sql = null;
				if(lcate_code.equals("lcate_4")) {
					sql = " select DISTINCT t.scate_code,t.lcate_code,scate_name,lcate_name "
							+ " from ticket t LEFT join s_category s on t.scate_code = s.scate_code "
							+ "              LEFT JOIN l_category l on t.lcate_code = l.lcate_code "
							+ " where tic_kids =1 ";
				} else {
					sql = "SELECT scate_code,s.lcate_code,scate_name,lcate_name "
							+ " FROM s_category s join l_category l on s.lcate_code = l.lcate_code "
							+ " WHERE regexp_like(s.lcate_code,?,'i') ";
				}
				sql+= " ORDER BY scate_code";
		this.pstmt=conn.prepareStatement(sql);
		if(!lcate_code.equals("lcate_4")) {
			pstmt.setString(1, lcate_code);
		}
		this.rs = this.pstmt.executeQuery();
		if(this.rs.next()) {		
			String scate_code , lc_code, scate_name,lcate_name;
			 list = new ArrayList<ScategoryDTO>();
			do {
				scate_code = rs.getString("scate_code");
				lc_code = rs.getString("lcate_code");
				scate_name = rs.getString("scate_name");
				lcate_name = rs.getString("lcate_name");
				dto = new ScategoryDTO(scate_code, lcate_code, scate_name, lcate_name);
				list.add(dto);
			} while (this.rs.next());
		}
		
		return list;
	}
}