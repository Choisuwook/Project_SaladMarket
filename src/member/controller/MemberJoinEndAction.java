package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MemberJoinEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberVO membervo = new MemberVO();
		InterMemberDAO memberdao = new MemberDAO();
		if("POST".equalsIgnoreCase(req.getMethod())) {
			membervo.setUserid(req.getParameter("userid"));
			membervo.setName(req.getParameter("name"));
			membervo.setPwd(req.getParameter("pwd"));
			membervo.setEmail(req.getParameter("email"));
			membervo.setPhone(req.getParameter("phone"));
			membervo.setBirthyyyy(req.getParameter("birthyyyy"));
			membervo.setBirthmm(req.getParameter("birthmm"));
			membervo.setBirthdd(req.getParameter("birthdd"));
			membervo.setPostnum(req.getParameter("postnum"));
			membervo.setAddress1(req.getParameter("addr1"));
			membervo.setAddress2(req.getParameter("addr2"));
		

			int n = memberdao.registerMember(membervo); 

		    if(n == 1) {
		    	
		    	req.setAttribute("loc", "index.do");
		    	req.setAttribute("msg", "회원가입 성공!");
		    	setRedirect(false);
		    	setViewPage("/WEB-INF/msg.jsp");
		    	 }
		    else {
		    	
		    	req.setAttribute("loc", "javascript:history.back();");
		    	req.setAttribute("msg", "회원가입 실패!");
		    	setRedirect(false);
		    	setViewPage("/WEB-INF/msg.jsp");
		    }
		}
		
		else {
			req.setAttribute("loc", "javascript:history.back();");
	    	req.setAttribute("msg", "잘못된 경로로 들어왔습니다.");
	    	setRedirect(false);
	    	setViewPage("/WEB-INF/msg.jsp");
		}
		
	}
}
