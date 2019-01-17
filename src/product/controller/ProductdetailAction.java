package product.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import event.model.EventDAO;
import event.model.InterEventDAO;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class ProductdetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterEventDAO edao = new EventDAO();
<<<<<<< HEAD
		InterProductDAO pdao = new ProductDAO();
		String str_pacnum = req.getParameter("pacnum");
		String str_pnum = req.getParameter("pnum");
		String pacname = req.getParameter("pacname");
		
		ProductVO  packageDetail = null;
		int pacnum = Integer.parseInt(str_pacnum);
		int pnum = Integer.parseInt(str_pnum);
	
		// ===전반적인 상품 패키지 정보 불러오기 ===
		// 상품 패키지에 대한 정보
		ProductVO indexProdcut = pdao.getIndexProductDetail(pacnum);

		// === 불러온 상품 패키지에 대한 상품 상세 정보 불러오기 ===
		List<ProductVO> productDetailList = pdao.getProductDateilList(pacnum);
		

		if(pacnum==1) {
			// 패키지  없는 상품 상세 
			packageDetail = pdao.getProductNoPackageDetail(pacname); 
	/*		ProductVO nopackage = pdao.noPackageProduct(pnum);
			req.setAttribute("nopackage", nopackage);*/
			req.setAttribute("packageDetail", packageDetail);
		}else {	// 패키지가 있는 상품 상세 가져오기
			packageDetail = pdao.getProductDetail(pacname);
			req.setAttribute("packageDetail", packageDetail);
		}

		req.setAttribute("productDetailList", productDetailList);
		req.setAttribute("indexProdcut", indexProdcut);
=======
		
		InterProductDAO pdao = new ProductDAO();
		String str_pacnum = req.getParameter("pacnum");
		String str_pnum = req.getParameter("pnum");
		
		int pacnum = Integer.parseInt(str_pacnum);
		int pnum = Integer.parseInt(str_pnum);
	
		// ===전반적인 상품 패키지 정보 불러오기 ===
		// 상품 패키지에 대한 정보
		ProductVO indexProdcut = pdao.getIndexProductDetail(pacnum);

		// === 불러온 상품 패키지에 대한 상품 상세 정보 불러오기 ===
		List<ProductVO> productDetailList = pdao.getProductDateilList(pacnum);
		
		req.setAttribute("productDetailList", productDetailList);
		req.setAttribute("indexProdcut", indexProdcut);
		
		// 패키지 없는 상품
		ProductVO nopackage = pdao.noPackageProduct(pnum);
		req.setAttribute("nopackage", nopackage);
		
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/product/ProductDetail.jsp");
		// === 불러온 상품 패키지에 대한 상품 상세정보 불러오기(상품 상세 이미지, 상품 상세 이름)
		

	}

}
