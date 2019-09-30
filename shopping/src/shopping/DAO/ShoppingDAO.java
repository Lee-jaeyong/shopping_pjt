package shopping.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import shopping.DTO.Sh_itemDTO;

public class ShoppingDAO {
	private static ShoppingDAO shoppingDAO = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public static ShoppingDAO getInstance() {
		if (shoppingDAO == null)
			try {
				shoppingDAO = new ShoppingDAO();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return shoppingDAO;
	}

	private ShoppingDAO() throws Exception {
		DBConnect();
	}

	private void DBConnect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "apmsetup");
	}

	public static void main(String[] args) throws Exception {
		new ShoppingDAO();
	}

	public ArrayList<Sh_itemDTO> get_itemList() {
		ArrayList<Sh_itemDTO> list = new ArrayList<Sh_itemDTO>();
		String sql = "select * from s_item,s_mainimg where s_item.i_idx = s_mainimg.img_idx limit 0,12";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new Sh_itemDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(8)));
			}								//번호,이름,가격,이미지
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getTotalItem() {
		String sql = "select count(i_idx) from s_item";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
