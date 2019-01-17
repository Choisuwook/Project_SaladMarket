package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class PwdChangeEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterMemberDAO mdao = new MemberDAO();
		String userid = req.getParameter("userid");
		System.out.println("PwdChangeEndAction userid:"+userid);
		
		String password = req.getParameter("password");
		System.out.println("PwdChangeEndAction userid:"+password);
		int n = mdao.updatePwdUser(userid, password);
		String msg="";
		String loc="";
		
		System.out.println(userid);
		
		if(n ==1) {
			msg="비밀번호 변경 성공!";
			loc= "index.do";
			System.out.println(loc);
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		else {
			msg="비밀번호 변경 실패!";
			loc="pwdChange.do";
			req.setAttribute("userid", userid);
			req.setAttribute("password", password);
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}

	}

}
