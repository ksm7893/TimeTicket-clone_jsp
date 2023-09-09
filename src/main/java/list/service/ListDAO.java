package list.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

public class ListDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public ArrayList<ListDTO> select(String lc_code, String sc_code ,String g_code ,String rg_code ,String sort , Connection conn) throws SQLException{
		ListDTO dto = null;
		ArrayList<ListDTO> list = null;
		DecimalFormat df = new DecimalFormat("#,###");
		
		if(sc_code.equals("")) {
			sc_code=null;
		}
		if(g_code.equals("")) {
			g_code=null;
		}
		if(rg_code.equals("")) {
			rg_code=null;
		}

		String sql = " SELECT *  "
				+ "				FROM (  "
				+ "				    WITH  "
				+ "				    reviewAVGCNT AS (SELECT AVG(rev_point*1.0) ravg,COUNT(*)rcount,tic_code FROM review GROUP BY tic_code),  "
				+ "				    maxSale AS (SELECT MAX(GWON_SALE)sale,tic_code FROM opt o JOIN gwon g ON o.o_code = g.o_code GROUP BY tic_code),  "
				+ "				    timesale as (SELECT DISTINCT tic_code,gwon_name tgwon_name, r.regi_stime,r.regi_etime FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num WHERE REGEXP_LIKE(gwon_name,'타임세일') AND sysdate BETWEEN r.regi_stime AND r.regi_etime),  "
				+ "				    todaysale as (SELECT DISTINCT tic_code,gwon_name dgwon_name FROM gwon g JOIN opt o ON g.o_code = o.o_code JOIN registration r ON r.regi_num = g.regi_num WHERE REGEXP_LIKE(gwon_name,'오늘할인') AND sysdate BETWEEN r.regi_stime AND r.regi_etime),  "
				+ "				    sumticket as (SELECT sum(book_cnt) sumticket,tic_code FROM payed p JOIN gwon g ON p.gwon_code = g.gwon_code JOIN opt o ON g.o_code = o.o_code GROUP BY tic_code) "
				+ "				   SELECT a.tic_code,tic_name,tic_prof,reg_code,lcate_code,lcate_name,scate_code,scate_name,gen_code,gen_name,tic_price,tic_loc,tic_regist,newb,tic_kids  "
				+ "				        ,NVL2(sale,sale,0) msale,NVL2(tic_price*((100-maxSale.sale)/100),tic_price*((100-maxSale.sale)/100),tic_price) stic_price,NVL2(ravg,ravg,0) ravg,NVL2(rcount,rcount,0) rcount,tgwon_name,dgwon_name,NVL2(sumticket,sumticket,0) sticket "
				+ "				    FROM (  "
				+ "				            SELECT t.tic_code,tic_name,tic_prof,reg_code,t.lcate_code,lcate_name,t.scate_code,scate_name,t.gen_code,gen_name,tic_price,tic_loc,tic_regist,trunc(sysdate-tic_regist) newb,tic_kids "
				+ "				            FROM ticket t LEFT JOIN l_category l ON t.lcate_code = l.lcate_code "
				+ "				                        LEFT JOIN s_category s ON t.scate_code = s.scate_code "
				+ "				                        LEFT JOIN genre g ON t.gen_code = g.gen_code "
				+ "				         )a ,reviewAVGCNT,maxSale,timesale,todaysale,sumticket "
				+ "				    WHERE a.tic_code = reviewAVGCNT.tic_code(+)  AND maxsale.tic_code(+) = a.tic_code AND timesale.tic_code(+) = a.tic_code AND todaysale.tic_code(+) = a.tic_code AND sumticket.tic_code(+) = a.tic_code "
				+ "				)";
		if(lc_code.equals("lcate_4")) {
			sql+=" WHERE tic_kids = ?";
		} else {
			sql+=" WHERE REGEXP_LIKE(lcate_code,?,'i') ";
		}

		if(sc_code != null) {
			sql+=" AND REGEXP_LIKE(scate_code,?,'i') ";
		}

		if(g_code != null) {
			sql+=" AND REGEXP_LIKE(gen_code,?,'i') ";
		}

