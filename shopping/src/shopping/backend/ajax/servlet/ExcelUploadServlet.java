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
import shopping.collection.ExcelUpload;

@WebServlet("/ExcelUploadServlet")
public class ExcelUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExcelUploadServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ItemDAO itemDAO = ItemDAO.getInstance();
		String path = request.getParameter("path");

		ArrayList<ItemDTO> list = ExcelUpload.excelUpload(path);
		for (int i = 0; i < list.size(); i++) {
			String i_name = list.get(i).getI_name();
			int c_category = list.get(i).getC_categoryNum();
			int cs_category = list.get(i).getCs_categoryNum();
			int i_price = list.get(i).getI_price();
			String i_main = list.get(i).getImg_path();
			String i_detail = list.get(i).getI_detailimg();
			itemDAO.insertAllItem(i_name, c_category, cs_category, i_price, i_main, i_detail);
		}
	}
}
