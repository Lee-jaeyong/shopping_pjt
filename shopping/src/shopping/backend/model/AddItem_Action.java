package shopping.backend.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.ItemDAO;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class AddItem_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemDAO itemDAO = ItemDAO.getInstance();

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();

		String i_name = request.getParameter("i_name");
		int i_price = Integer.parseInt(request.getParameter("i_price"));
		String i_info = request.getParameter("i_info");
		int c_category = Integer.parseInt(request.getParameter("c_category"));
		int cs_category = Integer.parseInt(request.getParameter("cs_category"));
		String i_mainImg = request.getParameter("mainImg");
		String i_detailImg = request.getParameter("detailImg");

		i_mainImg = "front/images/" + i_mainImg.substring(i_mainImg.lastIndexOf("\\") + 1);
		i_detailImg = "front/images/" + i_detailImg.substring(i_detailImg.lastIndexOf("\\") + 1);

		itemDAO.insertItem(i_name, i_price, i_info, c_category, cs_category, i_mainImg, i_detailImg);

		forward.setRedirect(true);
		forward.setPath("./adminItemlist.do");
		return forward;
	}

}
