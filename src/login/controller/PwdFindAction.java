package login.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.controller.GoogleMail;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class PwdFindAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String method = req.getMethod();
		// GET or POST
		//처음에는 겟방식으로 보여짐
		
		if("POST".equalsIgnoreCase(method)) {
			
			String userid = req.getParameter("userid");
			String email = req.getParameter("email");
			
			MemberDAO memberdao = new MemberDAO();

			int n = memberdao.isUserExists(userid,email);
			//userid 와 email을 받아 비밀번호 찾기 메소드
			if(n ==1 ) {
						//회원 으로 존재하는 경우
						GoogleMail gmail = new GoogleMail();
						//인증키를 랜덤하게 생성하도록 한다.
						Random rnd = new Random();
						
						String certificationCode="";
						// certificationCode = "ewrfs0003483"
						
						char randchar=' ';
						
						for(int i=0;i<5;i++) {
							// min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면
							// int rndnum = rnd.nextInt(max-min +1)+min
							// 영문 소문자 'a'부터 'z'까지 중 랜덤하게 1개를 만든다.
							
							
							randchar = (char)(rnd.nextInt('z'-'a'+1)+'a');
							//(char)97;
							certificationCode +=randchar;					
						}				
						int randint=0;
						for(int i=0;i<7;i++) {
							randint = rnd.nextInt(9-0+1)+0;
							certificationCode +=randint;
						}
						
					//랜덤하게 생성한 인증코드를 비밀번호 찾기를 하고자하는 사용자의 email 로 전송시킨다 
						try {			
								gmail.sendmail(email, certificationCode);
								//req.setAttribute("certificationCode", certificationCode);
								HttpSession session =  req.getSession();
								//자바에서 발급한 인증코드를 세션에 저장
								session.setAttribute("certificationCode", certificationCode);
						} catch (Exception e) {
								e.printStackTrace();
								n=-1;
								req.setAttribute("sendFailmsg", "메일발송이 실패했습니다");
						}
			}
			req.setAttribute("n",n);
			/*
			 n == 0 이면 존재하지 않은 uerid 또는 email 경우
			 n == 1이면 userid와 email 이 존재하면서 메일발송이 성공한 경우
			 n == -1 이면 userid와 email 이 존재하는데 메일발송이 실패한 경우 			
			 */
			req.setAttribute("userid", userid);
			req.setAttribute("email", email);
			System.out.println(userid);
	
		}
		req.setAttribute("method",method);

		super.setRedirect(false);// false를 해주어야 url 이 바뀌지 않는다
		//super.setViewPage("/WEB-INF/store/login/pwdCodeVerify.jsp");
		super.setViewPage("/WEB-INF/store/login/pwdFind.jsp");
				
	}

}
