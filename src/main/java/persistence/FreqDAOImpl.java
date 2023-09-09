package persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.FreqDTO;
import domain.GongDTO;

public class FreqDAOImpl implements FreqDAO {
   
   private Connection conn;
   // getter
   public Connection getConn() {
      return conn;
   }
      
   private PreparedStatement pstmt;
   private ResultSet rs;
         
   public FreqDAOImpl() {
      super();      
   }
   public FreqDAOImpl( Connection conn ) {
      super();      
      this.conn = conn;
   }
      
   
   

   @Override
   public FreqDTO view(String fr_code) throws SQLException {
      String sql =     " SELECT freq_code,freq_name ,freq_cont "
            + " FROM freq_question "
            + " WHERE regexp_like(freq_code , ? ,'i')";
      this.pstmt = this.conn.prepareStatement(sql);
      this.pstmt.setString(1, fr_code);  
      this.rs = this.pstmt.executeQuery();
      String freq_name;
      String freq_cont;
      String freq_code;
      FreqDTO dto = null;
      if( this.rs.next() ) {
         freq_code = this.rs.getString("freq_code");
         freq_name = this.rs.getString("freq_name");
         freq_cont = this.rs.getString("freq_cont");
         dto = new FreqDTO(freq_code,freq_name,freq_cont);
      } // view

      return dto;
   }

       
   
   
   
   
   
   @Override
   // 총 페이지수 반환하는 메서드
   public int getTotal() throws SQLException {
      
      
      String sql = "SELECT COUNT(*) "
            + "FROM  freq_question";
        int total = 0;
         this.pstmt = this.conn.prepareStatement(sql);
         this.rs = this.pstmt.executeQuery();      
         if( rs.next() ) {
            total = this.rs.getInt(1);
         }      
         this.pstmt.close();
         this.rs.close();
         return total;
   } // getTotal
   
    public ArrayList<FreqDTO> selectFreq(int currentPage, int numberPerPage) throws SQLException{
    	ArrayList<FreqDTO> list = null;
        FreqDTO dto = null;
        
        int no;
        int order_num;
        String freq_name,freq_code;
        String freq_cont;
        
           
        // BETWEEN ? AND ?
        int begin = ( currentPage - 1 ) * numberPerPage + 1;
        int end = begin + numberPerPage - 1;
        String sql = "SELECT * "
                    + "FROM( "
                    + "        SELECT ROWNUM no, t.* "
                    + "        FROM( "
                    + "                 SELECT to_number(REPLACE(freq_code, 'fq_', '')) AS order_num,  freq_code, freq_name, freq_cont  "
                    + "                FROM freq_question "
                    + "                ORDER BY order_num DESC "
                    + "             ) t "
                    + "     ) m "
                    + "WHERE m.no BETWEEN ? AND ? ";
           
        
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1, begin);
        this.pstmt.setInt(2, end);
        this.rs = this.pstmt.executeQuery();
           
        if( rs.next() ) {
           list = new ArrayList<FreqDTO>();
              
           do {
          	no = rs.getInt("no");
          	order_num = this.rs.getInt("order_num");
              freq_code = this.rs.getString("freq_code");
              freq_name = this.rs.getString("freq_name");
              freq_cont = this.rs.getString("freq_cont");            
                 
              dto = new FreqDTO( no,freq_code, freq_name,freq_cont,order_num );
              list.add( dto );
           } while ( rs.next() );
        } // if
           
        this.pstmt.close();
        this.rs.close();
           
        return list;
}
   
}