package shopping.backend.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import shopping.backend.DTO.ItemDTO;

public class ItemDAO {
	private static ItemDAO itemDAO = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public static ItemDAO getInstance() {
		if (itemDAO == null)
			try {
				itemDAO = new ItemDAO();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return itemDAO;
	}

	private ItemDAO() throws Exception {
		DBConnect();
	}

	private void DBConnect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "apmsetup");
	}

	public int getTotallist(String c_category, String cs_category, String search) {
		try {
			String sql = "select count(*) from s_item where i_name like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<ItemDTO> getlist(int page, String search, String sortType, int showType) {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		try {
			String sql = "select distinct(i_idx),\r\n" + "i_name,\r\n" + "c_categoryName,\r\n" + "cs_categoryName,\r\n"
					+ "i_price,\r\n" + "img_path,\r\n" + "i_hit,\r\n" + "i_date\r\n"
					+ "from s_item,s_mainimg,s_category,s_small_category\r\n"
					+ "where s_item.i_idx = s_mainimg.img_idx and\r\n" + " s_item.i_idx = s_category.c_i_idx and \r\n"
					+ "s_item.i_idx = s_small_category.cs_i_idx\r\n and i_name like ? order by " + sortType
					+ " desc limit " + page * 5 + "," + showType + "";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int i_idx = rs.getInt(1);
				String i_name = rs.getString(2);
				String c_categoryName = rs.getString(3);
				String cs_categoryName = rs.getString(4);
				int i_price = rs.getInt(5);
				String img_path = rs.getString(6);
				int i_hit = rs.getInt(7);
				String i_date = rs.getString(8);
				list.add(new ItemDTO(i_idx, i_name, c_categoryName, cs_categoryName, i_price, img_path, i_hit, i_date));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
