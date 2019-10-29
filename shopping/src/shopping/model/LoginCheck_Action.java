package shopping.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.DAO.UserDAO;
import shopping.collection.StringFilter;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class LoginCheck_Action implements Action {
	UserDAO dao = UserDAO.getInstance();

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		id = StringFilter.cleanXSS(id);
		pw = StringFilter.cleanXSS(pw);
		pw = StringFilter.MD5(pw);

		int result = dao.loginCheck(id, pw);

		if (result > 0) {
			forward.setRedirect(true);
			forward.setPath("./index.do");
		} else {
			forward.setRedirect(false);
			forward.setPath("WEB-INF/front/page-login.jsp");
		}
		return forward;
	}

}
