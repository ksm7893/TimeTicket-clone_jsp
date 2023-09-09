package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import domain.MainTicDTO;

public class MainTicDAO{

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;

	//connection 받음
	public Connection getConn() {
		return conn;
	}
	
	//기본 생성자
	public MainTicDAO() {
		super();
	}

	//의존성 주입 DI
	public MainTicDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	
	//신규오픈 selectNew()
	public ArrayList<MainTicDTO> selectNew() throws SQLException {
		
		ArrayList<MainTicDTO> newlist = null;
		MainTicDTO dto = null;
		
		String sql =  " SELECT * "
				+ " FROM ( "
				+ "    WITH reviewAVGCNT AS ( "
				+ "        SELECT AVG(rev_point*1.0) ravg, COUNT(*) rcount, tic_code "
				+ "        FROM review "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    maxSale AS ( "
				+ "        SELECT MAX(GWON_SALE) sale, tic_code "
				+ "        FROM opt o "
				+ "        JOIN gwon g ON o.o_code = g.o_code "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    timesale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name tgwon_name, r.regi_stime, r.regi_etime "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '타임세일') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    todaysale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name dgwon_name "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '오늘할인') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    sumticket AS ( "
				+ "        SELECT SUM(book_cnt) sumticket, tic_code "
				+ "        FROM payed p "
				+ "        JOIN gwon g ON p.gwon_code = g.gwon_code "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        GROUP BY tic_code "
				+ "    ) "
				+ "    SELECT a.tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name, gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, "
				+ "        NVL2(sale, sale, 0) msale, NVL2(tic_price*((100-maxSale.sale)/100), tic_price*((100-maxSale.sale)/100), tic_price) stic_price, NVL2(ravg, ravg, 0) ravg, NVL2(rcount, rcount, 0) rcount, tgwon_name, dgwon_name, NVL2(sumticket, sumticket, 0) sticket "
				+ "    FROM ( "
				+ "        SELECT t.tic_code, tic_name, tic_prof, reg_code, t.lcate_code, lcate_name, t.scate_code, scate_name, t.gen_code, gen_name, tic_price, tic_loc, tic_regist, trunc(sysdate-tic_regist) newb, tic_kids "
				+ "        FROM ticket t "
				+ "        LEFT JOIN l_category l ON t.lcate_code = l.lcate_code"
				+ "        LEFT JOIN s_category s ON t.scate_code = s.scate_code "
				+ "        LEFT JOIN genre g ON t.gen_code = g.gen_code "
				+ "    ) a "
				+ "    LEFT JOIN reviewAVGCNT ON a.tic_code = reviewAVGCNT.tic_code "
				+ "    LEFT JOIN maxSale ON maxSale.tic_code = a.tic_code"
				+ "    LEFT JOIN timesale ON timesale.tic_code = a.tic_code"
				+ "    LEFT JOIN todaysale ON todaysale.tic_code = a.tic_code"
				+ "    LEFT JOIN sumticket ON sumticket.tic_code = a.tic_code"
				+ " ) "
				+ " WHERE TRUNC(sysdate - tic_regist) <= 7 " ;
					
		
		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		///필드 선언
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
	    int stic_price;
	    double ravg;
	    int rcount;
	    String tgwon_name;
	    String dgwon_name;
	    int sticket;

	if(rs.next()) {
		newlist = new ArrayList<MainTicDTO>();
		do {
			tic_code = rs.getString("tic_code");
			tic_name = rs.getString("tic_name");
			tic_prof = rs.getString("tic_prof");
			reg_code = rs.getString("reg_code");
			lcate_code = rs.getString("lcate_code");
			lcate_name = rs.getString("lcate_name");
			scate_code = rs.getString("scate_code");
			scate_name = rs.getString("scate_name");
			gen_code = rs.getString("gen_code");
			gen_name = rs.getString("gen_name");
			tic_price = rs.getInt("tic_price");
			tic_loc = rs.getString("tic_loc");
			tic_regist = rs.getDate("tic_regist");
			newb = rs.getInt("newb");
			tic_kids = rs.getInt("tic_kids");
			msale = rs.getInt("msale");
			stic_price = rs.getInt("stic_price");
			ravg = rs.getDouble("ravg");
			rcount = rs.getInt("rcount");
			tgwon_name = rs.getString("tgwon_name");
			dgwon_name = rs.getString("dgwon_name");
			sticket = rs.getInt("sticket");

			dto = new MainTicDTO(tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name,
                    gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, msale, stic_price,
                    ravg, rcount, tgwon_name, dgwon_name, sticket);
				newlist.add(dto);
			} while (rs.next());
		}//if

		this.pstmt.close();
		this.rs.close();

		return newlist;
	}
		

//체험 여가 selectLcate3()
	public ArrayList<MainTicDTO> selectLcate3() throws SQLException {
		
		ArrayList<MainTicDTO> l3list = null;
		MainTicDTO dto = null;
		
		String sql =  " SELECT * "
				+ " FROM ( "
				+ "    WITH reviewAVGCNT AS ( "
				+ "        SELECT AVG(rev_point*1.0) ravg, COUNT(*) rcount, tic_code "
				+ "        FROM review "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    maxSale AS ( "
				+ "        SELECT MAX(GWON_SALE) sale, tic_code "
				+ "        FROM opt o "
				+ "        JOIN gwon g ON o.o_code = g.o_code "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    timesale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name tgwon_name, r.regi_stime, r.regi_etime "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '타임세일') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    todaysale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name dgwon_name "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '오늘할인') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    sumticket AS ( "
				+ "        SELECT SUM(book_cnt) sumticket, tic_code "
				+ "        FROM payed p "
				+ "        JOIN gwon g ON p.gwon_code = g.gwon_code "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        GROUP BY tic_code "
				+ "    ) "
				+ "    SELECT a.tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name, gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, "
				+ "        NVL2(sale, sale, 0) msale, NVL2(tic_price*((100-maxSale.sale)/100), tic_price*((100-maxSale.sale)/100), tic_price) stic_price, NVL2(ravg, ravg, 0) ravg, NVL2(rcount, rcount, 0) rcount, tgwon_name, dgwon_name, NVL2(sumticket, sumticket, 0) sticket "
				+ "    FROM ( "
				+ "        SELECT t.tic_code, tic_name, tic_prof, reg_code, t.lcate_code, lcate_name, t.scate_code, scate_name, t.gen_code, gen_name, tic_price, tic_loc, tic_regist, trunc(sysdate-tic_regist) newb, tic_kids "
				+ "        FROM ticket t "
				+ "        LEFT JOIN l_category l ON t.lcate_code = l.lcate_code"
				+ "        LEFT JOIN s_category s ON t.scate_code = s.scate_code "
				+ "        LEFT JOIN genre g ON t.gen_code = g.gen_code "
				+ "    ) a "
				+ "    LEFT JOIN reviewAVGCNT ON a.tic_code = reviewAVGCNT.tic_code "
				+ "    LEFT JOIN maxSale ON maxSale.tic_code = a.tic_code"
				+ "    LEFT JOIN timesale ON timesale.tic_code = a.tic_code"
				+ "    LEFT JOIN todaysale ON todaysale.tic_code = a.tic_code"
				+ "    LEFT JOIN sumticket ON sumticket.tic_code = a.tic_code"
				+ " ) "
				+ " WHERE lcate_code = 'lcate_3' " ;
		
		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		///필드 선언
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
	    int stic_price;
	    double ravg;
	    int rcount;
	    String tgwon_name;
	    String dgwon_name;
	    int sticket;

	if(rs.next()) {
		l3list = new ArrayList<MainTicDTO>();
		do {
			tic_code = rs.getString("tic_code");
			tic_name = rs.getString("tic_name");
			tic_prof = rs.getString("tic_prof");
			reg_code = rs.getString("reg_code");
			lcate_code = rs.getString("lcate_code");
			lcate_name = rs.getString("lcate_name");
			scate_code = rs.getString("scate_code");
			scate_name = rs.getString("scate_name");
			gen_code = rs.getString("gen_code");
			gen_name = rs.getString("gen_name");
			tic_price = rs.getInt("tic_price");
			tic_loc = rs.getString("tic_loc");
			tic_regist = rs.getDate("tic_regist");
			newb = rs.getInt("newb");
			tic_kids = rs.getInt("tic_kids");
			msale = rs.getInt("msale");
			stic_price = rs.getInt("stic_price");
			ravg = rs.getDouble("ravg");
			rcount = rs.getInt("rcount");
			tgwon_name = rs.getString("tgwon_name");
			dgwon_name = rs.getString("dgwon_name");
			sticket = rs.getInt("sticket");

			dto = new MainTicDTO(tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name,
                    gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, msale, stic_price,
                    ravg, rcount, tgwon_name, dgwon_name, sticket);
				l3list.add(dto);
			} while (rs.next());
		}//if

		this.pstmt.close();
		this.rs.close();

		return l3list;
	}
		
	
//전시 selectLcate2()
		public ArrayList<MainTicDTO> selectLcate2() throws SQLException {
		
		ArrayList<MainTicDTO> l2list = null;
		MainTicDTO dto = null;
		
		String sql =  " SELECT * "
				+ " FROM ( "
				+ "    WITH reviewAVGCNT AS ( "
				+ "        SELECT AVG(rev_point*1.0) ravg, COUNT(*) rcount, tic_code "
				+ "        FROM review "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    maxSale AS ( "
				+ "        SELECT MAX(GWON_SALE) sale, tic_code "
				+ "        FROM opt o "
				+ "        JOIN gwon g ON o.o_code = g.o_code "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    timesale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name tgwon_name, r.regi_stime, r.regi_etime "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '타임세일') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    todaysale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name dgwon_name "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '오늘할인') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    sumticket AS ( "
				+ "        SELECT SUM(book_cnt) sumticket, tic_code "
				+ "        FROM payed p "
				+ "        JOIN gwon g ON p.gwon_code = g.gwon_code "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        GROUP BY tic_code "
				+ "    ) "
				+ "    SELECT a.tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name, gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, "
				+ "        NVL2(sale, sale, 0) msale, NVL2(tic_price*((100-maxSale.sale)/100), tic_price*((100-maxSale.sale)/100), tic_price) stic_price, NVL2(ravg, ravg, 0) ravg, NVL2(rcount, rcount, 0) rcount, tgwon_name, dgwon_name, NVL2(sumticket, sumticket, 0) sticket "
				+ "    FROM ( "
				+ "        SELECT t.tic_code, tic_name, tic_prof, reg_code, t.lcate_code, lcate_name, t.scate_code, scate_name, t.gen_code, gen_name, tic_price, tic_loc, tic_regist, trunc(sysdate-tic_regist) newb, tic_kids "
				+ "        FROM ticket t "
				+ "        LEFT JOIN l_category l ON t.lcate_code = l.lcate_code"
				+ "        LEFT JOIN s_category s ON t.scate_code = s.scate_code "
				+ "        LEFT JOIN genre g ON t.gen_code = g.gen_code "
				+ "    ) a "
				+ "    LEFT JOIN reviewAVGCNT ON a.tic_code = reviewAVGCNT.tic_code "
				+ "    LEFT JOIN maxSale ON maxSale.tic_code = a.tic_code"
				+ "    LEFT JOIN timesale ON timesale.tic_code = a.tic_code"
				+ "    LEFT JOIN todaysale ON todaysale.tic_code = a.tic_code"
				+ "    LEFT JOIN sumticket ON sumticket.tic_code = a.tic_code"
				+ " ) "
				+ " WHERE lcate_code = 'lcate_2' " ;

		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		///필드 선언
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
	    int stic_price;
	    double ravg;
	    int rcount;
	    String tgwon_name;
	    String dgwon_name;
	    int sticket;

	if(rs.next()) {
		l2list = new ArrayList<MainTicDTO>();
		do {
			tic_code = rs.getString("tic_code");
			tic_name = rs.getString("tic_name");
			tic_prof = rs.getString("tic_prof");
			reg_code = rs.getString("reg_code");
			lcate_code = rs.getString("lcate_code");
			lcate_name = rs.getString("lcate_name");
			scate_code = rs.getString("scate_code");
			scate_name = rs.getString("scate_name");
			gen_code = rs.getString("gen_code");
			gen_name = rs.getString("gen_name");
			tic_price = rs.getInt("tic_price");
			tic_loc = rs.getString("tic_loc");
			tic_regist = rs.getDate("tic_regist");
			newb = rs.getInt("newb");
			tic_kids = rs.getInt("tic_kids");
			msale = rs.getInt("msale");
			stic_price = rs.getInt("stic_price");
			ravg = rs.getDouble("ravg");
			rcount = rs.getInt("rcount");
			tgwon_name = rs.getString("tgwon_name");
			dgwon_name = rs.getString("dgwon_name");
			sticket = rs.getInt("sticket");

			dto = new MainTicDTO(tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name,
                    gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, msale, stic_price,
                    ravg, rcount, tgwon_name, dgwon_name, sticket);
				l2list.add(dto);
			} while (rs.next());
		}//if

		this.pstmt.close();
		this.rs.close();

		return l2list;
	}
		
		
//원데이 클래스 selectLcate5()
		public ArrayList<MainTicDTO> selectLcate5() throws SQLException {
		
		ArrayList<MainTicDTO> l5list = null;
		MainTicDTO dto = null;
		
		String sql =  " SELECT * "
				+ " FROM ( "
				+ "    WITH reviewAVGCNT AS ( "
				+ "        SELECT AVG(rev_point*1.0) ravg, COUNT(*) rcount, tic_code "
				+ "        FROM review "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    maxSale AS ( "
				+ "        SELECT MAX(GWON_SALE) sale, tic_code "
				+ "        FROM opt o "
				+ "        JOIN gwon g ON o.o_code = g.o_code "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    timesale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name tgwon_name, r.regi_stime, r.regi_etime "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '타임세일') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    todaysale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name dgwon_name "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '오늘할인') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    sumticket AS ( "
				+ "        SELECT SUM(book_cnt) sumticket, tic_code "
				+ "        FROM payed p "
				+ "        JOIN gwon g ON p.gwon_code = g.gwon_code "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        GROUP BY tic_code "
				+ "    ) "
				+ "    SELECT a.tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name, gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, "
				+ "        NVL2(sale, sale, 0) msale, NVL2(tic_price*((100-maxSale.sale)/100), tic_price*((100-maxSale.sale)/100), tic_price) stic_price, NVL2(ravg, ravg, 0) ravg, NVL2(rcount, rcount, 0) rcount, tgwon_name, dgwon_name, NVL2(sumticket, sumticket, 0) sticket "
				+ "    FROM ( "
				+ "        SELECT t.tic_code, tic_name, tic_prof, reg_code, t.lcate_code, lcate_name, t.scate_code, scate_name, t.gen_code, gen_name, tic_price, tic_loc, tic_regist, trunc(sysdate-tic_regist) newb, tic_kids "
				+ "        FROM ticket t "
				+ "        LEFT JOIN l_category l ON t.lcate_code = l.lcate_code"
				+ "        LEFT JOIN s_category s ON t.scate_code = s.scate_code "
				+ "        LEFT JOIN genre g ON t.gen_code = g.gen_code "
				+ "    ) a "
				+ "    LEFT JOIN reviewAVGCNT ON a.tic_code = reviewAVGCNT.tic_code "
				+ "    LEFT JOIN maxSale ON maxSale.tic_code = a.tic_code"
				+ "    LEFT JOIN timesale ON timesale.tic_code = a.tic_code"
				+ "    LEFT JOIN todaysale ON todaysale.tic_code = a.tic_code"
				+ "    LEFT JOIN sumticket ON sumticket.tic_code = a.tic_code"
				+ " ) "
				+ " WHERE lcate_code = 'lcate_5' " ;

		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		///필드 선언
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
	    int stic_price;
	    double ravg;
	    int rcount;
	    String tgwon_name;
	    String dgwon_name;
	    int sticket;

	if(rs.next()) {
		l5list = new ArrayList<MainTicDTO>();
		do {
			tic_code = rs.getString("tic_code");
			tic_name = rs.getString("tic_name");
			tic_prof = rs.getString("tic_prof");
			reg_code = rs.getString("reg_code");
			lcate_code = rs.getString("lcate_code");
			lcate_name = rs.getString("lcate_name");
			scate_code = rs.getString("scate_code");
			scate_name = rs.getString("scate_name");
			gen_code = rs.getString("gen_code");
			gen_name = rs.getString("gen_name");
			tic_price = rs.getInt("tic_price");
			tic_loc = rs.getString("tic_loc");
			tic_regist = rs.getDate("tic_regist");
			newb = rs.getInt("newb");
			tic_kids = rs.getInt("tic_kids");
			msale = rs.getInt("msale");
			stic_price = rs.getInt("stic_price");
			ravg = rs.getDouble("ravg");
			rcount = rs.getInt("rcount");
			tgwon_name = rs.getString("tgwon_name");
			dgwon_name = rs.getString("dgwon_name");
			sticket = rs.getInt("sticket");

			dto = new MainTicDTO(tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name,
                    gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, msale, stic_price,
                    ravg, rcount, tgwon_name, dgwon_name, sticket);
				l5list.add(dto);
			} while (rs.next());
		}//if

		this.pstmt.close();
		this.rs.close();

		return l5list;
	}
		
		
//어린이 뮤지컬	selectKids()
		
		public ArrayList<MainTicDTO> selectKids() throws SQLException {

		ArrayList<MainTicDTO> kidslist = null;
		MainTicDTO dto = null;
		
		String sql =  " SELECT * "
				+ " FROM ( "
				+ "    WITH reviewAVGCNT AS ( "
				+ "        SELECT AVG(rev_point*1.0) ravg, COUNT(*) rcount, tic_code "
				+ "        FROM review "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    maxSale AS ( "
				+ "        SELECT MAX(GWON_SALE) sale, tic_code "
				+ "        FROM opt o "
				+ "        JOIN gwon g ON o.o_code = g.o_code "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    timesale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name tgwon_name, r.regi_stime, r.regi_etime "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '타임세일') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    todaysale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name dgwon_name "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '오늘할인') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    sumticket AS ( "
				+ "        SELECT SUM(book_cnt) sumticket, tic_code "
				+ "        FROM payed p "
				+ "        JOIN gwon g ON p.gwon_code = g.gwon_code "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        GROUP BY tic_code "
				+ "    ) "
				+ "    SELECT a.tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name, gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, "
				+ "        NVL2(sale, sale, 0) msale, NVL2(tic_price*((100-maxSale.sale)/100), tic_price*((100-maxSale.sale)/100), tic_price) stic_price, NVL2(ravg, ravg, 0) ravg, NVL2(rcount, rcount, 0) rcount, tgwon_name, dgwon_name, NVL2(sumticket, sumticket, 0) sticket "
				+ "    FROM ( "
				+ "        SELECT t.tic_code, tic_name, tic_prof, reg_code, t.lcate_code, lcate_name, t.scate_code, scate_name, t.gen_code, gen_name, tic_price, tic_loc, tic_regist, trunc(sysdate-tic_regist) newb, tic_kids "
				+ "        FROM ticket t "
				+ "        LEFT JOIN l_category l ON t.lcate_code = l.lcate_code"
				+ "        LEFT JOIN s_category s ON t.scate_code = s.scate_code "
				+ "        LEFT JOIN genre g ON t.gen_code = g.gen_code "
				+ "    ) a "
				+ "    LEFT JOIN reviewAVGCNT ON a.tic_code = reviewAVGCNT.tic_code "
				+ "    LEFT JOIN maxSale ON maxSale.tic_code = a.tic_code"
				+ "    LEFT JOIN timesale ON timesale.tic_code = a.tic_code"
				+ "    LEFT JOIN todaysale ON todaysale.tic_code = a.tic_code"
				+ "    LEFT JOIN sumticket ON sumticket.tic_code = a.tic_code"
				+ " ) "
				+ " WHERE tic_kids = 1 " ;
		
		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		///필드 선언
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
	    int stic_price;
	    double ravg;
	    int rcount;
	    String tgwon_name;
	    String dgwon_name;
	    int sticket;

	if(rs.next()) {
		kidslist = new ArrayList<MainTicDTO>();
		do {
			tic_code = rs.getString("tic_code");
			tic_name = rs.getString("tic_name");
			tic_prof = rs.getString("tic_prof");
			reg_code = rs.getString("reg_code");
			lcate_code = rs.getString("lcate_code");
			lcate_name = rs.getString("lcate_name");
			scate_code = rs.getString("scate_code");
			scate_name = rs.getString("scate_name");
			gen_code = rs.getString("gen_code");
			gen_name = rs.getString("gen_name");
			tic_price = rs.getInt("tic_price");
			tic_loc = rs.getString("tic_loc");
			tic_regist = rs.getDate("tic_regist");
			newb = rs.getInt("newb");
			tic_kids = rs.getInt("tic_kids");
			msale = rs.getInt("msale");
			stic_price = rs.getInt("stic_price");
			ravg = rs.getDouble("ravg");
			rcount = rs.getInt("rcount");
			tgwon_name = rs.getString("tgwon_name");
			dgwon_name = rs.getString("dgwon_name");
			sticket = rs.getInt("sticket");

			dto = new MainTicDTO(tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name,
                    gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, msale, stic_price,
                    ravg, rcount, tgwon_name, dgwon_name, sticket);
				kidslist.add(dto);
			} while (rs.next());
		}//if

		this.pstmt.close();
		this.rs.close();

		return kidslist;
	}
		
		
//타임세일 selectTimesale()	
		public ArrayList<MainTicDTO> selectTimesale() throws SQLException {
		
		ArrayList<MainTicDTO> tslist = null;
		MainTicDTO dto = null;
		
		String sql =  " SELECT * "
				+ " FROM ( "
				+ "    WITH reviewAVGCNT AS ( "
				+ "        SELECT AVG(rev_point*1.0) ravg, COUNT(*) rcount, tic_code "
				+ "        FROM review "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    maxSale AS ( "
				+ "        SELECT MAX(GWON_SALE) sale, tic_code "
				+ "        FROM opt o "
				+ "        JOIN gwon g ON o.o_code = g.o_code "
				+ "        GROUP BY tic_code "
				+ "    ), "
				+ "    timesale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name tgwon_name, r.regi_stime, r.regi_etime "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '타임세일') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    todaysale AS ( "
				+ "        SELECT DISTINCT tic_code, gwon_name dgwon_name "
				+ "        FROM gwon g "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        JOIN registration r ON r.regi_num = g.regi_num "
				+ "        WHERE REGEXP_LIKE(gwon_name, '오늘할인') "
				+ "        AND sysdate BETWEEN r.regi_stime AND r.regi_etime "
				+ "    ), "
				+ "    sumticket AS ( "
				+ "        SELECT SUM(book_cnt) sumticket, tic_code "
				+ "        FROM payed p "
				+ "        JOIN gwon g ON p.gwon_code = g.gwon_code "
				+ "        JOIN opt o ON g.o_code = o.o_code "
				+ "        GROUP BY tic_code "
				+ "    ) "
				+ "    SELECT a.tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name, gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, "
				+ "        NVL2(sale, sale, 0) msale, NVL2(tic_price*((100-maxSale.sale)/100), tic_price*((100-maxSale.sale)/100), tic_price) stic_price, NVL2(ravg, ravg, 0) ravg, NVL2(rcount, rcount, 0) rcount, tgwon_name, dgwon_name, NVL2(sumticket, sumticket, 0) sticket "
				+ "    FROM ( "
				+ "        SELECT t.tic_code, tic_name, tic_prof, reg_code, t.lcate_code, lcate_name, t.scate_code, scate_name, t.gen_code, gen_name, tic_price, tic_loc, tic_regist, trunc(sysdate-tic_regist) newb, tic_kids "
				+ "        FROM ticket t "
				+ "        LEFT JOIN l_category l ON t.lcate_code = l.lcate_code"
				+ "        LEFT JOIN s_category s ON t.scate_code = s.scate_code "
				+ "        LEFT JOIN genre g ON t.gen_code = g.gen_code "
				+ "    ) a "
				+ "    LEFT JOIN reviewAVGCNT ON a.tic_code = reviewAVGCNT.tic_code "
				+ "    LEFT JOIN maxSale ON maxSale.tic_code = a.tic_code"
				+ "    LEFT JOIN timesale ON timesale.tic_code = a.tic_code"
				+ "    LEFT JOIN todaysale ON todaysale.tic_code = a.tic_code"
				+ "    LEFT JOIN sumticket ON sumticket.tic_code = a.tic_code"
				+ " ) "
				+ " WHERE tgwon_name = '타임세일' " ;
		

		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		///필드 선언
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
		    int stic_price;
		    double ravg;
		    int rcount;
		    String tgwon_name;
		    String dgwon_name;
		    int sticket;

		if(rs.next()) {
			tslist = new ArrayList<MainTicDTO>();
			do {
				tic_code = rs.getString("tic_code");
				tic_name = rs.getString("tic_name");
				tic_prof = rs.getString("tic_prof");
				reg_code = rs.getString("reg_code");
				lcate_code = rs.getString("lcate_code");
				lcate_name = rs.getString("lcate_name");
				scate_code = rs.getString("scate_code");
				scate_name = rs.getString("scate_name");
				gen_code = rs.getString("gen_code");
				gen_name = rs.getString("gen_name");
				tic_price = rs.getInt("tic_price");
				tic_loc = rs.getString("tic_loc");
				tic_regist = rs.getDate("tic_regist");
				newb = rs.getInt("newb");
				tic_kids = rs.getInt("tic_kids");
				msale = rs.getInt("msale");
				stic_price = rs.getInt("stic_price");
				ravg = rs.getDouble("ravg");
				rcount = rs.getInt("rcount");
				tgwon_name = rs.getString("tgwon_name");
				dgwon_name = rs.getString("dgwon_name");
				sticket = rs.getInt("sticket");

				dto = new MainTicDTO(tic_code, tic_name, tic_prof, reg_code, lcate_code, lcate_name, scate_code, scate_name,
	                    gen_code, gen_name, tic_price, tic_loc, tic_regist, newb, tic_kids, msale, stic_price,
	                    ravg, rcount, tgwon_name, dgwon_name, sticket);
				tslist.add(dto);
			} while (rs.next());
		}//if

		this.pstmt.close();
		this.rs.close();

		return tslist;
	}
	
}
