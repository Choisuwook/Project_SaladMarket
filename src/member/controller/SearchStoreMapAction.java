package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class SearchStoreMapAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
			InterProductDAO pdao = new ProductDAO();
			List<StoremapVO> storemap = pdao.getStoreMap();
			req.setAttribute("storemapList", storemap);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/myshop/storeGoogleMap.jsp");
			
	}

}
