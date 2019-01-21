package product.controller.copy;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import my.util.MyUtil;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class ProductListJSONAcion extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String stname = req.getParameter("stname");
		String sdname = req.getParameter("sdname");
		String pacname = req.getParameter("fk_pacname");

		InterProductDAO dao = new ProductDAO();


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		// ** 페이징 처리 하기 이전의 데이터조회 결과물 가져오기*	

			int sizePerPage = 10; 
			int totalProductCount = dao.getTotalCount(sdname);
			System.out.println("totalProductCount : "+totalProductCount);

			int totalPage = (int)((double)totalProductCount/sizePerPage);
			int currentShowPageNo = 0;//사용자가 보고자하는 페이지 번호
			String str_currentShowPageNo= MyUtil.getCurrentURL(req);
			System.out.println(str_currentShowPageNo);
			if(str_currentShowPageNo== null) { //초기화면
				//초기화면은 현재페이지 번호로 1페이지로 설정한다.
				currentShowPageNo =1;
			}else {//사용자가 보고자 하는 페이지 번호를 설정한 경우
				try {
					currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
					if(currentShowPageNo <1 && currentShowPageNo > totalPage) {						
					}
				} catch (NumberFormatException e) {
					currentShowPageNo =1;					
				}
			}
			System.out.println("totalPage");
			System.out.println("currentShowPageNo");
		////////////////////////////////////////////////////////////////////////////////////

			if(stname==null || stname.trim().isEmpty()) {
			stname = "BEST";
			}	
			InterProductDAO pdao = new ProductDAO();
			List<ProductVO> productList = pdao.getProductsByPspecAppend(stname,sdname); 
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

			String str_jsonArray = jsonArray.toString();
			req.setAttribute("str_jsonArray", str_jsonArray);

		///////////////////////////////////////////////////////////////////////////////


		//get 방식으로 넘어오는 경우이므로 사용자가 장난치는 경우를 대비함.

	//	memoList = memodao.getAllMemo(sizePerPage, currentShowPageNo);

		String url ="productList.do";
		int blockSize=10;

		String pageBar = MyUtil.getSearchPageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize, currentShowPageNo);

		req.setAttribute("totalProductCount", totalProductCount);
		req.setAttribute("totalPage",totalPage);
		req.setAttribute("currentShowPageNo",currentShowPageNo);
		req.setAttribute("sizePerPage", sizePerPage);
		req.setAttribute("pageBar", pageBar); 
		//////////////////////////////////////////////////////////////////////		
		req.setAttribute("stname", stname);
		req.setAttribute("sdname", sdname);
		req.setAttribute("pacname", pacname);

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/product/productListJSON.jsp"); 
		/////////////////////////////////////////////////////////////


	}//end of 


		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



	}