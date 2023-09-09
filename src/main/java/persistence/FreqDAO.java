package persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import domain.FreqDTO;

public interface FreqDAO {

	// 1. 글 목록 + 페이징 처리
	ArrayList<FreqDTO> selectFreq( int currentPage, int numberPerPage ) throws SQLException;
	
	// 3. 글 보기
	FreqDTO view(String fq_code) throws SQLException;

	
	// 7. 페이징 처리
	int getTotal() throws SQLException;
	
}
