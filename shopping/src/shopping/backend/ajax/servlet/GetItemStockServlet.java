package shopping.backend.ajax.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.ItemDAO;
import shopping.backend.DTO.ItemDTO;

@WebServlet("/getItemStockServlet")
public class GetItemStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetItemStockServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		ItemDAO itemDAO = ItemDAO.getInstance();
		ArrayList<ItemDTO> list = itemDAO.getStockList(Integer.parseInt(request.getParameter("data")));
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"color\":\"" + list.get(i).getOp_info_color() + "\",\"size\":\""
					+ list.get(i).getOp_info_size() + "\",\"stock\":\"" + list.get(i).getSt_i_stock()
					+ "\",\"op_idx\":\"" + list.get(i).getOp_idx() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		response.getWriter().write(json.toString());
	}

}
