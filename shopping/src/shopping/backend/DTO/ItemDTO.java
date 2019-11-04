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
	private int c_categoryNum;
	private int cs_categoryNum;
	private String op_info_color;
	private String op_info_size;
	private int st_i_stock;
	private int op_idx;

	public ItemDTO(String op_info_color, String op_info_size, int st_i_stock, int op_idx) {
		this.op_info_color = op_info_color;
		this.op_info_size = op_info_size;
		this.st_i_stock = st_i_stock;
		this.op_idx = op_idx;
	}

	public ItemDTO(String i_name, int c_categoryNum, int cs_categoryNum, int i_price, String img_path,
			String i_detailimg, String i_info) {
		this.i_name = i_name;
		this.c_categoryNum = c_categoryNum;
		this.cs_categoryNum = cs_categoryNum;
		this.i_price = i_price;
		this.img_path = img_path;
		this.i_detailimg = i_detailimg;
		this.i_info = i_info;
	}

	public ItemDTO(String i_name, int c_categoryNum, String c_cagetoryName, int cs_categoryNum, String cs_categoryName,
			int i_price, String img_path, String i_detailimg, String i_info) {
		this.i_name = i_name;
		this.c_categoryNum = c_categoryNum;
		this.cs_categoryNum = cs_categoryNum;
		this.i_price = i_price;
		this.img_path = img_path;
		this.i_detailimg = i_detailimg;
		this.i_info = i_info;
		this.c_cagetoryName = c_cagetoryName;
		this.cs_categoryName = cs_categoryName;
	}

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

	public int getOp_idx() {
		return op_idx;
	}

	public void setOp_idx(int op_idx) {
		this.op_idx = op_idx;
	}

	public String getOp_info_color() {
		return op_info_color;
	}

	public void setOp_info_color(String op_info_color) {
		this.op_info_color = op_info_color;
	}

	public String getOp_info_size() {
		return op_info_size;
	}

	public void setOp_info_size(String op_info_size) {
		this.op_info_size = op_info_size;
	}

	public int getSt_i_stock() {
		return st_i_stock;
	}

	public void setSt_i_stock(int st_i_stock) {
		this.st_i_stock = st_i_stock;
	}

	public int getCs_categoryNum() {
		return cs_categoryNum;
	}

	public void setCs_categoryNum(int cs_categoryNum) {
		this.cs_categoryNum = cs_categoryNum;
	}

	public int getC_categoryNum() {
		return c_categoryNum;
	}

	public void setC_categoryNum(int c_categoryNum) {
		this.c_categoryNum = c_categoryNum;
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
