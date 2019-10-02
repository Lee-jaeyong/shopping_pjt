package shopping.backend.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.ItemDAO;
import shopping.backend.DTO.ItemDTO;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class SelectItem_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String back_end = "WEB-INF/backend/";
		ItemDAO itemDAO = ItemDAO.getInstance();
		ItemDTO item = itemDAO.selectItem(Integer.parseInt(request.getParameter("i_idx")));
		request.setAttribute("item", item);
		forward.setRedirect(false);
		forward.setPath(back_end + "modifyItem.jsp");
		return forward;
	}

}
