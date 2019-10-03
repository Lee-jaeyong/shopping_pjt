package shopping.backend.DAO;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import shopping.backend.DTO.UserDTO;

public class UserDAO {
	private static UserDAO userDAO = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public static UserDAO getInstance() {
		if (userDAO == null)
			userDAO = new UserDAO();
		return userDAO;
	}

	private UserDAO() {
		DBConnect();
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

	public ArrayList<UserDTO> SelectUserList(int pageNum, String search, int showType, String sortType) {
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();

		String sql = "select u_idx,u_identy,u_phone1,u_phone2,u_phone3,u_name,u_birth,u_address,u_date from s_user";
		sql += " where u_name like ? order by " + sortType + " desc limit ?," + showType;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, pageNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int u_idx = rs.getInt(1);
				String u_identy = rs.getString(2);
				String u_phone = rs.getString(3) + "-" + rs.getString(4) + "-" + rs.getString(5);
				String u_name = rs.getString(6);
				String u_birth = rs.getString(7);
				String u_address = rs.getString(8);
				String u_date = rs.getString(9);
				list.add(new UserDTO(u_idx, u_identy, u_phone, u_name, u_birth, u_address, u_date));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getTotalCount(String search) {
		String sql = "select count(u_idx) from s_user where u_name like ?";
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
