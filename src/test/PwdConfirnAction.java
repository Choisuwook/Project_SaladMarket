package test;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.controller.GoogleMail;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class PwdConfirnAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String userid = req.getParameter("userid");
		String userCertificationCode = req.getParameter("userCertificationCode");
		//유저가 입력한 값과 세션에 입력한 값을 비교해본다
		HttpSession session =  req.getSession();
		String certificationCode = (String)session.getAttribute("certificationCode");
		String msg ="";
		String loc ="";
		
		
		System.out.println(userCertificationCode +"//////" + certificationCode);
		
		if(certificationCode.equalsIgnoreCase(userCertificationCode)) {
				//사용자가 입력한 값과 인증코드가 동일하다면
				msg = "인증에 성공하였습니다";
				loc = "/WEB-INF/store/login/pwdChange.jsp";
				//인증에 성공하였을 경우 데이테베이스에 저장해 주어야 하는데 데이터 베이스에 넘길때 pwd 뿐만 아니라 userid도 넘겨야한다.
				//pwdConfirm.do 에 넘어갈때 POST 방식으로 넘어가며 userid 값이 필요하다.
			
		}else {
			msg = "발급된 인증코드를 입력하세요";
			
			loc = req.getContextPath()+"/pwdFind.do";
			//인증코드를 잘못 받았다면 다시 처음부터 해라 =>pwdFind.do
		}
		req.setAttribute("msg",msg);
		req.setAttribute("loc",loc);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/msg.jsp");

		
		session.removeAttribute("certificationCode");
		//sesseion 의 저장된어진 인증코드를 삭제한다
	}
}
