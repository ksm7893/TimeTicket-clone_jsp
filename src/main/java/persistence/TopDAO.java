package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.LcateDTO;

public class TopDAO{

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;

	//connection 받음
	public Connection getConn() {
		return conn;
	}
	
	//기본 생성자
	public TopDAO() {
		super();
	}

	//의존성 주입 DI
	public TopDAO(Connection conn) {
		super();
		this.conn = conn;
	}


	public ArrayList<LcateDTO> select() throws SQLException {
		String lcate_code;
		String lcate_name;
		
		ArrayList<LcateDTO> llist = null;
		LcateDTO dto = null;
		
		String sql = "SELECT lcate_code, lcate_name "
				+ " FROM l_category ";
		
		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		
		if(rs.next()) {
			llist = new ArrayList<LcateDTO>();
			do {
				lcate_code = rs.getString("lcate_code");
				lcate_name = rs.getString("lcate_name");
				dto = new LcateDTO(lcate_code, lcate_name);
				llist.add(dto);
			} while (rs.next());
		}//if

		this.pstmt.close();
		this.rs.close();

		return llist;
	}
	
}
