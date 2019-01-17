package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MemberInfoPwCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String method = req.getMethod();
		String msg = "";
		String loc= "";
		InterMemberDAO mdao = new MemberDAO();
		System.out.println("MemberInfoPwCheckAction method :"+method);
		if(!"POST".equals(method)) {			
			msg = "비정상적인 경로로 들어왔습니다!!";
			loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}else { //1			
			String password = req.getParameter("password");
			String userid = req.getParameter("userid");
			boolean passwdCheck = mdao.checkPasswd(userid,password);		

			if(!passwdCheck) {
				System.out.println("MemberInfoPwCheckAction3");
				msg = "비밀번호가 틀렸습니다.!";
				loc = "javascript:history.back()";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");	
				return;
			}
			else { //2
				
				MemberVO membervo = mdao.getMemberOneByMnum(userid);
				System.out.println("MemberinfoPwCheckAction userid"+userid);
				System.out.println("MemberinfoPwCheckAction password"+password);
				req.setAttribute("userid", userid);
				req.setAttribute("password", password);
				req.setAttribute("membervo", membervo);
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/store/mypage/memberModify.jsp");	
			}//end of else 2
		}// end of else 1
		
	}// end of excute

}
