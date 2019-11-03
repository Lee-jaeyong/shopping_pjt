package shopping.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.DAO.ShoppingCartDAO;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class addShoppingCart_Action implements Action{
	ShoppingCartDAO dao = ShoppingCartDAO.getInstance();
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");   
		Calendar time = Calendar.getInstance();
		
		String format_time1 = format1.format(time.getTime());
		String user = request.getParameter("user");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		int count = Integer.parseInt(request.getParameter("count"));
		int i_idx = Integer.parseInt(request.getParameter("i_idx"));
		
		int result = dao.addCart(user, i_idx, size, color, count, format_time1);
		
		
		if(result == 1) {
			//성공
			forward.setRedirect(false);
			forward.setPath("./index.do");
		}
		
		
		
		return forward;
	}
	
}
