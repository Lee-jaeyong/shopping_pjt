package shopping.DTO;

public class ShoppingCartDTO {
	private String user;
	private int i_idx;
	private String size;
	private String color;
	private int count;
	private int price;
	private String img;
	private String i_name;
	private int ct_idx;
	
	public String getI_name() {
		return i_name;
	}


	public void setI_name(String i_name) {
		this.i_name = i_name;
	}


	public ShoppingCartDTO(int ct_idx,String user, int i_idx, String size, String color, int count,int price,String img,String i_name) {
		this.user = user;
		this.i_idx = i_idx;
		this.size = size;
		this.color = color;
		this.count = count;
		this.price = price;
		this.img = img;
		this.i_name = i_name;
		this.ct_idx = ct_idx;
	}
	
	
	public int getCt_idx() {
		return ct_idx;
	}


	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getI_idx() {
		return i_idx;
	}
	public void setI_idx(int i_idx) {
		this.i_idx = i_idx;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public boolean equals(ShoppingCartDTO dto) {
		if(this.i_idx == dto.i_idx && this.color == dto.color && this.size == dto.size) {
			return true;
		}else {
			return false;
		}
	}
	
}
