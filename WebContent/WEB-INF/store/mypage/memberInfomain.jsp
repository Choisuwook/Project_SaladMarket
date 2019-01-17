<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String ctxPath=request.getContextPath();
%>
    
    
<jsp:include page="../header.jsp"/>
<aside id="colorlib-hero" class="breadcrumbs">
	<div class="flexslider">
		<ul class="slides">
	   	<li style="background-image: url(<%=ctxPath %>/store/images/cover-img-1.jpg);">
	   		<div class="overlay"></div>
	   		<div class="container-fluid">
	   			<div class="row">
		   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
		   				<div class="slider-text-inner text-center">
		   					<h1>MyPage</h1>
		   					<h2 class="bread">
			   					<span style="font-size: 13pt;"><a href="#">회원정보수정</a></span>
			   					<span style="font-size: 13pt;"><a href="#">환불 및 교환내역</a></span>
			   					<span style="font-size: 13pt;"><a href="#">찜 목록 보기</a></span>
			   					<span style="font-size: 13pt;"><a href="#">주문내역보기</a></span>
			   					<span style="font-size: 13pt;"><a href="#">보유쿠폰 보기</a></span>
			   					<span style="font-size: 13pt;"><a href="#">리뷰보기</a></span>
		   					</h2>
		   				</div>
		   			</div>
		   		</div>
	   		</div>
	   	</li>
	  	</ul>
  	</div>
</aside>

<%-- 헤더 끝 --%>
<script type="text/javascript">

$(document).ready(function() {
	
	
});
 function goLogin() {
		var frm = document.memberInfoFrmCheck;
		frm.method = "POST";
		frm.action= "login.do";
		frm.submit();
}
 function goMemberInfo() {
	 var loginPasswd = $("#password").val().trim();
	
	if(loginPasswd == null){
		alert("비밀번호를 입력하세요 ");
		$("#password").focus();
		return;
	}
	var frm = document.memberInfoFrm;
	frm.method = "POST";
	frm.action="memberInfoPwCheck.do";
	frm.submit();
}

</script>
<div style="width: 60%; margin-left:20%;" >
	<div align="center">
		<form name="memberInfoFrmCheck">
			<c:if test="${sessionScope.loginUser.userid == null}" >
				<span id="memberInfoLoginCheck" >로그인이 되어있지 않습니다. 로그인 후 확인하세요</span>
				<button type="button" id="btn-login" onClick="goLogin();">로그인</button>
				
			</c:if>
		</form>	
		<form name="memberInfoFrm">
			<c:if test="${sessionScope.loginUser.userid != null}">	
				<h2> 회원정보 </h2>
				<hr style="border: 1px solid gray;" >
				<table >			
					<tr>
						<th style="font-size: 15pt;">회원님의 정보를 안전하게 하게 위해 비밀번호를 다시 입력해주세요.</th>
					</tr>
					<tr>
						<th style="font-size: 18pt; ">비밀번호 재확인</th>
					</tr>
					<tr>
						<td><span style="font-size: 13pt;" id="userid" >${sessionScope.loginUser.userid} 님</span>
							<input type="hidden" name="userid" value="${(sessionScope.loginUser).userid}"/>
						<td>
						
					</tr>
			<%-- 	<tr>
						<td><span id="userid" class="userid" style="font-size: 13pt;">rkgus3575</span><td>
					</tr>
					 --%>
					<tr>
						<td><span style="font-size: 13pt;">비밀번호&nbsp;</span><input type="password" id="password" name="password" style="height: 15%;"/>
						<button type="button" id="btn-ok" onClick="goMemberInfo();">확인</button></td>
					</tr>
				</table>
			 </c:if>
		</form>
	</div>
</div>				
<jsp:include page="../footer.jsp"/>