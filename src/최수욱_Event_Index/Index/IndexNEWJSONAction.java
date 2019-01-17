package common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class IndexNEWJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String start = req.getParameter("start"); 
		String len = req.getParameter("len"); // 8개씩 "더보기.." 클릭에 보여줄 상품의 갯수 단위크기   
		String stname = req.getParameter("stname");
		
		if(start==null || start.trim().isEmpty()) start = "1";
		if(len==null || len.trim().isEmpty()) len = "4";
		if(stname==null || stname.trim().isEmpty()) stname = "NEW";
		int startRno = Integer.parseInt(start);
		// 공식!!!  시작행번호      1           5              9
		
		int endRno = startRno+Integer.parseInt(len)-1;
		// 공식!!!   끝행번호       4(=> 1+4-1)  8(=> 8+4-1)   24(=> 17+8-1) 
		System.out.println("indexBestJSONAction");
		InterProductDAO pdao = new ProductDAO();
		List<ProductVO> productList = pdao.getProductsByStnameAppend(stname, startRno, endRno); 
		
		JSONArray jsonArray = new JSONArray();
		
		if(productList != null && productList.size() > 0) {
			for(ProductVO pvo : productList) {
				JSONObject jsonObj = new JSONObject();
				// JSONObject 는 JSON형태(키:값)의 데이터를 관리해주는 클래스이다. 
				jsonObj.put("rnum", pvo.getRnum());
				jsonObj.put("pacnum", pvo.getPacnum());
				jsonObj.put("pacname", pvo.getFk_pacname());				
				jsonObj.put("paccontents", pvo.getPaccontents());
				jsonObj.put("pacimage", pvo.getPacimage());
				jsonObj.put("ctname", pvo.getFk_ctname());
				jsonObj.put("sdname", pvo.getFk_sdname());
				jsonObj.put("price", pvo.getPrice());
				jsonObj.put("plike", pvo.getPlike());
				jsonObj.put("saleprice", pvo.getSaleprice());
				
				jsonArray.add(jsonObj);
				
			}// end of for--------------------
		}
		
		String str_jsonArray = jsonArray.toString();		
		req.setAttribute("str_jsonArray", str_jsonArray);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/indexNEWJSON.jsp");  
	}

}
