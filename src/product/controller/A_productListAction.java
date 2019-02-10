package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import my.util.MyUtil;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class A_productListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();
		
		String currentURL = MyUtil.getCurrentURL(req);
		String searchWord = req.getParameter("searchWord");
		String str_sizePerPage = req.getParameter("sizePerPage");

		if(str_sizePerPage == null) str_sizePerPage = "5";		
		int sizePerPage = 0;		
		try {
			 sizePerPage = Integer.parseInt(str_sizePerPage);
			 
			 if(sizePerPage != 3 && 
			    sizePerPage != 5 && 
			    sizePerPage != 10) {
				
				sizePerPage = 5;
			 }
			 
		} catch (NumberFormatException e) {
			 sizePerPage = 5;
		}

		int totalProductCount = 0;
		totalProductCount = pdao.getProductCount(searchWord); 
		
		int totalPage = (int)Math.ceil((double)totalProductCount/sizePerPage); 
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");
		int currentShowPageNo = 0;
		
		if(str_currentShowPageNo == null) { 
			currentShowPageNo = 1;
		}
		else {
			try {
				 currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				 
				 if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					 currentShowPageNo = 1;
				 }
			} catch (NumberFormatException e) {
				 currentShowPageNo = 1;
			}
		}
		
		List<ProductVO> productList= null;
		
		productList = pdao.adminProductList(sizePerPage, currentShowPageNo,searchWord);
		
		// **** ==== 페이지바 만들기 ==== **** //
		String url = "a_productList.do";
		int blockSize = 10;
		String pageBar = MyUtil.getSearchPageBar(url, currentShowPageNo, sizePerPage, totalPage,searchWord, blockSize);
		
		req.setAttribute("searchWord", searchWord);		
		req.setAttribute("sizePerPage", sizePerPage);
		req.setAttribute("currentShowPageNo", currentShowPageNo);
		req.setAttribute("totalMemberCount", totalProductCount);
		req.setAttribute("totalPage", totalPage);		
		req.setAttribute("pageBar", pageBar); 
		req.setAttribute("productList", productList);
		req.setAttribute("goBackURL", currentURL);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/a_productList.jsp");  

	}

}
