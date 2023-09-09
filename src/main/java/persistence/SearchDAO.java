package persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import domain.SearchDTO;


public interface SearchDAO {

	ArrayList<SearchDTO> search ( String pseq ) throws SQLException;
	
	
}
