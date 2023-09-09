package member.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	PreparedStatement pstmt = null;
	public int insert(MemberDTO dto,Connection conn) throws SQLException{
		int rowCount = 0;
		String sql = "INSERT INTO mem (mem_id, mem_pw, mem_name, mem_mail, mem_num, mem_join, mem_point) "
				+ "VALUES (?,?,?,?,?,SYSDATE,0 )";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1,  dto.getmem_id() );
		this.pstmt.setString(2,  dto.getmem_pw() );
		this.pstmt.setString(3,  dto.getmem_name() );
		this.pstmt.setString(4,  dto.getmem_mail() );
		this.pstmt.setString(5, dto.getmem_num());
		rowCount = this.pstmt.executeUpdate(); 
		this.pstmt.close();
		return rowCount;
	}
	public String checkID(String input_id,Connection conn) throws SQLException{
		String id=null;
		ResultSet rs = null;
		String sql = "SELECT mem_id FROM mem WHERE mem_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, input_id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			do {
				id = rs.getString("mem_id");
			} while (rs.next());
		}
		return id;
	}
	public String getMemberPw(String id,Connection conn) throws SQLException{
		ResultSet rs = null;
		String pw = null;
		String sql = "SELECT mem_pw FROM mem WHERE mem_id IN (?)";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			do {
				pw = rs.getString("mem_pw");
			} while (rs.next());
		}
		this.pstmt.close();
		return pw;
	}
	public int memPoint(String mem_id, Connection conn) throws SQLException {
		ResultSet rs = null;
		int point = 0;
		String sql = "SELECT mem_point "
				+ " FROM mem "
				+ "WHERE mem_id = ?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, mem_id);
		rs = this.pstmt.executeQuery();
		if(rs.next()) {
			point = rs.getInt("mem_point");
		}
		return point;
	}
	public MemberDTO selectMem(String user_id, Connection conn) throws SQLException {
		ResultSet rs = null;
		MemberDTO meminfo = null;
		String sql = "SELECT mem_id,mem_pw,mem_name,mem_mail,mem_num,mem_join,mem_point "
				+ " FROM mem "
				+ "WHERE mem_id = ?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, user_id);
		rs = this.pstmt.executeQuery();
		
		String mem_id,mem_pw,mem_name,mem_mail,mem_num;
		int mem_point;
		Date mem_join;
		if(rs.next()) {
			mem_id = rs.getString("mem_id");
			mem_pw=rs.getString("mem_pw");
			mem_name=rs.getString("mem_name");
			mem_mail = rs.getString("mem_mail");
			mem_num = rs.getString("mem_num");
			mem_join = rs.getDate("mem_join");
			mem_point = rs.getInt("mem_point");
			
			meminfo = new MemberDTO(mem_id, mem_pw, mem_name, mem_mail, mem_num, mem_join ,mem_point);
		}
		
		return meminfo;
	}
}
