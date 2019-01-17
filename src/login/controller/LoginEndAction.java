package login.controller;

import javax.servlet.http.*;
import common.controller.AbstractController;
import member.model.MemberDAO;
import member.model.MemberVO;

public class LoginEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String method = req.getMethod();
		if(!"POST".equalsIgnoreCase(method)) {//post방식으로 넘어온 것이 아니라면
			String msg = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
			
		 }else {
				//System.out.println("로그인 실패");
			 //post방식으로 넘어온 것이라면			
			String userid = req.getParameter("userid");
			String pwd = req.getParameter("pwd");		
			MemberDAO memberdao = new MemberDAO();
			MemberVO loginUser= memberdao.loginOKmemberInfo(userid, pwd);
			String saveid = req.getParameter("saveid");

			if(loginUser == null) {//로그인이 실패한 경우(아이디는 있는데 비밀번호가 틀린경우)
				String msg ="아이디 또는 비밀번호를 확인하세요.";
				String loc="javascript:history.back()";
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				return;
				
			}else if(loginUser.isLastlogingap()) {
				 String msg = "비밀번호를 변경하신지 12개월이 지났습니다. 암호를 변경하세요";
				 String loc="javascript:history.back();";
				 
				 req.setAttribute("msg", msg);
				 req.setAttribute("loc", loc);
			 	 super.setRedirect(false);
				 super.setViewPage("/WEB-INF/msg.jsp");
				 return;
			 }else {//로그인을 성공한 경우
				//로그인 되어진 사용자 정보(loginUser)를 세션에 저장 => 로그아웃 시 없어져야 하므로 세션에 담는다(어플리 케이션은 로그아웃되어도 담고 있기 때문에 세션으로 사용)
				
/*				 					== 세션(session) == 
				 세션은 WAS(톰캣서버)의 메모리(RAM)의 일부분을 사용하는 저장공간이다.
				 세션(session)에 저장된 데이터는 소멸하지 않는 이상 모든 파일(*.do, *.jsp)에서
				 사용할 수 있도록 접근이 가능하다. 
				 (application>session>request)
				 (foward해주는 특정 파일만 쓰는 것이 request)*/
				 
				HttpSession session =  req.getSession();//세션객체 생성
				session.setAttribute("loginUser",loginUser);//세샨에 로그인 되어진 사용자의 정보를 저장한다
				
				// ** 사용자가 로그인시 아이디저장 체크박스에 체크를 했을 경우와 체크를 해제 했을 경우 **
				//    체크박스에 체크를 했을 경우 ==> 쿠키에 저장
				//	    체크를 해제 했을 경우 ==> 쿠키 삭제 하도록 한다.
				// 			*** 쿠키(cookie)란? ***
				//	WAS 사용자가 아닌 클라이언트 사용자 컴퓨터의 디스크 공간을 저장공간으로 사용하는 기법을 말하며 
				//  쿠키(cookie)에 저장되는 정보는 보안성이 떨어지는 데이터(ex: 아이디) 이어야한다.
				
				Cookie cookie = new Cookie("saveid",loginUser.getUserid());
				
				if(saveid !=null) {//위의 34번 라인에서 받은 갑이 null 이 아닌"on" 이라면
					cookie.setMaxAge(7*24*60*60); // 쿠키의 생존기간을 7일(단위 초)로 설정한다. 이것이 쿠키 저장이다.
					// 쿠키 저장
					
				}else {//위의 34번 라인에서 받은 갑이 null 이라면
					cookie.setMaxAge(0); // 쿠키의 생존기간을 0초(단위 초)로 설정한다. 이것이 쿠키 삭제이다.
					//쿠키 삭제					
				}			
				cookie.setPath("/");
				
/*				   쿠키가 사용되어질 디렉토리 정보 설정.
				  cookie.setPath("사용되어질 경로"); 
				   만일 "사용되어질 경로" 가 "/" 일 경우
				   해당 도메인(예 iei.or.kr)의 모든 페이지에서 사용가능하다. */
				 
				
				res.addCookie(cookie);
				
/*				     사용자 컴퓨터의 웹브라우저로 쿠키를 전송시킨다.
				   7일간 사용가능한 쿠키를 전송하든지
				     아니면 0초 짜리 사용가능한 쿠키(쿠키삭제)를     
				     사용자 컴퓨터의 웹브라우저로 전송시킨다.  */  
				
				String returnPage = (String)session.getAttribute("returnPage");//cartAddAction.java에서 session에 저장된 returnPage(장바구니담기후 로그아웃전 현재페이지)
				 if(loginUser.isRequirePwdChange() == true){
					 String msg = "비밀번호를 변경하신지 6개월이 지났습니다. 암호를 변경하세요";
					 String loc="index.do";
					 
					 req.setAttribute("msg", msg);
					 req.setAttribute("loc", loc);
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/msg.jsp");
						return;
				 }
				 else if(returnPage == null) {
					 //장바구니를 거치지 않고 그냥 로그인을 시도한 경우.
						super.setRedirect(true);
						super.setViewPage("index.do");						 
				 }
				 else {
					//로그인을 하지 않은 상태에서 장바구니 담기 또는 바로주문하기 선택한 경우 ==> session에 returnPage가 null 이 아닌경우
						super.setRedirect(true);//url 변경
						super.setViewPage(returnPage);
						session.removeAttribute(returnPage);//getAttribute 해온 returnPage값을 없앤다.
				 }

			}// end of else 로그인을 성공한 경우
	}//end of else post방식으로 넘어온 것이라면

  }// end of excute
}

