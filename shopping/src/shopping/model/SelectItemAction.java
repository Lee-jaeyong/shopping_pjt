package shopping.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.DAO.ShoppingDAO;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class SelectItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ShoppingDAO dao = ShoppingDAO.getInstance();
		request.setAttribute("item", dao.selectItem((Integer.parseInt(request.getParameter("i_idx")))));
		request.setAttribute("colorAndSize", dao.getSizeAndColor((Integer.parseInt(request.getParameter("i_idx")))));
		forward.setPath("WEB-INF/front/single.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
