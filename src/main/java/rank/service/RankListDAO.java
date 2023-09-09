package rank.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class RankListDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<RankListDTO> select(String lcategory,String sort,Connection conn) throws SQLException{
		System.out.println("RankListDao호출");
		RankListDTO dto = null;
		ArrayList<RankListDTO> list = new ArrayList<RankListDTO>();
		DecimalFormat df = new DecimalFormat("#,###");
		int s = 1;
		
		if(sort.equals("daily")) {
			s=1;
		} else if(sort.equals("weekly")) {
			s=7;
		} else if(sort.equals("monthly")){
			s=30;
		}
		System.out.println(lcategory);
		String sql = " SELECT *  "
				+ "  FROM( "
				+ "     select RANK() OVER(ORDER BY SUM(CNT) DESC) ticRank,t.tic_code  , sum(cnt) cnt  "
				+ "     from (  "
				+ "            SELECT tic_code,cnt   				"
				+ "            FROM (  				       "
				+ "                SELECT SUM(book_cnt) cnt,t.tic_code,book_date,t.lcate_code,lcate_name,tic_kids	"
				+ "                FROM payed p LEFT JOIN gwon g ON p.gwon_code = g.gwon_code 				                    "
				+ "                LEFT JOIN opt o ON g.o_code = o.o_code 				                   "
				+ "                LEFT JOIN ticket t ON t.tic_code = o.tic_code 				                    "
				+ "                LEFT JOIN l_category l ON t.lcate_code = l.lcate_code  				        "
				+ "                GROUP BY t.tic_code , book_date , t.lcate_code,lcate_name,tic_kids "
				+ "                ) 				 "
				+ "            WHERE  SYSDATE-book_date <= ? ";
				if(lcategory.equals("all")) {
					sql+=" ";
				} else if(lcategory.equals("lcate_1")||lcategory.equals("lcate_2")||lcategory.equals("lcate_3")) {
					sql+="AND lcate_code = ? ";
				} else if(lcategory.equals("lcate_4")) {
					sql+=" AND tic_kids =? ";
				}
				sql+= "            )  t   "
				+ "        GROUP BY t.tic_code  ORDER BY CNT DESC "
				+ "    ) "
				+ "WHERE ticrank BETWEEN 1 AND 10 ";
				System.out.println(sql);
		String sql2 = " SELECT tic_code,tic_name,tic_price,tic_prof,lcate_code,lcate_name,scate_code,scate_name,gen_code,gen_name,sale,stic_price "
				+ "				 FROM (  "
				+ "				        With  "
				+ "				            maxSale AS (SELECT MAX(GWON_SALE)sale,tic_code FROM opt o JOIN gwon g ON o.o_code = g.o_code GROUP BY tic_code)  "
				+ "				        SELECT a.*,NVL2(sale,sale,0) sale , NVL2(sale,(100-sale)/100*tic_price,tic_price) stic_price  "
				+ "				        FROM(  "
				+ "				                SELECT tic_code,tic_name,tic_price,tic_prof,t.lcate_code,lcate_name,t.scate_code,scate_name,t.gen_code,gen_name "
				+ "				                FROM ticket t LEFT JOIN l_category l ON t.lcate_code = l.lcate_code  "
				+ "				                            LEFT JOIN s_category s ON t.scate_code = s.scate_code  "
				+ "                                            LEFT JOIN genre g ON g.gen_code = t.gen_code "
				+ "				                    )a,maxSale  "
				+ "				        WHERE a.tic_code = maxSale.tic_code(+) AND lcate_code NOT IN ('lcate_5') "
				+ "				        )  "
				+ "				WHERE tic_code = ? ";
		
		String tic_code;
		int cnt ;
		
		String tic_name,tic_prof,lcate_code,lcate_name,scate_code,scate_name,gen_code,gen_name,tic_price,stic_price;
		int sale;
		    
		PreparedStatement pstmt2=conn.prepareCall(sql2);
		ResultSet rs2 =null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, s);
		if(lcategory.equals("all")) {
		} else if(lcategory.equals("lcate_1")||lcategory.equals("lcate_2")||lcategory.equals("lcate_3")) {
			pstmt.setString(2, lcategory);
		} else if(lcategory.equals("lcate_4")) {
			pstmt.setInt(2, 1);
		}
		rs = pstmt.executeQuery();
		if(rs.next()) {
			do {
				tic_code = rs.getString("tic_code");
				cnt = rs.getInt("cnt");
				pstmt2.setString(1, tic_code);
				rs2 = pstmt2.executeQuery();
				if(rs2.next()) {
					tic_code = rs2.getString("tic_code");
					tic_name = rs2.getString("tic_name");
					tic_price = df.format(rs2.getInt("tic_price"));
					tic_prof = rs2.getString("tic_prof");
					lcate_code = rs2.getString("lcate_code");
					lcate_name = rs2.getString("lcate_name");
					scate_code = rs2.getString("scate_code");
					scate_name = rs2.getString("scate_name");
					gen_code = rs2.getString("gen_code");
					gen_name = rs2.getString("gen_name");
					sale = rs2.getInt("sale");
					stic_price = df.format(rs2.getInt("stic_price"));
					dto = new RankListDTO(tic_code, tic_name, tic_price, tic_prof, lcate_code, lcate_name, scate_code, scate_name, gen_code, gen_name, sale, stic_price);
					list.add(dto);
				}
			} while (rs.next());
		}
		
		this.pstmt.close();
		this.rs.close();
		
		return list;
	}

}
