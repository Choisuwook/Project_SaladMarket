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
		InterProductDAO pdao = new ProductDAO();
		
		String str_pacnum = req.getParameter("pacnum");
		String str_pnum = req.getParameter("pnum");
		int pacnum = Integer.parseInt(str_pacnum);
		int pnum = Integer.parseInt(str_pnum);
		String pacname = req.getParameter("pacname");

		if(pacnum==1) {
			// 패키지  없는 상품 상세 
			ProductVO  packageDetail = pdao.getProductNoPackageDetail(Integer.parseInt(str_pacnum) ,Integer.parseInt(str_pnum)); 
			req.setAttribute("packageDetail", packageDetail);
		}else {
			// 패키지가 있는 상품 상세 가져오기 (옵션명)
			List<ProductVO> packageDetailList = pdao.getProductDetail(pacname);
			ProductVO packageDetail = pdao.getPackageOne(pacnum);
			// 대표정보 가져오기

			req.setAttribute("packageDetail", packageDetail);
			req.setAttribute("packageDetailList", packageDetailList);
		}
		
		req.setAttribute("pacnum", str_pacnum);
		req.setAttribute("pnum", str_pnum);
		req.setAttribute("pacname", pacname);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/product/ProductDetail.jsp");
		// === 불러온 상품 패키지에 대한 상품 상세정보 불러오기(상품 상세 이미지, 상품 상세 이름)


	}

}