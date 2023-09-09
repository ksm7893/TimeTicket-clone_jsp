package section04.domain;

import java.sql.SQLException;
import java.util.ArrayList;


public interface Section04DAO {

	// 1. 목록 보기
	Section04DTO placeview(String tic_code) throws SQLException;

}
