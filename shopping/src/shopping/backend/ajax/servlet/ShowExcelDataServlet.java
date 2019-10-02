package shopping.backend.ajax.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.collection.ExcelUpload;

@WebServlet("/ShowExcelDataServlet")
public class ShowExcelDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowExcelDataServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String json = ExcelUpload.ExcelParseJson(request.getParameter("path"));
		response.getWriter().write(json);
	}
}
