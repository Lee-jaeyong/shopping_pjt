package shopping.backend.DAO;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import shopping.backend.DTO.OrderDTO;

public class OrderDAO {
	private static OrderDAO orderDAO = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public static OrderDAO getInstance() {
		if (orderDAO == null)
			orderDAO = new OrderDAO();
		return orderDAO;
	}

	private OrderDAO() {
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

	public int getTotalCount(String search) {
		String sql = "select count(o_idx) from s_order where o_ordername like ?";
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
	
	public ArrayList<OrderDTO> getOrderList(int pageNum, String search, int showType, String sortType) {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select o_idx,u_identy,i_name,o_i_price,o_count,o_ordername,o_address,o_date"
				+ " from s_order,s_user,s_item "
				+ "where s_order.o_u_idx = s_user.u_idx and s_order.o_i_idx = s_item.i_idx and o_ordername like ? order by "+ sortType + " desc limit ?," + showType;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, pageNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new OrderDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
