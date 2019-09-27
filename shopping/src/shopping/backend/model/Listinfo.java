package shopping.backend.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.ItemDAO;
import shopping.backend.DTO.ItemDTO;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class Listinfo implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemDAO itemDAO = ItemDAO.getInstance();
		String backend_path = "WEB-INF/backend/";

		ActionForward forward = new ActionForward();

		ArrayList<ItemDTO> list = itemDAO.getlist(0);
		int totalList = itemDAO.getTotallist("", "");
		
		request.setAttribute("list", list);
		request.setAttribute("totalList", totalList);
		
		forward.setRedirect(false);
		forward.setPath(backend_path + "itemlist.jsp");
		return forward;
	}
}
