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

public class A_productJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		InterProductDAO pdao = new ProductDAO();
		List<ProductVO> productList = pdao.adminProductList();
		JSONArray jsonArray = new JSONArray();
		
		if(productList != null && productList.size() > 0) {
			for(ProductVO pvo : productList) {
				
				JSONObject jsonObj = new JSONObject();
				// JSONObject 는 JSON형태(키:값)의 데이터를 관리해주는 클래스이다. 				 
				jsonObj.put("pnum", pvo.getPnum());
				jsonObj.put("pname", pvo.getPname());
				jsonObj.put("pacname", pvo.getFk_pacname());
				jsonObj.put("stname", pvo.getFk_stname());
				jsonObj.put("sdname", pvo.getFk_sdname());
				jsonObj.put("etname", pvo.getFk_etname());
				jsonObj.put("ctname", pvo.getFk_ctname());
				jsonObj.put("price", pvo.getPrice());
				jsonObj.put("saleprice", pvo.getSaleprice());
				jsonObj.put("salecount", pvo.getSaleprice());
				jsonObj.put("pqty", pvo.getPqty());
				jsonObj.put("salecount", pvo.getSaleprice());
				jsonObj.put("allergy", pvo.getAllergy());
				jsonObj.put("weight", pvo.getWeight());
				jsonArray.add(jsonObj);
				
			}// end of for--------------------
		}

		String str_jsonArray = jsonArray.toString();
		req.setAttribute("str_jsonArray", str_jsonArray);

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/a_productListJSON.jsp");  

	}

}
