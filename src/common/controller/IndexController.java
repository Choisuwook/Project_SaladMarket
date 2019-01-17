package common.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.InterProductDAO;
import product.model.ProductDAO;

public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();		
		
		List<HashMap<String,String>> newProduct = pdao.getNewProductList();
		List<HashMap<String,String>> BestProduct = pdao.getBestProductList();
		req.setAttribute("newProduct", newProduct);
		req.setAttribute("BestProduct", BestProduct);	
		
        int totalBESTCount = pdao.totalPspecCount("BEST");
		req.setAttribute("totalBESTCount", totalBESTCount);
		int totalNEWCount = pdao.totalPspecCount("NEW");
		req.setAttribute("totalNEWCount", totalNEWCount);
			
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/index.jsp");

	}

}
