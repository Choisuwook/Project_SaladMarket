package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.MemberDAO;

public class IdFindAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String method = req.getMethod();
		// GET or POST
		req.setAttribute("method",method);
		System.out.println(method);
		super.setRedirect(false);// false를 해주어야 url 이 바뀌지 않는다
		super.setViewPage("/WEB-INF/store/login/idFind.jsp");
		
	}

}
