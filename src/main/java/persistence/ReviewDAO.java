package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import domain.MainTicDTO;
import domain.ReviewDTO;

public class ReviewDAO {

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;

	//connection 받음
	public Connection getConn() {
		return conn;
	}
	
	//기본 생성자
	public ReviewDAO() {
		super();
	}

	//의존성 주입 DI
	public ReviewDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	//세션 없는거
	
		public ArrayList<ReviewDTO> selectReview() throws SQLException{
			
			ArrayList<ReviewDTO> rvlist = null;
			ReviewDTO dto = null;
			
			String sql = " SELECT * "
					+ " FROM "
					+ "    ( SELECT DISTINCT t.tic_code, t.tic_name, t.tic_back, m.mem_id, m.mem_name, m.mem_point, p.book_code, "
					+ "       r.rev_point, r.rev_img, r.rev_date, r.rev_cont, o.o_date, o.o_time, o.o_option, "
					+ "       g.gwon_name, p.book_price, p.book_date, p.book_cnt, p.book_stat, "
					+ "       ROW_NUMBER() OVER(PARTITION BY p.book_code ORDER BY t.tic_code) AS row_num "
					+ " FROM ticket t "
					+ " LEFT JOIN opt o ON t.tic_code = o.tic_code "
					+ " LEFT JOIN review r ON t.tic_code = r.tic_code "
					+ " LEFT JOIN payed p ON r.book_code = p.book_code "
					+ " LEFT JOIN mem m ON p.mem_id = m.mem_id "
					+ " LEFT JOIN gwon g ON o.o_code = g.o_code "
					+ " GROUP BY t.tic_code, t.tic_name, t.tic_back, m.mem_id, m.mem_name, m.mem_point, p.book_code,  "
					+ "       r.rev_point, r.rev_img, r.rev_date, r.rev_cont, o.o_date, o.o_time, o.o_option, "
					+ "       g.gwon_name, p.book_price, p.book_date, p.book_cnt, p.book_stat "
					+ ") s "
					+ " WHERE s.row_num = 1 AND rev_cont IS NOT NULL " 
					+ " ORDER BY rev_date DESC ";
			
			
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			///필드 선언
			String tic_code;
			String tic_name;
			String tic_back;
			String mem_id;
			String mem_name;
			int mem_point;
			String book_code;
			int rev_point;
			String rev_img;
			Date rev_date;
			String rev_cont;
			Date o_date;
			String o_time;
			String o_option;
			String gwon_name;
			int book_price;
			Date book_date;
			int book_cnt;
			String book_stat;

		if(rs.next()) {
			rvlist = new ArrayList<ReviewDTO>();
			do {
				tic_code = rs.getString("tic_code");
				tic_name = rs.getString("tic_name");
				tic_back = rs.getString("tic_back");
				mem_id = rs.getString("mem_id");
				mem_name = rs.getString("mem_name");
				mem_point = rs.getInt("mem_point");
				book_code = rs.getString("book_code");
				rev_point = rs.getInt("rev_point");
				rev_img = rs.getString("rev_img");
				rev_date = rs.getDate("rev_date");
				rev_cont = rs.getString("rev_cont");
				o_date = rs.getDate("o_date");
				o_time = rs.getString("o_time");
				o_option = rs.getString("o_option");
				gwon_name = rs.getString("gwon_name");
				book_price = rs.getInt("book_price");
				book_date = rs.getDate("book_date");
				book_cnt = rs.getInt("book_cnt");
				book_stat = rs.getString("book_stat");

				dto = new ReviewDTO(tic_code, tic_name, tic_back, mem_id, mem_name, mem_point, book_code, rev_point,
						rev_img, rev_date, rev_cont, o_date, o_time, o_option, gwon_name, book_price, book_date, book_cnt, book_stat);
					rvlist.add(dto);
				} while (rs.next());
			}//if

			this.pstmt.close();
			this.rs.close();

			
			return rvlist;
		}
		
		
		
	//세션 있는거
		public ArrayList<ReviewDTO> selectReview(String mem) throws SQLException{
			
			ArrayList<ReviewDTO> rvlist = null;
			ReviewDTO dto = null;
			
			String sql = " SELECT * "
					+ " FROM "
					+ "    ( SELECT DISTINCT t.tic_code, t.tic_name, t.tic_back, m.mem_id, m.mem_name, m.mem_point, p.book_code, "
					+ "       r.rev_point, r.rev_img, r.rev_date, r.rev_cont, o.o_date, o.o_time, o.o_option, "
					+ "       g.gwon_name, p.book_price, p.book_date, p.book_cnt, p.book_stat, "
					+ "       ROW_NUMBER() OVER(PARTITION BY p.book_code ORDER BY t.tic_code) AS row_num "
					+ " FROM ticket t "
					+ " LEFT JOIN opt o ON t.tic_code = o.tic_code "
					+ " LEFT JOIN review r ON t.tic_code = r.tic_code "
					+ " LEFT JOIN payed p ON r.book_code = p.book_code "
					+ " LEFT JOIN mem m ON p.mem_id = m.mem_id "
					+ " LEFT JOIN gwon g ON o.o_code = g.o_code "
					+ " GROUP BY t.tic_code, t.tic_name, t.tic_back, m.mem_id, m.mem_name, m.mem_point, p.book_code,  "
					+ "       r.rev_point, r.rev_img, r.rev_date, r.rev_cont, o.o_date, o.o_time, o.o_option, "
					+ "       g.gwon_name, p.book_price, p.book_date, p.book_cnt, p.book_stat "
					+ ") s "
					+ " WHERE s.row_num = 1 AND rev_cont IS NOT NULL AND s.mem_id = ? " 
					+ " ORDER BY rev_date DESC ";
			
			
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, mem); //매개변수 1개 줘서 1번 매개변수 지정
			
			this.rs = this.pstmt.executeQuery();
			
			///필드 선언
			String tic_code;
			String tic_name;
			String tic_back;
			String mem_id;
			String mem_name;
			int mem_point;
			String book_code;
			int rev_point;
			String rev_img;
			Date rev_date;
			String rev_cont;
			Date o_date;
			String o_time;
			String o_option;
			String gwon_name;
			int book_price;
			Date book_date;
			int book_cnt;
			String book_stat;

		if(rs.next()) {
			rvlist = new ArrayList<ReviewDTO>();
			do {
				tic_code = rs.getString("tic_code");
				tic_name = rs.getString("tic_name");
				tic_back = rs.getString("tic_back");
				mem_id = rs.getString("mem_id");
				mem_name = rs.getString("mem_name");
				mem_point = rs.getInt("mem_point");
				book_code = rs.getString("book_code");
				rev_point = rs.getInt("rev_point");
				rev_img = rs.getString("rev_img");
				rev_date = rs.getDate("rev_date");
				rev_cont = rs.getString("rev_cont");
				o_date = rs.getDate("o_date");
				o_time = rs.getString("o_time");
				o_option = rs.getString("o_option");
				gwon_name = rs.getString("gwon_name");
				book_price = rs.getInt("book_price");
				book_date = rs.getDate("book_date");
				book_cnt = rs.getInt("book_cnt");
				book_stat = rs.getString("book_stat");

				dto = new ReviewDTO(tic_code, tic_name, tic_back, mem_id, mem_name, mem_point, book_code, rev_point,
						rev_img, rev_date, rev_cont, o_date, o_time, o_option, gwon_name, book_price, book_date, book_cnt, book_stat);
					rvlist.add(dto);
				} while (rs.next());
			}//if

			this.pstmt.close();
			this.rs.close();

			
			return rvlist;
		}
		

	}//ReviewDAO
