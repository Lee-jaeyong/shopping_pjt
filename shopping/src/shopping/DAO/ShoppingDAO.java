package shopping.DAO;

import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

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
}
