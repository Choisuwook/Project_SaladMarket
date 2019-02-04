package admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.AdminDAO;
import admin.model.InterAdminDAO;
import common.controller.AbstractController;

public class AdminLoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String method = req.getMethod();
		InterAdminDAO adao = new AdminDAO();
		String msg = "";
		String loc = "";
		System.out.println("ㅎㅎㅎ");
		if(!"POST".equals("method")) {
			msg = "비정상적인 경로입니다!";
			loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");	
		}
		else{
			String userid = req.getParameter("userid");
			String password = req.getParameter("password");
			boolean loginOk = adao.getLogin(userid,password);
			if(loginOk) {
				msg = "관리자 로그인 성공!";
				loc = "admin_index.do";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");					
			}else {
				msg = "관리자 로그인 실패!!";
				loc = "javascript:history.back();";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}			
		}		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/admin_index.jsp");

	}

}

