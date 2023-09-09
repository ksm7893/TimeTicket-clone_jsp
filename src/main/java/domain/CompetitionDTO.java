package domain;

import java.sql.Date;

public class  CompetitionDTO{
	private int allcount;
	private double competition;
	public CompetitionDTO() {
		super();
	}
	public int getAllcount() {
		return allcount;
	}
	public void setAllcount(int allcount) {
		this.allcount = allcount;
	}
	public double getCompetition() {
		return competition;
	}
	public void setCompetition(double competition) {
		this.competition = competition;
	}
	public CompetitionDTO(int allcount, double competition) {
		super();
		this.allcount = allcount;
		this.competition = competition;
	}

	
}







