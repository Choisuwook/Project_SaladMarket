package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class GoIdFindAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String method = req.getMethod();
		InterMemberDAO memberdao = new MemberDAO();

		if("POST".equalsIgnoreCase(method)) {
			//id 찾기 모달창에서 찾기 버튼을 클릭 했을 경우
			System.out.println("GoIdFindAction");
			String username = req.getParameter("username");
			String phone = req.getParameter("phone");
	/*		
			req.setAttribute("username", username);
			req.setAttribute("phone", phone);	*/	
					
			String userid = memberdao.getUserid(username,phone);
			
			
			if("".equals(userid)) {
				req.setAttribute("userid","회원정보에 맞는 ID가 존재하지 않습니다.");				
			}
			else {							
				req.setAttribute("userid",userid);
			}
			
		req.setAttribute("method",method);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/login/idFind.jsp");
		
	}


	}

}
