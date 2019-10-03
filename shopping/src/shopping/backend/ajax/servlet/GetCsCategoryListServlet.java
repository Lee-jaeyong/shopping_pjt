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

@WebServlet("/GetCsCategoryListServlet")
public class GetCsCategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetCsCategoryListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		CategoryDAO categoryDAO = CategoryDAO.getInstance();
		int category = Integer.parseInt(request.getParameter("category"));
		ArrayList<CategoryDTO> list = categoryDAO.getCsCategoryList(category);
		StringBuilder json = new StringBuilder();
		json.append("{\"result\":[");
		for (int i = 0; i < list.size(); i++) {
			int count = categoryDAO.getCategoryCount(0, list.get(i).getC_name());
			json.append("{\"value\":\"" + list.get(i).getC_name() + "\",\"count\":\"" + count + "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		response.getWriter().write(json.toString());
	}

}
