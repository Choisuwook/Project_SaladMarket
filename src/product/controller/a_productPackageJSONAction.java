package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class a_productPackageJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();
		
		List<ProductVO> packList = pdao.adminProductPacList();
		JSONArray jsonarray = new JSONArray();
			
		if(packList != null && packList.size()>0) {
			for(ProductVO pvo : packList) {
				JSONObject jobj = new JSONObject();
				
				jobj.put("pacname", pvo.getPacname());
				jobj.put("pacnum",pvo.getPacnum());
				jobj.put("pacimage", pvo.getPacimage());
				jobj.put("paccontents", pvo.getPacimage());
				
				jsonarray.add(jobj);
				
			}			
			String str_jsonArray = jsonarray.toString();
			req.setAttribute("str_jsonArray", str_jsonArray);
		}
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/a_productPackageListJSON.jsp");

	}

}
