package persistence;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.CompetitionDTO;
import domain.EdetailDTO;
import domain.JackpotDTO;




public class EventDAOImpl implements EventDAO {
	
	private Connection conn;
	// getter
	public Connection getConn() {
		return conn;
	}
		
	private PreparedStatement pstmt;
	private ResultSet rs;
			
	public EventDAOImpl() {
		super();		
	}
	public EventDAOImpl( Connection conn ) {
		super();		
		this.conn = conn;
	}
		
	@Override
	public ArrayList<EdetailDTO> select( ) throws SQLException {
		ArrayList<EdetailDTO> elist = null;
		EdetailDTO dto = null;
		
		 String eve_code;
		 String tic_code;
		 String tic_name;
		 String eve_cond;
		 int eve_tar;
		 String  eve_stdate;
		 String  eve_eddate;
		 String eve_anno;
		 String tic_prof;
		 String scate_name;
		
		
		String sql ="select eve_code,e.tic_code,tic_name,eve_cond,eve_tar "
				+ " ,replace(eve_stdate||'('||to_char(eve_stdate,'dy')||')','/','.') AS eve_stdate ,replace(Substr(eve_eddate||'('||to_char(eve_eddate,'dy')||')',4),'/','.') AS eve_eddate, "
				+ " replace(eve_anno||'('||to_char(eve_anno,'dy')||')','/','.') AS eve_anno,tic_prof,scate_name "
				+ "				from  event e join ticket t  on e.tic_code = t.tic_code  "
				+ "                             join  s_category s on t.scate_code = s.scate_code order by eve_code desc ";

			
		
		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
			
		if( rs.next() ) {
			elist = new ArrayList<EdetailDTO>();
				
			do {
				eve_code = rs.getString("eve_code");
				 tic_code = rs.getString("tic_code");
				 tic_name = rs.getString("tic_name");
				 eve_cond = rs.getString("eve_cond");
				 eve_tar = rs.getInt("eve_tar");
				 eve_stdate = rs.getString("eve_stdate");				
				 eve_eddate = rs.getString("eve_eddate");				
				 eve_anno = rs.getString("eve_anno");		
				 tic_prof = rs.getString("tic_prof");	
				 scate_name = rs.getString("scate_name");	
				dto = new EdetailDTO(eve_code, tic_code,tic_name,eve_cond,eve_tar,eve_stdate,eve_eddate, eve_anno,tic_prof,scate_name);
				elist.add( dto );
			} while ( rs.next() );
		} // if
		this.pstmt.close();
		this.rs.close();
			
		return elist;
	} // select
	
	
	@Override
	public CompetitionDTO competition(String ev_code) throws SQLException {
		int allcount;
	 double competition;
		
		
		String sql = " select allcount, allcount/eve_tar AS competition "
				+ "         from( "
				+ "            select count(*) AS allcount,eve_code "
				+ "            From entry_event "
				+ "            WHERE eve_code = ? "
				+ "            Group by eve_code) s JOIN event e ON s.eve_code = e.eve_code ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, ev_code);  
		this.rs = this.pstmt.executeQuery();
		
		CompetitionDTO dto =null;
		if( this.rs.next() ) {
			allcount = this.rs.getInt("allcount");
			competition = this.rs.getDouble("competition");
			dto = new CompetitionDTO(allcount, competition);
		}
		return dto;
	}
	
	
	@Override
	public EdetailDTO detail(String e_code) throws SQLException {
		String sql =  "SELECT eve_code, t.tic_code as tic_code ,tic_name,tic_prof,eve_cond,replace(eve_stdate||'('||to_char(eve_stdate,'dy')||')','/','.') AS eve_stdate "
				+ " ,replace(Substr(eve_eddate||'('||to_char(eve_eddate,'dy')||')',4),'/','.') AS eve_eddate, "
				+ " replace(eve_anno||'('||to_char(eve_anno,'dy')||')','/','.') AS eve_anno,eve_tar,place,scate_name,tic_age "
				+ "FROM ticket t  join  event e on  t.tic_code = e.tic_code "
				+ "               join  place p on t.tic_code = p.tic_code "
				+ "               join  s_category s on t.scate_code = s.scate_code "
				+ "               where eve_code =  ? "
				+ "               order by eve_stdate DESC ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, e_code);  
		this.rs = this.pstmt.executeQuery();
		//eve_code,tic_code,tic_name,tic_prof,eve_cond,eve_stdate,eve_eddate,
		//eve_anno,eve_tar,place,scate_name,tic_age
		String eve_code;
		String tic_code;
		String tic_name;
		String tic_prof;
		String eve_cond;
		String eve_stdate;
		String eve_eddate;
		String eve_anno;
		int eve_tar;
		String place;
		String scate_name;
		String tic_age;
		EdetailDTO edto = null;
		if( this.rs.next() ) {
			eve_code = this.rs.getString("eve_code");
			tic_code = this.rs.getString("tic_code");
			tic_name = this.rs.getString("tic_name");
			tic_prof = this.rs.getString("tic_prof");
			eve_cond = this.rs.getString("eve_cond");
			eve_stdate = this.rs.getString("eve_stdate");
			eve_eddate = this.rs.getString("eve_eddate");
			eve_anno = this.rs.getString("eve_anno");
			eve_tar = this.rs.getInt("eve_tar");
			place = this.rs.getString("place");
			scate_name = this.rs.getString("scate_name");
			tic_age = this.rs.getString("tic_age");
			edto = new EdetailDTO(eve_code,tic_code,tic_name,tic_prof,eve_cond,eve_stdate,eve_eddate,eve_anno,eve_tar,place,scate_name,tic_age);
		} // view
		return edto;
	}
	

	@Override
	public ArrayList<JackpotDTO> jackpot(String pseq) throws SQLException {
		ArrayList<JackpotDTO> jlist = null;
		JackpotDTO dto = null;
		
		String mem_id;
		String mem_name;
		String mem_num;
		
		String sql ="select e.mem_id ,replace(mem_name,substr(mem_name,2,1),'*') AS mem_name, REPLACE(mem_num, SUBSTR(mem_num,5,4),'****') AS mem_num "
				+ "            From entry_event e join mem m on e.mem_id = m.mem_id  "
				+ "            WHERE eve_code = ? and ent_stat = 1";
		
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, pseq);
		this.rs = this.pstmt.executeQuery();
			
		if( rs.next() ) {
			jlist = new ArrayList<JackpotDTO>();
				
			do {

				mem_id = rs.getString("mem_id");
				mem_name = rs.getString("mem_name");
				mem_num = rs.getString("mem_num");				
					
				dto = new JackpotDTO( mem_id,mem_name, mem_num);
				jlist.add( dto );
			} while ( rs.next() );
		} // if
			
		this.pstmt.close();
		this.rs.close();
		this.conn.close();
		return jlist;
	}
	}


	
	

	

	
