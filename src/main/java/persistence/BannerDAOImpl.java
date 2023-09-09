package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.BannerDTO;
import com.util.JdbcUtil;


public class BannerDAOImpl implements BannerDAO{

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Connection getConn() {
		return conn;
	}
	

	public BannerDAOImpl() {
		super();
	}

	public BannerDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public ArrayList<BannerDTO> banner() throws SQLException {
		
		String ban_code;
		String ban_img;
		String ban_link;
		
		ArrayList<BannerDTO> list = null;
		String sql = " SELECT ban_code, ban_img, ban_link "
				+ " FROM banner ";
		
		BannerDTO bdto = null;
		try {
			pstmt = this.conn.prepareStatement(sql);
			rs = this.pstmt.executeQuery();
			
			if(this.rs.next() ) {
				list = new ArrayList();
				do {
					bdto = new BannerDTO();
					
					ban_code = this.rs.getString("ban_code");
					ban_img = this.rs.getString("ban_img");
					ban_link = this.rs.getString("ban_link");
					
					bdto.setBan_code(ban_code);
					bdto.setBan_img(ban_img);
					bdto.setBan_link(ban_link);
					list.add(bdto);
				}while(rs.next());
			}//if
		} catch (Exception e) {
			System.out.println("> Exception " + e.toString() );
		} finally {
			JdbcUtil.close(pstmt);
		}//finally

		return list;
	}

}
