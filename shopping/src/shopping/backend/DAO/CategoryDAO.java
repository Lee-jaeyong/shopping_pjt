package shopping.backend.DAO;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import shopping.backend.DTO.CategoryDTO;

public class CategoryDAO {
	private static CategoryDAO categoryDAO = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private CategoryDAO() {
		DBConnect();
	}

	public static CategoryDAO getInstance() {
		if (categoryDAO == null)
			categoryDAO = new CategoryDAO();
		return categoryDAO;
	}

	private void DBConnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf8", "root", "apmsetup");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int addCategory(String category, int ckind) {
		String sql = "";
		if (ckind == -1)
			sql = "insert into s_categoryname values (NULL,?)";
		else
			sql = "insert into s_small_categoryname values (" + ckind + ",NULL,?)";
		int count = 0;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public ArrayList<CategoryDTO> getCategoryList() {
		ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
		String sql = "select * from s_categoryName";
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new CategoryDTO(rs.getInt(1), rs.getString(2)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<CategoryDTO> getCsCategoryList(int category) {
		ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
		String sql = "select cs_categoryName from s_small_categoryname where c_idx = " + category;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new CategoryDTO(rs.getString(1)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getCategoryCount(int category, String cs_category) {
		String sql = "select count(c_idx) from s_category,s_small_category where s_category.c_i_idx = s_small_category.cs_i_idx and c_idx = "
				+ category;
		if (!cs_category.equals(""))
			sql = "SELECT count(cs_idx) FROM s_small_category, s_small_categoryname\r\n"
					+ "WHERE s_small_category.cs_idx = s_small_categoryname.csn_idx AND cs_categoryName = '"
					+ cs_category + "'";
		int count = 0;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
