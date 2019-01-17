package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class ProductSearchAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		InterProductDAO dao = new ProductDAO();
		String search = req.getParameter("search");
		
		List<ProductVO> pvo = dao.searchList(search);
		System.out.println(search);
		req.setAttribute("pvo", pvo);
		req.setAttribute("search",search);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/product/productSearchList.jsp");

	}

}
