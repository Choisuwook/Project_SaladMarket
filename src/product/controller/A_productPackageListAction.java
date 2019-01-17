package product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class A_productPackageListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/a_productPackageList.jsp");
	}

}
