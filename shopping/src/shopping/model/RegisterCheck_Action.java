package shopping.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.DAO.UserDAO;
import shopping.collection.StringFilter;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class RegisterCheck_Action implements Action {
	UserDAO dao = UserDAO.getInstance();

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();

		String inputId = request.getParameter("inputId");
		String inputPw = request.getParameter("inputPw");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		inputId = StringFilter.cleanXSS(inputId);
		inputPw = StringFilter.cleanXSS(inputPw);
		inputPw = StringFilter.MD5(inputPw);
		email = StringFilter.cleanXSS(email);
		name = StringFilter.cleanXSS(name);
		phone = StringFilter.cleanXSS(phone);
		birth = StringFilter.cleanXSS(birth);
		address = StringFilter.cleanXSS(address);

		String[] ph = phone.split("-");

		dao.joinDB(inputId, inputPw, email, name, ph[0], ph[1], ph[2], birth, address);
		
		forward.setRedirect(true);
		forward.setPath("./index.do");

		return forward;
	}

}
