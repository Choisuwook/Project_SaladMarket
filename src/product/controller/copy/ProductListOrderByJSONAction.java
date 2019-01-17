package product.controller.copy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class ProductListOrderByJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
	InterProductDAO pdao = new ProductDAO();
	
	String order = req.getParameter("order");
	String sdname = req.getParameter("sdname");	
	
	List<ProductVO> packageList = pdao.getpackageList(sdname,order);
	JSONArray jsonArray = new JSONArray();
	if(packageList != null && packageList.size() > 0) {
		for(ProductVO pvo : packageList) {
		
			JSONObject jsonObj = new JSONObject();
			// JSONObject 는 JSON형태(키:값)의 데이터를 관리해주는 클래스이다. 			 
			jsonObj.put("stname", pvo.getFk_stname());				
			jsonObj.put("pacname", pvo.getPacname());
			jsonObj.put("pacimage", pvo.getPacimage());
			jsonObj.put("pname", pvo.getPname());
			jsonObj.put("sdname", pvo.getFk_sdname());
			jsonObj.put("saleprice", pvo.getSaleprice());
			jsonObj.put("price", pvo.getPrice());
			jsonObj.put("pacnum", pvo.getPacnum());
			jsonObj.put("pnum", pvo.getPnum());
			
			jsonArray.add(jsonObj);
			
		}// end of for--------------------
	}

		String str_jsonArray = jsonArray.toString();	
		req.setAttribute("str_jsonArray", str_jsonArray);
		req.setAttribute("sdname", sdname);
		//req.setAttribute("packageList", packageList);
		//req.setAttribute("totalProductCount", totalProductCount);

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/product/productListOrderJSON.jsp");
	}
}
