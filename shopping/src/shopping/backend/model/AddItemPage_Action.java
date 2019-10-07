package shopping.backend.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.CategoryDAO;
import shopping.backend.DTO.CategoryDTO;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class AddItemPage_Action implements Action {
	String back_end_item = "WEB-INF/backend/item/";

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CategoryDAO categoryDAO = CategoryDAO.getInstance();
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(back_end_item + "addItem.jsp");
		ArrayList<CategoryDTO> list = categoryDAO.getCategoryList();
		request.setAttribute("list", list);
		return forward;
	}

}
