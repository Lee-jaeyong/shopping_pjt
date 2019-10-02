package shopping.backend.ajax.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.UserDAO;
import shopping.backend.DTO.UserDTO;

@WebServlet("/GetUserListServlet")
public class GetUserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetUserListServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		UserDAO userDAO = UserDAO.getInstance();

		ArrayList<UserDTO> list = userDAO.SelectUserList("", 0, 0);
		StringBuilder json = new StringBuilder();

		json.append("{\"result\":[");

		for (int i = 0; i < list.size(); i++) {
			json.append("{\"u_id\":\"" + list.get(i).getU_id() + "\",\"u_phone\":\"" + list.get(i).getU_phoneNumber()
					+ "\",\"u_name\":\"" + list.get(i).getU_name() + "\",\"u_birth\":\"" + list.get(i).getU_birth()
					+ "\",\"u_address\":\"" + list.get(i).getU_address() + "\",\"u_date\":\"" + list.get(i).getU_date()
					+ "\"}");
			if (i != list.size() - 1)
				json.append(",");
		}
		json.append("]}");
		response.getWriter().write(json.toString());
	}

}
