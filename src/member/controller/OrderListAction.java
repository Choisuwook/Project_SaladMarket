package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberDAO;
import member.model.MemberVO;

public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// *** 로그인 유무 검사 *** //
		MemberVO loginUser = super.getLoginUser(req);	
		HttpSession session = req.getSession(); 
		// 로그인을 하지 않은 상태에서는 사용자의 정보변경을 할 수 없도록 해야 한다.	
		if(loginUser == null) {
				String msg = "로그인을 하세요!";
				
				String loc = "login.do";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc)
				;
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				return; 
		}else {				 	
			String userid = req.getParameter("userid");
			
			System.out.println("MemberInfomain  userid : "+userid);
		
			// 로그인을 했지만 다른 사용자의 정보는 변경이 불가하도록 해야 한다.
			if( !String.valueOf(loginUser.getUserid()).equals(userid)) {
				String msg = "비정상적인 경로로 들어왔습니다.";
		 		String loc = "index.do";
		 		
		 		req.setAttribute("msg", msg);
		 		req.setAttribute("loc", loc);
		 		
		 		super.setRedirect(false);
		 		super.setViewPage("/WEB-INF/msg.jsp");
		 		
		 		return;
			}else if(String.valueOf(loginUser.getUserid()).equals(userid)) {
		 		MemberDAO memberDao = new MemberDAO();
		 		MemberVO membervo = memberDao.getMemberOneByMnum(userid);
		 		
		 		req.setAttribute("userid", userid);
		 		req.setAttribute("membervo", membervo);
		 		
		 		
		 		
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/store/mypage/orderList.jsp");	 	
				
				}
		}
		

	}
}
