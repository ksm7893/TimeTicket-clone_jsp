package section01.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.util.JdbcUtil;


public class Section01DAOImpl implements Section01DAO {

	private Connection conn;


	public Connection getConn() {
		return conn;
	}


	private PreparedStatement pstmt;
	private ResultSet rs;


	public Section01DAOImpl() {
		super();
	}

	
	public Section01DAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public Section01DTO view(String tic_code) throws SQLException {
		
		String tic_time;
		String tic_loc;
		String tic_class;
		String tic_prof;
		String tic_back;
		String tic_name;
		int tic_price;
		int sale_pay;
		Date tic_regist; 
		double new_bar;
		String tic_age;
		String tic_run_ti;
		String reg_name;
		String lcate_name;
		String scate_name;
		String gen_name;	
		int gwon_sale;
	
		
		
		String sql = "SELECT *\r\n"
				+ "FROM(\r\n"
				+ "    SELECT row_number() OVER(ORDER BY sale_pay ASC) SEQ, t.* "
				+ "        FROM(\r\n"
				+ "       SELECT DISTINCT t.tic_code, tic_time, tic_loc, tic_class, tic_prof, tic_back, "
				+ "                            tic_name, tic_price, NVL2( (100-gw.gwon_sale)/100*tic_price, (100-gw.gwon_sale)/100*tic_price, tic_price ) as sale_pay, "
				+ "                            tic_regist, sysdate - tic_regist as new_bar, tic_age, tic_run_ti, r.reg_name, "
				+ "                            l.lcate_name, s.scate_name, "
				+ "                            g.gen_name, gw.gwon_sale "
				+ "                FROM ticket t LEFT JOIN region r ON t.reg_code = r.reg_code "
				+ "                            LEFT JOIN s_category s ON s.scate_code = t.scate_code "
				+ "                            LEFT JOIN l_category l ON l.lcate_code = t.lcate_code "
				+ "                            LEFT JOIN genre g ON g.gen_code = t.gen_code "
				+ "                            LEFT JOIN opt o ON o.tic_code = t.tic_code "
				+ "                            LEFT JOIN gwon gw ON gw.o_code = o.o_code "
				+ "                            LEFT JOIN registration regis  ON regis.regi_num = gw.regi_num "
				+ "                WHERE t.tic_code = ? "
				+ "                 ) t "
				+ "    ) s "
				+ "WHERE seq = 1 " ;

		
		Section01DTO vdto = null;
		try {
		pstmt = this.conn.prepareStatement(sql);
		
		this.pstmt.setString(1, tic_code); 
		 		
		rs = this.pstmt.executeQuery();
		
		
		if( this.rs.next() ) {	
			do {				
				
				vdto = new Section01DTO();
				
				tic_code = this.rs.getString("tic_code");
				tic_time = this.rs.getString("tic_time");
				tic_loc = this.rs.getString("tic_loc");
				tic_class = this.rs.getString("tic_class");
				tic_prof = this.rs.getString("tic_prof");
				tic_back = rs.getString("tic_back");
				tic_name = this.rs.getString("tic_name");
				tic_price = this.rs.getInt("tic_price");
				sale_pay = this.rs.getInt("sale_pay");
				tic_regist = this.rs.getDate("tic_regist");
				new_bar = this.rs.getDouble("new_bar");
				tic_age = rs.getString("tic_age");
				tic_run_ti = rs.getString("tic_run_ti");
				reg_name = this.rs.getString("reg_name");			
				lcate_name = this.rs.getString("lcate_name");
				scate_name = this.rs.getString("scate_name");
				gen_name = this.rs.getString("gen_name");
				gwon_sale = this.rs.getInt("gwon_sale");
			
				
				vdto.setTic_code(tic_code);
				vdto.setTic_time(tic_time);
				vdto.setTic_loc(tic_loc);
				vdto.setTic_class(tic_class);
				vdto.setTic_prof(tic_prof);
				vdto.setTic_back(tic_back);
				vdto.setTic_name(tic_name);
				vdto.setTic_price(tic_price);
				vdto.setSale_pay(sale_pay);
				vdto.setTic_age(tic_age);
				vdto.setTic_regist(tic_regist);
				vdto.setNew_bar(new_bar);
				vdto.setTic_run_ti(tic_run_ti);
				vdto.setReg_name(reg_name);
				vdto.setLcate_name(lcate_name);
				vdto.setScate_name(scate_name);
				vdto.setGen_name(gen_name);
				vdto.setGwon_sale(gwon_sale);
			}while (rs.next());	
		} // if
		}catch(Exception e) {
	         System.out.println( "> Section01DAO view(String tic_code) Exception " + e.toString() );
		 } finally {
	           JdbcUtil.close(pstmt);    
	      } // finally
		
		return vdto;
	}
}
