package event.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.controller.AbstractController;
import event.model.*;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class EventDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterEventDAO dao = new EventDAO();
		
		InterProductDAO pdao = new ProductDAO();
		
		String etnum = req.getParameter("etnum");
		String etname = req.getParameter("etname");

		List<HashMap<String,Object>> productList = dao.getProImgPnameFile(etname);
		//더보기버튼 totalCount 가져오는 메소드
		int totalEventCount = dao.getEventTotalCount(etname);
	
		req.setAttribute("etname", etname);
		req.setAttribute("productList", productList);
		req.setAttribute("totalEventCount", totalEventCount);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/event/eventDetail.jsp");

	}

}
