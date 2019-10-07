package shopping.backend.ajax.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.CategoryDAO;
import shopping.backend.DTO.CategoryDTO;

/**
 * Servlet implementation class GetCsCategoryList_AddItem
 */
@WebServlet("/GetCsCategoryList_AddItem")
public class GetCsCategoryList_AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetCsCategoryList_AddItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		CategoryDAO categoryDAO = CategoryDAO.getInstance();
		ArrayList<CategoryDTO> list = categoryDAO.getCsCategoryList(Integer.parseInt(request.getParameter("category")));
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			json.append("{\"idx\":\"" + list.get(i).getC_idx() + "\",\"value\":\"" + list.get(i).getC_name() + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		response.getWriter().write(json.toString());
	}

}
