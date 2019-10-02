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

	public ArrayList<UserDTO> SelectUserList(String search, int showType, int sortType) {
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();

		String sql = "selcet u_idx,u_identy,u_phone1,u_phone2,u_phone3,u_name,u_birth,u_address,u_date from s_user";
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
