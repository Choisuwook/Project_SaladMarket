package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class PwdChangeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session =  req.getSession();
		
		String userid = (String)session.getAttribute("userid");

		System.out.println("PwdChangeAction userid : "+userid);
		
		req.setAttribute("userid", userid);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/login/pwdChange.jsp");

	}

}
