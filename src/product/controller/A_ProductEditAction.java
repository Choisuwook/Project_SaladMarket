package product.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class A_ProductEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pnum = req.getParameter("pnum");
		
		InterProductDAO pdao = new ProductDAO();
		List<ProductVO> packageName = pdao.getPackageName();
		// *** 이벤트 태그(etname) 목록 불러오기 ***
		List<ProductVO> etnameList = pdao.etnameList(); 
		// *** 스펙 태그(stname) 목록 불러오기 ***
		List<ProductVO> stnameList = pdao.stnameList();				
		// *** 소분류 상세(sdname) 목록 불러오기 ***
		List<ProductVO> sdnameList = pdao.sdnameList();
		// *** 카테고리 태그(ctname) 목록 불러오기 ***
		List<ProductVO> ctnameList = pdao.ctnameList();
		
		req.setAttribute("packageName", packageName);
		req.setAttribute("etnameList", etnameList);
		req.setAttribute("stnameList", stnameList);
		req.setAttribute("sdnameList", sdnameList);
		req.setAttribute("ctnameList", ctnameList);

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/a_productEdit.jsp");

	}

}