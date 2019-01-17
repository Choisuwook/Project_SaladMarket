package product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class A_ProductDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		InterProductDAO pdao = new ProductDAO();
		String pnum = req.getParameter("pnum");
		System.out.println("pnum: "+pnum);
		ProductVO pvoImg = pdao.adminProductDetailImg(Integer.parseInt(pnum));
		ProductVO pvo = pdao.adminProductList(Integer.parseInt(pnum));

		req.setAttribute("pvoImg", pvoImg);
		req.setAttribute("pvo", pvo);	
		req.setAttribute("pnum", pnum);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/a_productDetail.jsp");

	}

}
