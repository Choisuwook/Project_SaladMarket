package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class CartCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String pacname = req.getParameter("pacname");
		
		req.setAttribute("pacname", pacname);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/order/cartCheck.jsp");

	}

}
