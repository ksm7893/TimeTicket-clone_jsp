package timesale.domain;

import java.sql.SQLException;
import java.util.ArrayList;


public interface TimesaleDAO {

	// 1. 목록 보기
	TimesaleDTO timeview(String tic_code) throws SQLException;

}
