package section03.domain;

import java.sql.SQLException;
import java.util.ArrayList;


public interface Section03DAO {

	// 1. 목록 보기
	Section03DTO infoview(String tic_code) throws SQLException;

}
