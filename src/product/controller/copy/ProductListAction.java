package product.controller.copy;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import my.util.MyUtil;
import product.model.*;

public class ProductListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// ** 상품 리스트에서 상품 보여주기 **

		String sdname = req.getParameter("sdname");

		req.setAttribute("sdname", sdname);		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/product/productList.jsp");
	}

}
