package shopping.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.model.AddItemPage_Action;
import shopping.backend.model.AddItem_Action;
import shopping.backend.model.ModifyItem_Action;
import shopping.backend.model.SelectItem_Action;
import shopping.model.Category_Action;
import shopping.model.RegisterCheck_Action;

@WebServlet("/Shoppingcontroller")
public class Shoppingcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Shoppingcontroller() {
		super();

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
		String back_end_item = "WEB-INF/backend/item/";
		String back_end_user = "WEB-INF/backend/user/";
		String back_end_category = "WEB-INF/backend/category/";
		String back_end_orders = "WEB-INF/backend/order/";
		
		Action action = null;
		ActionForward forward = new ActionForward();

		if (command.equals("index.do")) {
			action = new RegisterCheck_Action();
			forward = action.execute(request, response);
		} else if (command.equals("category.do")) {
			action = new Category_Action();
			forward = action.execute(request, response);
		} else if (command.equals("contact.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "contact.jsp");
		} else if (command.equals("single.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "single.jsp");
		} else if (command.equals("login.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "page-login.html");
		} else if (command.equals("join.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "page-register.html");
		}
		// backend
		// adminIndex
		else if (command.equals("adminPage.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end + "index.jsp");
		}
		// itemList
		else if (command.equals("adminItemlist.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end_item + "itemlist.jsp");
		} else if (command.equals("adminAddItem.do")) {
			action = new AddItemPage_Action();
			forward = action.execute(request, response);
		} else if (command.equals("addItem.do")) {
			action = new AddItem_Action();
			forward = action.execute(request, response);
		} else if (command.equals("addAllItem.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end_item + "alladditem.jsp");
		} else if (command.equals("modifyItem.do")) {
			action = new SelectItem_Action();
			forward = action.execute(request, response);
		} else if (command.equals("modifyItemExecute.do")) {
			action = new ModifyItem_Action();
			forward = action.execute(request, response);
		}
		// userList
		else if (command.equals("adminUserList.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end_user + "userlist.jsp");
		}
		// categoryList
		else if (command.equals("adminCategoryList.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end_category + "categoryList.jsp");
		} else if (command.equals("adminAddCategory.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end_category + "addCategory.jsp");
		}
		// orderList
		else if (command.equals("adminOrderList.do")) {
			forward.setRedirect(false);
			forward.setPath(back_end_orders + "orders.jsp");
		}

		if (forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}

	}
}
