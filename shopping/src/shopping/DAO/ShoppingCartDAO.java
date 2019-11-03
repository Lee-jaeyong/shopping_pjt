package shopping.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import shopping.DTO.ShoppingCartDTO;

public class ShoppingCartDAO {
	private static ShoppingCartDAO shoppingCartDAO = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int re;

	public static ShoppingCartDAO getInstance() {

		if (shoppingCartDAO == null) {
			try {
				shoppingCartDAO = new ShoppingCartDAO();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return shoppingCartDAO;
	}

	private ShoppingCartDAO() throws Exception {
		DBConnect();
	}

	private void DBConnect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf8", "root", "apmsetup");
	}

	public static void main(String[] args) throws Exception {
		new ShoppingCartDAO();
	}

	public int addCart(String user, int i_idx, String size, String color, int count, String date) {

		String sql = "select count(ct_i_idx),ct_count from s_cart where ct_user = '" + user + "' and ct_i_idx = '"
				+ i_idx + "' and ct_size = '" + size + "' and ct_color = '" + color + "'";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) > 0) {
				String update = "UPDATE s_cart SET ct_count = " + (rs.getInt(2) + count) + " WHERE ct_user = '" + user
						+ "' and ct_i_idx = '" + i_idx + "' and ct_size = '" + size + "' and ct_color = '" + color
						+ "'";

				try {
					pstmt = conn.prepareStatement(update);
					re = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("update오류");
				}
			} else {
				String insert = "insert s_cart values(NULL,'" + user + "'," + i_idx + ",'" + size + "','" + color + "',"
						+ count + ",'" + date + "')";
				try {
					pstmt = conn.prepareStatement(insert);
					re = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("insert 오류");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;

	}

	public ArrayList<ShoppingCartDTO> getCartList(String user) {
		ArrayList<ShoppingCartDTO> list = new ArrayList<ShoppingCartDTO>();

		String sql = "SELECT s_cart.*,s_item.i_price,s_mainimg.img_path,s_item.i_name FROM s_mainimg,s_cart,s_item WHERE s_mainimg.img_idx = s_item.i_idx AND s_cart.ct_i_idx = s_item.i_idx AND ct_user = '"
				+ user + "'";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ShoppingCartDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getString(5), rs.getInt(6), rs.getInt(8), rs.getString(9), rs.getString(10)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void deleteCart(int ct_idx) {
		String sql = "DELETE FROM s_cart WHERE ct_idx = " + ct_idx;

		try {
			pstmt = conn.prepareStatement(sql);
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
