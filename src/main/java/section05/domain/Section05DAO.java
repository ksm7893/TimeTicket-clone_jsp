package section05.domain;

import java.sql.SQLException;
import java.util.ArrayList;


public interface Section05DAO {

	// 1. 목록 보기
	Section05DTO refundview(String tic_code) throws SQLException;

}
