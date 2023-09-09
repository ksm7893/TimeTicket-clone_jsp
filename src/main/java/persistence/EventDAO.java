package persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import domain.CompetitionDTO;
import domain.EdetailDTO;
import domain.JackpotDTO;



public interface EventDAO {


	ArrayList <EdetailDTO> select() throws SQLException;
	
	EdetailDTO detail(String e_code)  throws SQLException;
	

	CompetitionDTO competition(String ev_code) throws SQLException;
	
	ArrayList<JackpotDTO> jackpot(String pseq) throws SQLException;
	
}
