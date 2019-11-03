package shopping.DTO;

public class Sh_itemDTO {
	private int i_idx;
	private String i_name;
	private int i_price;
	private String mainImg;
	private String detailImg;
	private String info;
	private String color;
	private String size;
	private int stock;

	public Sh_itemDTO() {

	}

	public Sh_itemDTO(String color, String size) {
		this.color = color;
		this.size = size;
	}

	public Sh_itemDTO(int i_idx, String i_name, int i_price, String mainImg,String detailImg,String i_info) {
		this.i_idx = i_idx;
		this.i_name = i_name;
		this.i_price = i_price;
		this.mainImg = mainImg;
		this.detailImg = detailImg;
		info = i_info;
	}

	public String getDetailImg() {
		return detailImg;
	}

	public void setDetailImg(String detailImg) {
		this.detailImg = detailImg;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getInfo() {
		return info;
	}

	public int getI_idx() {
		return i_idx;
	}

	public String getI_name() {
		return i_name;
	}

	public int getI_price() {
		return i_price;
	}

	public String getMainImg() {
		return mainImg;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public void setI_idx(int i_idx) {
		this.i_idx = i_idx;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public void setI_price(int i_price) {
		this.i_price = i_price;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

}
