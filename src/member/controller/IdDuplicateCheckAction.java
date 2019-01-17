package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class IdDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res)
		throws Exception {
		
		String userid = req.getParameter("userid");
		
		InterMemberDAO adao = new MemberDAO();
		
		int n = adao.idDuplicateCheck(userid);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		
		String str_json = jsonObj.toString();
		
		req.setAttribute("str_json", str_json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/member/3idDuplicateCheck.jsp");
		
	}

}
