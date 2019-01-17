package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class LogoutAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		session.removeAttribute("loginUser");
		//세션에 저장된 키값("loginUser") 삭제하는 것.
		
		super.setRedirect(true);
		super.setViewPage("index.do");
	}

}
