package shopping.DTO;

public class Sh_itemDTO {
	private int i_idx;
	private String i_name;
	private int i_price;
	private String mainImg;

	public Sh_itemDTO() {

	}

	public Sh_itemDTO(int i_idx, String i_name, int i_price, String mainImg) {
		this.i_idx = i_idx;
		this.i_name = i_name;
		this.i_price = i_price;
		this.mainImg = mainImg;
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

}
