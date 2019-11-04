package shopping.backend.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.backend.DAO.ItemDAO;
import shopping.collection.FileCopy;
import shopping.collection.StringFilter;
import shopping.controller.Action;
import shopping.controller.ActionForward;

public class AddItem_Action implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemDAO itemDAO = ItemDAO.getInstance();

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();

		String i_name = StringFilter.cleanXSS(request.getParameter("i_name"));
		int i_price = Integer.parseInt(request.getParameter("i_price"));
		String i_info = StringFilter.cleanXSS(request.getParameter("i_info"));
		int c_category = Integer.parseInt(request.getParameter("c_category"));
		int cs_category = Integer.parseInt(request.getParameter("cs_category"));
		String i_mainImg = request.getParameter("mainImg");
		String i_detailImg = request.getParameter("detailImg");
		String[] itemSize = request.getParameter("itemSize").split(",");
		String[] itemColor = request.getParameter("itemColor").split(",");

		String main_path = "front/images/mainImg/";
		String detail_path = "front/images/detailImg/";

		String sub_i_mainImg = this.getClass().getResource("/").getPath()
				.replace("WEB-INF/classes/", "front\\images\\mainImg")
				.replace("eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/shopping",
						"git\\shopping_pjt\\shopping\\WebContent")
				.substring(1) + "\\" + i_mainImg.substring(i_mainImg.lastIndexOf("\\") + 1);

		String sub_i_detailImg = this.getClass().getResource("/").getPath()
				.replace("WEB-INF/classes/", "front\\images\\mainImg")
				.replace("eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/shopping",
						"git\\shopping_pjt\\shopping\\WebContent")
				.substring(1) + "\\" + i_detailImg.substring(i_detailImg.lastIndexOf("\\") + 1);
		FileCopy.fileCopy(i_mainImg, sub_i_mainImg);
		FileCopy.fileCopy(i_detailImg, sub_i_detailImg);
		i_mainImg = main_path + i_mainImg.substring(i_mainImg.lastIndexOf("\\") + 1);
		i_detailImg = detail_path + i_detailImg.substring(i_detailImg.lastIndexOf("\\") + 1);
		itemDAO.insertItem(i_name, i_price, i_info, c_category, cs_category, i_mainImg.replace(".jpg", ".jpeg"),
				i_detailImg.replace(".jpg", ".jpeg"));
		for (int i = 0; i < itemColor.length; i++) {
			int maxIdx = itemDAO.selectMaxIdx();
			for (int j = 0; j < itemSize.length; j++) {
				itemDAO.insertOption(maxIdx, itemColor[i], itemSize[j]);
				itemDAO.insertStock(maxIdx);
			}
		}
		forward.setRedirect(true);
		forward.setPath("./adminItemlist.do");
		return forward;
	}

}
