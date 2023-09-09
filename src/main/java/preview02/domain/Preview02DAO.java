package preview02.domain;

import java.sql.SQLException;
import java.util.ArrayList;


public interface Preview02DAO {

	// 1. 목록 보기
	ArrayList<Preview02DTO> preview2(String tic_code) throws SQLException;

}
