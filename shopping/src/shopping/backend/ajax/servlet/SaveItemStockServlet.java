package shopping.backend.ajax.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.ItemDAO;

@WebServlet("/SaveItemStockServlet")
public class SaveItemStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveItemStockServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		ItemDAO itemDAO = ItemDAO.getInstance();
		String[] updateStock = request.getParameter("updateStock").split(",");
		String[] updateKey = request.getParameter("updateKey").split(",");
		for (int i = 0; i < updateStock.length; i++) {
			if (!itemDAO.updateStock(Integer.parseInt(updateKey[i]), Integer.parseInt(updateStock[i]))) {
				response.getWriter().write("{\"result\":\"false\"}");
				return;
			}
		}
		response.getWriter().write("{\"result\":\"true\"}");
	}
}
