<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.model.*" %>
<jsp:include page="../header.jsp" />
<% String CtxPath = request.getContextPath(); %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<aside id="colorlib-hero" class="breadcrumbs">
    <div class="flexslider">
       <ul class="slides">
          <li style="background-image: url(<%=CtxPath %>/store/images/cover-img-1.jpg);">
             <div class="overlay"></div>
             <div class="container-fluid">
                <div class="row">
                   <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
                      <div class="slider-text-inner text-center">
                         <h1>Login</h1> 
                         <h2 class="bread"><span><a href="index.do">Home</a></span> <span><a href="join.jsp">Join Us</a></span></h2>
                      </div>
                   </div>
                </div>
             </div>
          </li>
         </ul> 
      </div>
</aside>
<%-- header 끝 --%>>
<script type="text/javascript">
	$(document).ready(function() {
		
		
 		$("#btn-login").click(function() {
			goLogin();
			
		});
		$("#password").keydown(function(event){
		if(event.keyCode == 13) { // 엔터를 했을 경우
			goLogin();
		}
	});// end of $("#btnSubmit").click()------------
	
		//end of $("#btnSubmit").click(function()
/* 		$("#password").keydown(function(event) {			
			//엔터를 했을 경우.(13)
			if(event.keyCode ==13){
				goLogin();	
			}
		}); */// end of $("#loginPwd").keydown(function()
				
		//$(".myclose").click(function(){
			// alert("닫는다.");
			
		//	javascript:history.go(0);
			// 현재 페이지를 새로고침을 함으로써 모달창에 입력한 성명과 휴대폰의 값이 텍스트박스에 남겨있지 않고 삭제하는 효과를 누린다. 
			
			/* === 새로고침(다시읽기) 방법 3가지 차이점 ===
			   >>> 1. 일반적인 다시읽기 <<<
			   window.location.reload();
			   ==> 이렇게 하면 컴퓨터의 캐쉬에서 우선 파일을 찾아본다.
			            없으면 서버에서 받아온다. 
			   
			   >>> 2. 강력하고 강제적인 다시읽기 <<<
			   window.location.reload(true);
			   ==> true 라는 파라미터를 입력하면, 무조건 서버에서 직접 파일을 가져오게 된다.
			            캐쉬는 완전히 무시된다.
			   
			   >>> 3. 부드럽고 소극적인 다시읽기 <<<
			   history.go(0);
			   ==> 이렇게 하면 캐쉬에서 현재 페이지의 파일들을 항상 우선적으로 찾는다.
			*/	
			
		//}); 
	});
	 function goLogin() {
		var loginUserid=$("#userid").val().trim();
		var loginPwd=$("#password").val().trim();

		if(loginUserid == ""){
			alert("아이디를 입력하세요 ");
			//$("#userid").val("");
			$("#userid").focus();
			return;
		}
		console.log(loginUserid);
		if(loginPwd == ""){
			alert("비밀번호를 입력하세요 ");
			//$("#password").val("");
			$("#password").focus();
			return;
		}
		var frm = document.loginFrm;
 		frm.method="POST";
		frm.action="loginEnd.do";
		frm.submit();  
	} 
</script>

<%
    MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");

    if(loginuser == null) { 
    /*
	        로그인 하려고 할때 WAS(톰캣서버)는 
	        사용자 컴퓨터 웹브라우저로 부터 전송받은 쿠키를 검사해서
	        그 쿠키의 사용유효시간이 0초 짜리가 아니라면
	        그 쿠키를 가져와서 웹브라우저에 적용시키도록 해준다.
	        우리는 쿠키의 키 값이 "saveid" 가 있으면
	        로그인 ID 텍스트박스에 아이디 값을 자동적으로 올려주면 된다.
     */

     Cookie[] cookieArr = request.getCookies();
	/*
	        쿠키는 쿠키의 이름(키값)별로 여러개 저장되어 있으므로
	        쿠키를 가져올때는 배열타입으로 가져와서
	        가져온 쿠키배열에서 개발자가 원하는 쿠키의 이름과 일치하는것을
	        뽑기 위해서는 쿠키 이름을 하나하나씩 비교하는 것 밖에 없다.
	*/	
	
	String cookie_key = "";
	String cookie_value = "";
	boolean flag = false;
	
	if(cookieArr != null) {
		// 사용자 클라이언트 컴퓨터에서 보내온 쿠키의 정보가 있다라면
		
		for(Cookie c : cookieArr) {
			cookie_key = c.getName(); // 쿠키의 이름(키값)을 꺼내오는 메소드.
			
			if("saveid".equals(cookie_key)) {
				cookie_value = c.getValue(); // 쿠키의 value 값을 꺼내오는 메소드. 
				flag = true;
				break; // for 탈출
			}
		}// end of for-------------------
	}
  %>
<div class="container">      
   <div class="col-md-12">
      <div>
       <form name="loginFrm" class="colorlib-form">   
	 	<% if(flag){
			%>
			value="<%= cookie_value %>"<%		 	 			
		}%>
        <%-- 아이디  --%>
          <div class="form-group" style="margin-top:3%; border:solid 0px blue;">
	            <div class="col-md-4" style="margin-top:3%; border:solid 0px blue;"></div> <%-- 이부분은 칸 조정할려고 넣어놨어요ㅠㅠ --%>	            
	            <div class="col-md-1"  style="margin-top:1%; border: solid 0px red;">
	                <span id="loginId"><label for="userid">아이디</label></span>
	            </div>
	            <div class="col-md-3">
	                <input type="text" id="userid" name="userid" class="form-control box" placeholder="ID">
	            </div>
          </div>
         <%-- 아이디  --%>
         <%-- 비밀번호 --%>
          <div class="form-group">
             <div class="col-md-4" style="margin-top:3%;"></div> <%-- 이부분은 칸 조정할려고 넣어놨어요ㅠㅠ --%>
             <div class="col-md-1" style="margin-top:1%;">
                 <label for="password">비밀번호</label>
             </div>
             <div class="col-md-3">
                 <input type="password" id="password" name="pwd" class="form-control box" placeholder="Password">
          	</div>
          </div>
          <%-- 비밀번호 --%>  
          <div class="form-group" align="right" style="margin: 0%;">
              <div class="col-md-8">
                 <!-- <input type="checkbox" id="idcheck"><label for="idcheck">아이디 저장</label> -->
                 
                 <tr>
					<td colspan="2" align="center" style="padding: 10px;">
						<% 
						   if(flag == false) { %>
							  <input type="checkbox" id="idcheck" name = "idcheck"><label for="idcheck">아이디저장</label>	   
						<%   }else { %>
							   <input type="checkbox" id="idcheck" name = "idcheck" checked><label for="idcheck">아이디저장</label>	   
						<% } %> 
					</td>
				</tr>
                 
                 
                 
             </div>
          </div> 
                   
          <div class="row" style="margin-bottom: 2%">
             <div class="col-md-12" style="margin-top: 1%; margin-left: 33%;" >
				<button class="btn"><span style="font-size: 9pt;"><a href="idFind.do">아이디 찾기</a></span></button>
               
				
				<button class="btn"><span style="font-size: 9pt;"><a href="pwdFind.do">비밀번호 찾기</span></button>
                

                
                <button class="btn btn-primary" id="btn-login" style="margin-left:2%;"><span style="font-size: 10pt;">로그인</span></button>
             </div>
          </div>        
          
       </form>
        <%			
    } %>
     </div>
   </div>
</div>

<div class="gototop js-top">
   <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>

<jsp:include page="../footer.jsp" />