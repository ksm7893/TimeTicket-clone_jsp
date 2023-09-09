package domain;

public class BannerDTO {
	private String ban_code;
	private String ban_img;
	private String ban_link;

	public BannerDTO() {
		super();
	}

	public BannerDTO(String ban_code, String ban_img, String ban_link) {
		super();
		this.ban_code = ban_code;
		this.ban_img = ban_img;
		this.ban_link = ban_link;
	}
	
	public String getBan_code() {
		return ban_code;
	}
	public void setBan_code(String ban_code) {
		this.ban_code = ban_code;
	}
	public String getBan_img() {
		return ban_img;
	}
	public void setBan_img(String ban_img) {
		this.ban_img = ban_img;
	}
	public String getBan_link() {
		return ban_link;
	}
	public void setBan_link(String ban_link) {
		this.ban_link = ban_link;
	}

}
