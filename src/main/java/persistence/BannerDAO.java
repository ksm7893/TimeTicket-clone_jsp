package persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import domain.BannerDTO;

public interface BannerDAO {

		//배너 
		ArrayList<BannerDTO> banner() throws SQLException;
}
