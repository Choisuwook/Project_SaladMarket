package event.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import event.model.EventDAO;
import event.model.InterEventDAO;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class EventDetailJSONAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String start = req.getParameter("start"); 
		String len = req.getParameter("len"); // 8개씩 "더보기.." 클릭에 보여줄 상품의 갯수 단위크기   
		String etname = req.getParameter("etname");
		
	
		
		if(start==null || start.trim().isEmpty()) start = "1";
		if(len==null || len.trim().isEmpty()) len = "4";
		if(etname==null || etname.trim().isEmpty()) etname = "크리스마스 이벤트";
		int startRno = Integer.parseInt(start);
		// 공식!!!  시작행번호      1           5              9
		
		int endRno = startRno+Integer.parseInt(len)-1;
		// 공식!!!   끝행번호       4(=> 1+4-1)  8(=> 8+4-1)   24(=> 17+8-1) 

		InterEventDAO dao = new EventDAO();
		
		InterProductDAO pdao = new ProductDAO();
		
		String etnum = req.getParameter("etnum");
		
		List<HashMap<String,Object>> eventProductList = dao.getEventList2(etname, startRno, endRno);
		
		JSONArray jsonArray = new JSONArray();
		
		if(eventProductList != null && eventProductList.size() > 0) {
			for(HashMap<String, Object> evo : eventProductList) {
				System.out.println("indexBestJSONAction2");		
				JSONObject jsonObj = new JSONObject();
				// JSONObject 는 JSON형태(키:값)의 데이터를 관리해주는 클래스이다. 
				jsonObj.put("stname", evo.get("stname"));
				jsonObj.put("saleprice", evo.get("saleprice"));
				jsonObj.put("pacname", evo.get("pacname"));				
				jsonObj.put("pacimage", evo.get("pacimage"));	
				jsonObj.put("etname", evo.get("etname"));
				
				jsonArray.add(jsonObj);
				
			}// end of for--------------------
		}
		
		String str_jsonArray = jsonArray.toString();		
		req.setAttribute("str_jsonArray", str_jsonArray);

		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/event/eventDetailJSON.jsp");  
	}

}
