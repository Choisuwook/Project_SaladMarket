package product.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class A_ProductRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterProductDAO dao = new ProductDAO();
		
		//상품패키지
		List<ProductVO> packageName = dao.getPackageName();
	
		//소분류상세
		List<ProductVO> subclassTag = dao.sdnameList();
				
		//카테고리테그
		List<ProductVO> categoryTag = dao.ctnameList();
		//스펙테그
		List<ProductVO> specTag = dao.stnameList(); 
		//이벤트테그
		List<ProductVO> eventTag = dao.etnameList();
		req.setAttribute("packageName", packageName);
		req.setAttribute("subclassTag", subclassTag);
		req.setAttribute("categoryTag", categoryTag);
		req.setAttribute("specTag", specTag);
		req.setAttribute("eventTag", eventTag);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/a_productRegister.jsp");
	}

}
