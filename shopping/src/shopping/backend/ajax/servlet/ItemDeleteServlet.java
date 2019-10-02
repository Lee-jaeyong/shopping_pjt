package shopping.backend.ajax.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.ItemDAO;

@WebServlet("/ItemDeleteServlet")
public class ItemDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ItemDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ItemDAO itemDAO = ItemDAO.getInstance();
		int i_idx = Integer.parseInt(request.getParameter("item_idx"));

		if (itemDAO.deleteItem(i_idx) == 1)
			response.getWriter().write("true");
		else
			response.getWriter().write("false");
	}

}
