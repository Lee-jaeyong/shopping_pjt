package shopping.servlet;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.DAO.UserDAO;

/**
 * Servlet implementation class duplicationCheck
 */
@WebServlet("/duplicationCheck")
public class duplicationCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public duplicationCheck() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		UserDAO dao = UserDAO.getInstance();
		String result = "";
		
		String id = request.getParameter("dupId");
		
		String pattern = "^[a-z0-9]*$";
		boolean i = Pattern.matches(pattern, id);
		
		if(i==true && id.length() >= 5 && id.length() <= 20)
		{
			if(dao.dupCheck(id)) {
				result = "���� ���̵�׿�!";
			}else {
				result = "�̹� �����ϴ� ���̵��Դϴ�.";
			}
		}else {
			result = "5~20���� ���� �ҹ���, ���ڸ� ��� �����մϴ�.";
		}
		
		
		
		response.getWriter().write(result);
	}

}
