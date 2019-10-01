package shopping.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.DAO.ShoppingDAO;
import shopping.DTO.Sh_itemDTO;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class ItemList_Action implements Action{
	
	ShoppingDAO dao = ShoppingDAO.getInstance();
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		int pageNum = 0;
		int showNum = Integer.parseInt(request.getParameter("showNum"));
		System.out.println(showNum);
		
		if(request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		ArrayList<Sh_itemDTO> list = dao.get_itemList(pageNum,12);
	
		int totalItem = dao.getTotalItem();
		int totalPage = (int)Math.ceil(totalItem / 12.0);
		
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("pageNum", pageNum);
		
		forward.setRedirect(false);
		forward.setPath("WEB-INF/front/categories.jsp");
		return forward;
	}

}
