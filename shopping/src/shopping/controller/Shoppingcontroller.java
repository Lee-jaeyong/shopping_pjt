package shopping.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.model.AddItem_Action;
import shopping.model.ItemList_Action;

@WebServlet("/Shoppingcontroller")
public class Shoppingcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Shoppingcontroller() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/") + 1;

		String command = requestURI.substring(cmdIdx);
		String front_path = "WEB-INF/front/";
		String back_end = "WEB-INF/backend/";

		Action action = null;
		ActionForward forward = new ActionForward();

		if (command.equals("index.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "index.jsp");
		} else if (command.equals("category.do")) {
			action = new ItemList_Action();
			forward = action.execute(request, response);
		} else if (command.equals("contact.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "contact.jsp");
		} else if (command.equals("single.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "single.jsp");
		} else if (command.equals("adminPage.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end + "index.jsp");
		} else if (command.equals("adminItemlist.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end + "itemlist.jsp");
		} else if (command.equals("adminAddItem.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end + "addItem.jsp");
		} else if (command.equals("addItem.do")) {
			action = new AddItem_Action();
			forward = action.execute(request, response);
		}

		if (forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}

	}
}
