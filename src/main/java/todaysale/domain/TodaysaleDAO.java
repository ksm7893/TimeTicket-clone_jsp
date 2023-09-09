package todaysale.domain;

import java.sql.SQLException;
import java.util.ArrayList;


public interface TodaysaleDAO {

	// 1. 목록 보기
	TodaysaleDTO todayview(String tic_code) throws SQLException;

}
