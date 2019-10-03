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

@WebServlet("/GetCategoryListServlet")
public class GetCategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetCategoryListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		CategoryDAO categoryDAO = CategoryDAO.getInstance();
		ArrayList<CategoryDTO> list = categoryDAO.getCategoryList();
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			int count = categoryDAO.getCategoryCount(list.get(i).getC_idx(), "");
			json.append("{\"value\":\"" + list.get(i).getC_name() + "\", \"c_idx\":\"" + list.get(i).getC_idx()
					+ "\",\"count\":\"" + count + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		response.getWriter().write(json.toString());
	}

}
