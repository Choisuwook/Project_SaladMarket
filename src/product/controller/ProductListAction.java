package product.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class ProductListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// ** 상품 리스트에서 상품 보여주기 **
		InterProductDAO pdao = new ProductDAO();
		String sdname = req.getParameter("sdname");
		req.setAttribute("sdname", sdname);
		
		List<ProductVO> packageList = pdao.getpackageList(sdname);
		req.setAttribute("packageList", packageList);
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/product/productListAjax.jsp");
	}

}
