package shopping.backend.ajax.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.CategoryDAO;

@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCategoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		CategoryDAO cateoryDAO = CategoryDAO.getInstance();

		String category = request.getParameter("category");
		String _ckind = request.getParameter("ckind");
		
		int ckind = 0;

		if (_ckind.equals("-1"))
			ckind = -1;
		else
			ckind = Integer.parseInt(_ckind);
		cateoryDAO.addCategory(category, ckind);
	}
}
