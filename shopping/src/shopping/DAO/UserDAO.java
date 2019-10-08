package shopping.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	public static UserDAO userDAO = null;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public static UserDAO getInstance() {
		if(userDAO == null)
			try {
				userDAO = new UserDAO();
			}catch(Exception e) {
				e.printStackTrace();
			}
		return userDAO;
	}
	
	private UserDAO() throws Exception {
		DBConnect();
	}
	
	private void DBConnect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf8", "root", "apmsetup");
	}
	public static void main(String[] args) throws Exception {
		new UserDAO();
	}
	
	public boolean dupCheck(String id) {
		String sql = "SELECT COUNT(u_identy) FROM s_user WHERE u_identy = ?";
		boolean check = true;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			if(rs.getInt(1) > 0) {
				check = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return check;
		
	}
	
	
	
	
}
