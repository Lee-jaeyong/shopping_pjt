package shopping.backend.ajax.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.OrderDAO;
import shopping.backend.DTO.OrderDTO;

/**
 * Servlet implementation class GetOrderListServlet
 */
@WebServlet("/GetOrderListServlet")
public class GetOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetOrderListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		OrderDAO orderDAO = OrderDAO.getInstance();

		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String search = request.getParameter("search");
		int showType = Integer.parseInt(request.getParameter("showType"));
		String sortType = request.getParameter("sortType");

		ArrayList<OrderDTO> list = orderDAO.getOrderList(pageNum * showType, search, showType, sortType);

		int totalCount = orderDAO.getTotalCount(search);
		int startBlock = pageNum / showType * showType;
		int endBlock = startBlock + 10;
		int totalBlock = (int) (Math.ceil(totalCount / (showType * 1.0)));
		if (endBlock > totalBlock)
			endBlock = totalBlock;
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"o_idx\":\""+list.get(i).getO_i_idx()+"\",");
			json.append("\"u_identy\":\""+list.get(i).getU_identy()+"\",");
			json.append("\"i_name\":\""+list.get(i).getI_name()+"\",");
			json.append("\"o_i_price\":\""+list.get(i).getO_i_price()+"\",");
			json.append("\"o_count\":\""+list.get(i).getO_count()+"\",");
			json.append("\"o_ordername\":\""+list.get(i).getO_orderName()+"\",");
			json.append("\"o_address\":\""+list.get(i).getO_address()+"\",");
			json.append("\"o_date\":\""+list.get(i).getO_date()+"\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("], \"totalBlock\":\"" + totalBlock + "\", \"startBlock\":\"" + startBlock + "\",\"endBlock\":\""
				+ endBlock + "\"}");
		
		response.getWriter().write(json.toString());
	}

}
