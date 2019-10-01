package shopping.backend.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf8", "root", "apmsetup");
	}

	public void insertItem(String i_name, int i_price, String i_info, int c_category, int cs_category, String i_mainImg,
			String i_detailImg) throws SQLException {
		try {
			String sql = "insert into s_item values (NULL,?,?,?,0,?,0,now())";
			String category = "";
			String sm_category = "";

			if (c_category == 1)
				category = "상의";
			if (cs_category == 1)
				sm_category = "가디건";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i_name);
			pstmt.setInt(2, i_price);
			pstmt.setString(3, i_detailImg);
			pstmt.setString(4, i_info);

			pstmt.executeUpdate();

			sql = "insert into s_category values (?,?,NULL)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, c_category);
			pstmt.setString(2, category);

			pstmt.executeUpdate();

			sql = "insert into s_mainimg values (NULL,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, i_mainImg);

			pstmt.executeUpdate();

			sql = "insert into s_small_category values (?,?,?,NULL)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, c_category);
			pstmt.setInt(2, cs_category);
			pstmt.setString(3, sm_category);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
		}
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
					+ "s_item.i_idx = s_small_category.cs_i_idx\r\n and i_name like ? order by " + sortType + " desc";
			if (page != -1)
				sql += " limit " + page * 5 + "," + showType + "";
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
