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
		 
		
		//List<HashMap<String,Object>> eventProductList = dao.getEventList2(etname);
		
		//req.setAttribute("eventProductList", eventProductList);
		req.setAttribute("etname", etname);
/*  		
  		String str_pnum = req.getParameter("productPnum");
		int pnum = Integer.parseInt(str_pnum);*/
		
		//List<HashMap<String, Object>> productDetailList = pdao.getProductDetail(pnum);
		//req.setAttribute("productDetailList", productDetailList);
			
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/event/eventDetail.jsp");

	}

}
