package list.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RegionDAO {
	
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	public ArrayList<RegionDTO> select(Connection conn) throws SQLException {
		RegionDTO dto = null;
		ArrayList<RegionDTO> list = null;
		String sql = "SELECT * FROM region";
		this.pstmt=conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		String reg_code , reg_name;
		if(this.rs.next()) {		
			 list = new ArrayList<RegionDTO>();
			do {
				reg_code = rs.getString("reg_code");
				reg_name = rs.getString("reg_name");
				dto = new RegionDTO(reg_code, reg_name);
				list.add(dto);
			} while (this.rs.next());
		}
		
		return list;
	}
}


