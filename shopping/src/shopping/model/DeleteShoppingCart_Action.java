package shopping.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.DAO.ShoppingCartDAO;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class DeleteShoppingCart_Action implements Action{
	ShoppingCartDAO dao = ShoppingCartDAO.getInstance();
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		int ct_idx = Integer.parseInt(request.getParameter("ct_idx"));
		
		dao.deleteCart(ct_idx);
		
		forward.setRedirect(false);
		forward.setPath("./cart.do");
		return forward;
	}

}
