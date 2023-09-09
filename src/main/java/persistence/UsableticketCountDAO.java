package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import domain.UsableticketCountDTO;

public class UsableticketCountDAO {
	
	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;

	//connection 받음
	public Connection getConn() {
		return conn;
	}
	
	//기본 생성자
	public UsableticketCountDAO() {
		super();
	}

	//의존성 주입 DI
	public UsableticketCountDAO(Connection conn) {
		super();
		this.conn = conn;
	}

public ArrayList<UsableticketCountDTO> selectUsableTic(String mem) throws SQLException{
	
	ArrayList<UsableticketCountDTO> useablelist = null;
	UsableticketCountDTO dto = null;
	
	String sql = " SELECT mem_id, SUM(CASE WHEN book_stat = '구매완료' THEN 1 ELSE 0 END) AS useable_tic_count "
			+ " FROM payed "
			+ " WHERE mem_id = ? "
			+ " GROUP BY mem_id ";
	
	
	this.pstmt = this.conn.prepareStatement(sql);
	this.pstmt.setString(1, mem); //매개변수 1개 줘서 1번 매개변수 지정
	
	this.rs = this.pstmt.executeQuery();
	
	///필드 선언
	String mem_id;
	int useable_tic_count;

if(rs.next()) {
	useablelist = new ArrayList<UsableticketCountDTO>();
	do {
		mem_id = rs.getString("mem_id");
		useable_tic_count = rs.getInt("useable_tic_count");


		dto = new UsableticketCountDTO(mem_id, useable_tic_count);
		useablelist.add(dto);
		} while (rs.next());
	}//if

	this.pstmt.close();
	this.rs.close();

	
	return useablelist;
	}	
}