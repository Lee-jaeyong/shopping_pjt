package shopping.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.DAO.ShoppingDAO;
import shopping.DTO.Sh_itemDTO;

@WebServlet("/ShowSortServlet")
public class ShowSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ShowSortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int showNum = Integer.parseInt(request.getParameter("showNum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		ShoppingDAO dao = ShoppingDAO.getInstance();
		
		ArrayList<Sh_itemDTO> list = dao.get_itemList(pageNum,showNum);
		
		int totalItem = dao.getTotalItem();
		int totalPage = (int)Math.ceil(totalItem / showNum);
		
		StringBuilder resultStr = new StringBuilder();
		
		resultStr.append("{\"result\" : [");
		for(int i =0;i<list.size();i++) {
			resultStr.append("{\"i_name\" : \""+list.get(i).getI_name()+"\", \"i_price\" : \""+list.get(i).getI_price()+"\",\"i_mainImg\" : \""+list.get(i).getMainImg()+"\"}");
			if(i != (list.size() - 1)) {
				resultStr.append(",");
			}
		}
		resultStr.append("], \"totalPage\" : \""+totalPage+"\", \"pageNum\" : \""+pageNum+"\", \"showNum\" : \""+showNum+"\"}");
		
		//response.getWriter().write(resultStr.toString());
		request.setAttribute("result", resultStr);
		
	}

}
