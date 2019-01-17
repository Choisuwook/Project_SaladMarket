package common.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;
import product.model.ProductDAO;


public abstract class AbstractController 
       implements Command {


	private boolean isRedirect = false;
	/*
    이것은 우리끼리의 약속이다.
   
    VIEW단 페이지(.jsp 페이지)로 이동시
    sendRedirect 방법으로 이동시키고자 한다라면
    isRedirect 변수의 값을 true 로 한다.
    (post)
    
    VIEW단 페이지(.jsp 페이지)로 이동시
    forward 방법으로 이동시키고자 한다라면
    isRedirect 변수의 값을 false 로 한다.
    (get) 
 */
	
	private String viewPage;
	// VIEW단 페이지(.jsp 페이지)의 경로명으로 사용되어지는 변수이다. 
	
	public boolean isRedirect() {
		return isRedirect;
	}// 리턴타입이 boolean 이라면 get 이 아니라 is 로 나타난다.
	
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public String getViewPage() {
		return viewPage;
	}
	
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	/*	로그인 유무를 검 사해서 로그인 했으면 로그인한 사용자의 정보를 return 해주고  로그인을 안했으면 null 을 return 해주는 메소드 */ 
	
	public MemberVO getLoginUser(HttpServletRequest req) {
		MemberVO loginUser = null;
		//세션에 저장된 값을 받아온다
		HttpSession session = req.getSession();
		loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			String msg = "먼저로그인하세요!";
			String loc = "javascript:history.back()";
			req.setAttribute("msg",msg);
			req.setAttribute("loc",loc);
			
			isRedirect = false;
			viewPage = "WEB-INF/msg.jsp";
			
		}
		return loginUser;
	}//end of MemberVO checkLoginUser()
	
/*	public void getCategoryList(HttpServletRequest req) throws SQLException {
		//jsp_category테이블에서
		//카테고리코드와 카테고리명을 가져와서 request 영역에 저장시킨다
		ProductDAO pdao = new ProductDAO();
		List<CategoryVO> categoryList = pdao.getCategoryList();
		req.setAttribute("categoryList", categoryList);
		
		//이 메소드를 호출하기만 하면 DB에있는 카테고리리스트를 불러올 수 있다.
	}*/
}
