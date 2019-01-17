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

public class ProductListJSONAcion extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String stname = req.getParameter("stname");
		String sdname = req.getParameter("sdname");
		String pacname = req.getParameter("fk_pacname");
		if(stname==null || stname.trim().isEmpty()) {
			stname = "BEST";
		}	
		InterProductDAO pdao = new ProductDAO();
		List<ProductVO> productList = pdao.getProductsByPspecAppend(stname,sdname); 
		System.out.println("DAO");
		JSONArray jsonArray = new JSONArray();
		
		if(productList != null && productList.size() > 0) {
			for(ProductVO pvo : productList) {
				
				JSONObject jsonObj = new JSONObject();
				// JSONObject 는 JSON형태(키:값)의 데이터를 관리해주는 클래스이다. 

				 
				jsonObj.put("rnum", pvo.getRnum());
				jsonObj.put("pacnum", pvo.getPname());				
				jsonObj.put("pacname", pvo.getPacname());
				jsonObj.put("pacimage", pvo.getPacimage());
				jsonObj.put("price", pvo.getPrice());
				jsonObj.put("saleprice", pvo.getSaleprice());
				jsonObj.put("plike", pvo.getPlike());
				jsonObj.put("salecount", pvo.getSaleprice());
				jsonObj.put("v_stname", pvo.getFk_stname());
				
				jsonArray.add(jsonObj);
				
			}// end of for--------------------
		}
		req.setAttribute("stname", stname);
		req.setAttribute("sdname", sdname);
		req.setAttribute("pacname", pacname);
		String str_jsonArray = jsonArray.toString();
		req.setAttribute("str_jsonArray", str_jsonArray);
		System.out.println(pacname);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/product/productListJSON.jsp");  
		
		
	}

}
