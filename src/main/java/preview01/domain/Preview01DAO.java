package preview01.domain;

import java.sql.SQLException;
import java.util.ArrayList;


public interface Preview01DAO {

	// 1. 목록 보기
	Preview01DTO preview1(String tic_code) throws SQLException;

}
