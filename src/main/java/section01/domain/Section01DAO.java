package section01.domain;

import java.sql.SQLException;
import java.util.ArrayList;


public interface Section01DAO {

	// 1. 목록 보기
	Section01DTO view(String tic_code) throws SQLException;

}
