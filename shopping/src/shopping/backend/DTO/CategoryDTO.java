package shopping.backend.DTO;

public class CategoryDTO {
	private int c_idx;
	private String c_name;

	public CategoryDTO(String c_name) {
		this.c_name = c_name;
	}

	public CategoryDTO(int c_idx, String c_name) {
		this.c_idx = c_idx;
		this.c_name = c_name;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

}
