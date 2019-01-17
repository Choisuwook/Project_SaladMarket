package event.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import event.model.EventDAO;
import event.model.EventVO;
import event.model.InterEventDAO;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class CuponListaction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberVO loginUser = super.getLoginUser(req);
		if(loginUser == null) {
			String msg = "로그인부터 하세요!";
			String loc ="login.do";
			loginUser=null;
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}else {
			InterMemberDAO mdao = new MemberDAO();
			EventVO evo = new EventVO();
			InterEventDAO edao = new EventDAO();
			String userid = loginUser.getUserid();
				
			System.out.println(userid);
			MemberVO membervo = mdao.getMemberOneByMnum(userid);
			List<HashMap<String,String>> couponvo = edao.getCouponList(userid);
			req.setAttribute("loginUser", loginUser);
			req.setAttribute("membervo", membervo);
			req.setAttribute("couponvo", couponvo);
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/store/mypage/cuponList.jsp");

		}

	}

}
