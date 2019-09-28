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

/**
 * Servlet implementation class getListServlet
 */
@WebServlet("/getListServlet")
public class getListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public getListServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		ItemDAO itemdao = ItemDAO.getInstance();

		String search = request.getParameter("search");
		int page = Integer.parseInt(request.getParameter("pageNum"));
		String sortType = request.getParameter("sortType");
		int showType = Integer.parseInt(request.getParameter("showType"));
		if (sortType.equals(""))
			sortType = "i_idx";

		ArrayList<ItemDTO> list = itemdao.getlist(page, search, sortType, showType);
		int totalCount = itemdao.getTotallist("", "", search);
		int totalBlock = (int) Math.ceil(totalCount / (double) showType);
		int startBlock = page / showType * showType;
		int endBlock = startBlock + showType;
		if (endBlock >= totalBlock)
			endBlock = totalBlock;

		StringBuilder result = new StringBuilder();
		result.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			result.append("{");
			result.append("\"idx\":\"" + list.get(i).getI_idx() + "\",");
			result.append("\"name\":\"" + list.get(i).getI_name() + "\",");
			result.append("\"c_category\":\"" + list.get(i).getC_cagetoryName() + "\",");
			result.append("\"cs_cateogry\":\"" + list.get(i).getCs_categoryName() + "\",");
			result.append("\"price\":\"" + list.get(i).getI_price() + "\",");
			result.append("\"img_path\":\"" + list.get(i).getImg_path() + "\",");
			result.append("\"hit\":\"" + list.get(i).getI_hit() + "\",");
			result.append("\"date\":\"" + list.get(i).getI_date() + "\"");
			result.append("}");
			if (i != list.size() - 1)
				result.append(",");
		}
		result.append("],");
		result.append("\"startBlock\":\"" + startBlock + "\",\"endBlock\":\"" + endBlock + "\",\"totalBlock\":\""
				+ totalBlock + "\"}");
		response.getWriter().write(result.toString());
	}

}
