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
	int re;
	
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
	
	public void joinDB(String id,String pw,String email,String name,String phone1,String phone2,String phone3,String birth,String address) {
		String sql = "INSERT INTO s_user(u_identy,u_password,u_email,u_phone1,u_phone2,u_phone3,u_name,u_birth,u_address) "
					+ "VALUES(?,?,?,?,?,?,?,?,?);";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			pstmt.setString(4, phone1);
			pstmt.setString(5, phone2);
			pstmt.setString(6, phone3);
			pstmt.setString(7, name);
			pstmt.setString(8, birth);
			pstmt.setString(9, address);
			
			re = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int loginCheck(String id,String pw) {
		
		int result = -1;
		String sql = "SELECT count(u_idx) FROM s_user WHERE u_identy = ? AND u_password = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			result = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	
}
