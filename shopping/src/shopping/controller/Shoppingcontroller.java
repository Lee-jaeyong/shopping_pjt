package shopping.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.backend.model.AddItemPage_Action;
import shopping.backend.model.AddItem_Action;
import shopping.backend.model.ModifyItem_Action;
import shopping.backend.model.SelectItem_Action;
import shopping.model.Category_Action;
import shopping.model.DeleteShoppingCart_Action;
import shopping.model.LoginCheck_Action;
import shopping.model.RegisterCheck_Action;
import shopping.model.SelectItemAction;
import shopping.model.addShoppingCart_Action;

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
			forward = sessionCheck(request, false, front_path + "index.jsp");
		} else if (command.equals("category.do")) {
			action = new Category_Action();
			forward = action.execute(request, response);
		} else if (command.equals("contact.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "contact.jsp");
		} else if (command.equals("single.do")) {
			action = new SelectItemAction();
			forward = action.execute(request, response);
		}
		//장바구니 파트
		else if (command.equals("cart.do")) {
			forward = sessionCheck(request, false, front_path + "shoppingCart.jsp");
		} else if(command.equals("addCart.do")) {
			action = new addShoppingCart_Action();
			forward = action.execute(request, response);
		} else if(command.equals("delCart.do")) {
			action = new DeleteShoppingCart_Action();
			forward = action.execute(request, response);
		}
		// 로그인 파트
		else if (command.equals("login.do")) {
			if (request.getParameter("id") != null) {
				action = new LoginCheck_Action();
				forward = action.execute(request, response);
			} else {
				forward.setRedirect(false);
				forward.setPath(front_path + "page-login.jsp");
			}
		}
		// 회원가입 파트
		else if (command.equals("join.do")) {
			forward.setRedirect(false);
			forward.setPath(front_path + "page-register.html");
		} else if (command.equals("joinOk.do")) {
			action = new RegisterCheck_Action();
			forward = action.execute(request, response);
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

	private ActionForward sessionCheck(HttpServletRequest request, boolean redirect, String path) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		if (session.getAttribute("u_id") == null) {
			forward.setRedirect(true);
			forward.setPath("./login.do");
		} else {
			forward.setRedirect(redirect);
			forward.setPath(path);
		}
		return forward;
	}
}
