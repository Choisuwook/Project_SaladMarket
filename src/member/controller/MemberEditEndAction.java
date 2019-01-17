package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MemberEditEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// *** POST 방식으로 넘어온 것이 아니라면 *** //
		String method = req.getMethod();
		System.out.println("MemberEditEndAction Method : "+method);
		
		if(!"POST".equalsIgnoreCase(method)) {
			String msg = "비정상적인 경로로 들어왔습니다.";
		    String loc = "javascript:history.back();";
		    
		    req.setAttribute("msg", msg);
		    req.setAttribute("loc", loc);
		    
		    super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		    return;
		}
		
		
		// *** 로그인 유무 검사 *** //
		MemberVO loginUser = super.getLoginUser(req);
		System.out.println("MemberEditEndAction loginUSer : "+loginUser);
		if(loginUser == null) 
			return;
		
		else {
			
			String userid = req.getParameter("userid");
			String name = req.getParameter("name");
			String pwd = req.getParameter("pwd");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String postnum = req.getParameter("postnum");
			String address1 = req.getParameter("address1");
			String address2 = req.getParameter("address2"); 
			System.out.println(address1);
					
			MemberVO membervo = new MemberVO();

			membervo.setName(name);
			membervo.setUserid(userid);
			membervo.setPwd(pwd);
			membervo.setEmail(email);
			membervo.setPhone(phone);
			membervo.setPostnum(postnum);
			membervo.setAddress1(address1);
			membervo.setAddress2(address2);
			
			InterMemberDAO memberdao = new MemberDAO();
			
			int n = memberdao.updateMember(membervo); 
			System.out.println("MemberEditEndAction int n : "+n);
			String msg = "";
			String loc = "";
			System.out.println("22");
			if(n==1) {
				// 로그인한 회원이 나의정보를 클릭해서 자신의 회원정보를 수정한 이후에
				// 로그인 되어진 이름이 바로 변경되어지도록
				// 세션에 저장된 loginuser 의 정보값을 수정한 membervo 로 변경시킨다.
				loginUser.setName(name);
				
				HttpSession session = req.getSession();
				session.removeAttribute("loginUser");// 기존의 세션값 지우기.
				session.setAttribute("loginUser",loginUser);
				
				membervo.setMnum(loginUser.getMnum());
				membervo.setUserid(loginUser.getUserid());
				membervo.setName(name);
				membervo.setSummoney(loginUser.getSummoney());
				membervo.setPoint(loginUser.getPoint());
				membervo.setFk_lvnum(loginUser.getFk_lvnum());
				membervo.setAddress2(loginUser.getAddress1());
				session.setAttribute("loginUser", membervo);
				
				msg = "회원정보 수정 성공!!";
				loc = "index.do";
			}
			else {
				msg = "회원정보 수정 실패!!";
				loc = "javascript:history.back();";
			}
			
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
					
			this.setRedirect(false);
			this.setViewPage("/WEB-INF/msg.jsp");
		
		}// end of if~else--------------------------------------
	
	}// end of void execute(HttpServletRequest req, HttpServletResponse res)----------------

}