		if(rg_code != null) {
			sql+=" AND REGEXP_LIKE(reg_code,?,'i') ";	
		}
		
		if(sort.equals("")){
			sql+= " ORDER BY sticket DESC";
		}else if(sort.equals("tic_review")) {
			sql+= " ORDER BY ravg DESC";
		} else if(sort.equals("priceAsc")) {
			sql+= " ORDER BY stic_price ASC";
		} else if(sort.equals("priceDesc")) {
			sql+= " ORDER BY stic_price DESC";
		} 
		this.pstmt=conn.prepareStatement(sql);
		
		if(lc_code.equals("lcate_4")) {
			this.pstmt.setInt(1, 1);
		} else {
			this.pstmt.setString(1, lc_code);
		}
		

		if(sc_code != null) {
			this.pstmt.setString(2, sc_code);
		}
		
		if(sc_code == null && g_code != null) {
			this.pstmt.setString(2, g_code);
		}else if(sc_code != null && g_code != null) {
			this.pstmt.setString(3, g_code);
		}

		if(sc_code == null && g_code ==null && rg_code != null) {
			this.pstmt.setString(2, rg_code);
		} else if(sc_code != null && g_code==null && rg_code !=null) {
			this.pstmt.setString(3, rg_code);
		} else if(sc_code ==null && g_code != null && rg_code !=null) {
			this.pstmt.setString(3, rg_code);
		} else if(sc_code != null && g_code != null && rg_code != null) {
			this.pstmt.setString(4, rg_code);
		}
		this.rs = this.pstmt.executeQuery();

		 String tic_code;
		 String tic_name;
		 String tic_prof;
		 String reg_code;
		 String lcate_code;
		 String lcate_name;
		 String scate_code;
		 String scate_name;
		 String gen_code;
		 String gen_name;
		 int tic_price;
		 String tic_loc;
		 Date tic_regist;
		 int newb;
		 int tic_kids;
		 int msale;
		 String stic_price;
		 double ravg;
		 int rcount;
		 String tgwon_name;
		 String dgwon_name;
		 int sticket;

		if(this.rs.next()) {
			list = new ArrayList<ListDTO>();
			do {
			tic_code = this.rs.getString("tic_code");
			tic_name = this.rs.getString("tic_name");
			tic_prof = this.rs.getString("tic_prof");
			reg_code = this.rs.getString("reg_code");
			lcate_code = this.rs.getString("lcate_code");
			lcate_name = this.rs.getString("lcate_name");
			scate_code = this.rs.getString("scate_code");
			scate_name = this.rs.getString("scate_name");
			gen_code = this.rs.getString("gen_code");
			gen_name = this.rs.getString("gen_name");
			tic_price = this.rs.getInt("tic_price");
			tic_loc = this.rs.getString("tic_loc");
			tic_regist = this.rs.getDate("tic_regist");
			newb = this.rs.getInt("newb");
			tic_kids = this.rs.getInt("tic_kids");
			msale = this.rs.getInt("msale");
			stic_price = df.format(this.rs.getInt("stic_price"));
			ravg = this.rs.getDouble("ravg");
			rcount = this.rs.getInt("rcount");
			tgwon_name = this.rs.getString("tgwon_name");
			dgwon_name = this.rs.getString("dgwon_name");
			sticket = this.rs.getInt("sticket");
			
			dto = new ListDTO(tic_code, tic_name, tic_prof,reg_code, lcate_code, lcate_name, scate_code, scate_name, gen_code, gen_name, tic_price, tic_loc, tic_regist,newb,tic_kids, msale, stic_price, ravg, rcount, tgwon_name, dgwon_name, sticket);
			list.add(dto);	
			} while (this.rs.next());
		}
		
		return list;
	}
	public String getLcateName(String lcate_code, Connection conn) throws SQLException{
		String lcate_name = null;
		String sql = "SELECT lcate_name FROM l_category WHERE REGEXP_LIKE(lcate_code,?,'i')";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, lcate_code);
		this.rs = this.pstmt.executeQuery();
		if(this.rs.next()) {
			lcate_name = this.rs.getString("lcate_name");
		}
		return lcate_name;
	}
}
