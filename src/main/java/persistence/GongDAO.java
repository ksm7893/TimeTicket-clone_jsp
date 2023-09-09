package persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import domain.GongDTO;

public interface GongDAO {

	// 1. 글 목록 + 페이징 처리
	ArrayList<GongDTO> selectGong( int currentPage, int numberPerPage ) throws SQLException, NamingException;
	
	// 3. 글 보기
	GongDTO view(String fq_code) throws SQLException;

	
	// 7. 페이징 처리
	int getTotal() throws SQLException;
	
}
