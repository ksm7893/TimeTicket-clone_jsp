package persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.SearchDTO;


public class SearchDAOImpl implements SearchDAO {

	private Connection conn;
	// getter
	public Connection getConn() {
		return conn;
	}

	private PreparedStatement pstmt;
	private ResultSet rs;

	public SearchDAOImpl() {
		super();		
	}
	public SearchDAOImpl( Connection conn ) {
		super();		
		this.conn = conn;
	}


	@Override
	public ArrayList<SearchDTO> search(String pseq) throws SQLException {
		ArrayList<SearchDTO> searchlist = null;
		SearchDTO dto = null;
		String tic_code;
		String tic_name;
		String tic_prof;
		String lcate_name;
		String scate_name;
		String gen_name;
		int tic_price;
		String tic_loc;
		String place;
		String place_add;
		String reg_name;
		String tic_class;
		int msale;
		String stic_price;
		double ravg;
		int rcount;
		String tgwon_name;
		String dgwon_name;

		String sql ="SELECT *  "
				+ "                     FROM (  "
						+ "                       WITH  "
						+ "                           reviewAVGCNT AS (SELECT AVG(rev_point*1.0) ravg,COUNT(*)rcount,tic_code FROM review GROUP BY tic_code),  "
						+ "                      maxSale AS (SELECT MAX(GWON_SALE)sale,tic_code FROM opt o JOIN gwon g ON o.o_code = g.o_code GROUP BY tic_code),  "
						+ "                          timesale as (SELECT DISTINCT tic_code,gwon_name tgwon_name, r.regi_stime,r.regi_etime FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num WHERE REGEXP_LIKE(gwon_name,'타임세일') AND sysdate BETWEEN r.regi_stime AND r.regi_etime),  "
						+ "                          todaysale as (SELECT DISTINCT tic_code,gwon_name dgwon_name FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num WHERE REGEXP_LIKE(gwon_name,'오늘할인') AND sysdate BETWEEN r.regi_stime AND r.regi_etime),  "
						+ "                      sumticket as (SELECT sum(book_cnt) sumticket,tic_code FROM payed p JOIN gwon g ON p.gwon_code = g.gwon_code JOIN opt o ON g.o_code = o.o_code GROUP BY tic_code) "
						+ "                         SELECT a.tic_code,tic_name,tic_prof,reg_code,lcate_code,lcate_name,scate_code,scate_name,gen_code,gen_name,tic_price,tic_loc,tic_regist,newb,tic_kids,place,place_add,reg_name,tic_class "
						+ "                             ,NVL2(sale,sale,0) msale,NVL2(tic_price*((100-maxSale.sale)/100),tic_price*((100-maxSale.sale)/100),tic_price) stic_price,NVL2(ravg,ravg,0) ravg,NVL2(rcount,rcount,0) rcount,tgwon_name,dgwon_name,NVL2(sumticket,sumticket,0) sticket "
						+ "                       FROM (  "
						+ "                              SELECT t.tic_code,tic_name,tic_prof,n.reg_code,t.lcate_code,lcate_name,t.scate_code,scate_name,t.gen_code,gen_name,tic_price,tic_loc,tic_regist,trunc(sysdate-tic_regist) newb,tic_kids ,place,place_add,reg_name,tic_class "
						+ "                                 FROM ticket t LEFT JOIN l_category l ON t.lcate_code = l.lcate_code "
						+ "                                           LEFT JOIN s_category s ON t.scate_code = s.scate_code "
						+ "                                                LEFT JOIN genre g ON t.gen_code = g.gen_code "
						+ "                                                LEFT JOIN place p  ON t.tic_code = p.tic_code "
						+ "                                                 LEFT JOIN region  n ON t.reg_code = n.reg_code "
						+ "                                )a ,reviewAVGCNT,maxSale,timesale,todaysale,sumticket "
						+ "                       WHERE a.tic_code = reviewAVGCNT.tic_code(+)  AND maxsale.tic_code(+) = a.tic_code AND timesale.tic_code(+) = a.tic_code AND todaysale.tic_code(+) = a.tic_code AND sumticket.tic_code(+) = a.tic_code "
						+ "                      ) "
						+ "WHERE REGEXP_LIKE(tic_name,?,'i') or REGEXP_LIKE(tic_loc,?,'i') or REGEXP_LIKE(tic_class,?,'i')  or REGEXP_LIKE(place,?,'i') "
						+ "or REGEXP_LIKE(place_add, ? ,'i') or REGEXP_LIKE(reg_name, ? ,'i') or REGEXP_LIKE(lcate_name, ? ,'i') or REGEXP_LIKE(scate_name,?,'i') or REGEXP_LIKE(gen_name,? ,'i')";

		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, pseq);
		this.pstmt.setString(2, pseq);
		this.pstmt.setString(3, pseq);
		this.pstmt.setString(4, pseq);
		this.pstmt.setString(5, pseq);
		this.pstmt.setString(6, pseq);
		this.pstmt.setString(7, pseq);
		this.pstmt.setString(8, pseq);
		this.pstmt.setString(9, pseq);
		this.rs = this.pstmt.executeQuery();

		if( rs.next() ) {
			searchlist = new ArrayList<SearchDTO>();

			do {
				tic_code = rs.getString("tic_code");
				tic_name = rs.getString("tic_name");
				tic_prof = rs.getString("tic_prof");				
				lcate_name = rs.getString("lcate_name");				
				scate_name = rs.getString("scate_name");				
				gen_name = rs.getString("gen_name");							
				tic_price = rs.getInt("tic_price");				
				tic_loc = rs.getString("tic_loc");				
				place = rs.getString("place");				
				place_add = rs.getString("place_add");				
				reg_name = rs.getString("reg_name");				
				tic_class = rs.getString("tic_class");	
				msale = rs.getInt("msale");	
				stic_price = rs.getString("stic_price");		
				stic_price = stic_price.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
				ravg = rs.getDouble("ravg");		
				rcount = rs.getInt("rcount");	
				tgwon_name = rs.getString("tgwon_name");		
				dgwon_name = rs.getString("dgwon_name");		
				
				dto = new SearchDTO(tic_code,tic_name, tic_prof,lcate_name,scate_name,gen_name,tic_price,tic_loc,place,place_add,reg_name,tic_class,msale,stic_price,ravg,rcount,tgwon_name,dgwon_name);
				searchlist.add( dto );
			} while ( rs.next() );
		} // if

		this.pstmt.close();
		this.rs.close();

		return searchlist;
	}
}








