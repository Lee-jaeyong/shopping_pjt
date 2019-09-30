package shopping.backend.DTO;

public class ItemDTO {
	private int i_idx;
	private String i_name;
	private int i_price;
	private String i_detailimg;
	private int i_option_id;
	private String i_info;
	private int i_hit;
	private String i_date;
	private String c_cagetoryName;
	private String cs_categoryName;
	private String img_path;

	public ItemDTO(int i_idx, String i_name, String c_categoryName, String cs_categoryName, int i_price,
			String img_path, int i_hit, String i_date) {
		this.i_idx = i_idx;
		this.i_name = i_name;
		this.c_cagetoryName = c_categoryName;
		this.cs_categoryName = cs_categoryName;
		this.i_price = i_price;
		this.img_path = img_path;
		this.i_hit = i_hit;
		this.i_date = i_date;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getI_date() {
		return i_date;
	}

	public void setI_date(String i_date) {
		this.i_date = i_date;
	}

	public String getC_cagetoryName() {
		return c_cagetoryName;
	}

	public void setC_cagetoryName(String c_cagetoryName) {
		this.c_cagetoryName = c_cagetoryName;
	}

	public String getCs_categoryName() {
		return cs_categoryName;
	}

	public void setCs_categoryName(String cs_categoryName) {
		this.cs_categoryName = cs_categoryName;
	}

	public int getI_idx() {
		return i_idx;
	}

	public void setI_idx(int i_idx) {
		this.i_idx = i_idx;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public int getI_price() {
		return i_price;
	}

	public void setI_price(int i_price) {
		this.i_price = i_price;
	}

	public String getI_detailimg() {
		return i_detailimg;
	}

	public void setI_detailimg(String i_detailimg) {
		this.i_detailimg = i_detailimg;
	}

	public int getI_option_id() {
		return i_option_id;
	}

	public void setI_option_id(int i_option_id) {
		this.i_option_id = i_option_id;
	}

	public String getI_info() {
		return i_info;
	}

	public void setI_info(String i_info) {
		this.i_info = i_info;
	}

	public int getI_hit() {
		return i_hit;
	}

	public void setI_hit(int i_hit) {
		this.i_hit = i_hit;
	}
}