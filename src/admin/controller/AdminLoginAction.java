package admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.AdminDAO;
import admin.model.InterAdminDAO;
import common.controller.AbstractController;

public class AdminLoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
<<<<<<< HEAD

		String method = req.getMethod();
		InterAdminDAO adao = new AdminDAO();
		String msg = "";
		String loc = "";
		String adminid = req.getParameter("userid");
		String adminPwd = req.getParameter("password");

		/*if(!"POST".equals("method")) {
			msg = "비정상적인 경로입니다!";
			loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");	
		}else{*/

			String userid = req.getParameter("userid");
			String password = req.getParameter("password");
						
			boolean loginOk = adao.getLogin(userid,password);
			System.out.println(loginOk);
			if(loginOk) {
				msg = "관리자 로그인 성공!";
				loc = "admin_index.do";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");	
				return;
			}else {
				msg = "관리자 로그인 실패!!";
				loc = "javascript:history.back();";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}					
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/adminLogin.jsp");

	/*}*/
	}
}
=======
		String method = req.getMethod();
		InterAdminDAO adao = new AdminDAO();
		String msg = "";
		String loc = "";
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
		super.setViewPage("/WEB-INF/admin/adminLogin.jsp");

	}

}
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git
