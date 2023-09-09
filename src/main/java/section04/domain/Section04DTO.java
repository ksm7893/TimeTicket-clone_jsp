package section04.domain;


public class Section04DTO {
	private String tic_code;
	private String place;
	private String place_add;
	private String place_park;
	private double place_lat;
	private double place_lon;
	
	
	public Section04DTO() {
		super();
	}


	public Section04DTO(String tic_code, String place, String place_add, String place_park, double place_lat,
			double place_lon) {
		super();
		this.tic_code = tic_code;
		this.place = place;
		this.place_add = place_add;
		this.place_park = place_park;
		this.place_lat = place_lat;
		this.place_lon = place_lon;
	}


	public String getTic_code() {
		return tic_code;
	}


	public void setTic_code(String tic_code) {
		this.tic_code = tic_code;
	}


	public String getPlace() {
		return place;
	}


	public void setPlace(String place) {
		this.place = place;
	}


	public String getPlace_add() {
		return place_add;
	}


	public void setPlace_add(String place_add) {
		this.place_add = place_add;
	}


	public String getPlace_park() {
		return place_park;
	}


	public void setPlace_park(String place_park) {
		this.place_park = place_park;
	}


	public double getPlace_lat() {
		return place_lat;
	}


	public void setPlace_lat(double place_lat) {
		this.place_lat = place_lat;
	}


	public double getPlace_lon() {
		return place_lon;
	}


	public void setPlace_lon(double place_lon) {
		this.place_lon = place_lon;
	}

}
