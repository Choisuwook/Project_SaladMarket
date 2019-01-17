package test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class LoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/login/login.jsp");

	}

}
