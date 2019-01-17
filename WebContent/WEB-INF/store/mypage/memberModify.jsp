<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

$(document).ready(function(){	
	$(".error").hide();
	$("#error_passwd").hide();
	$(".requiredInfo").each(function(){		
		$(this).blur(function(){
			var data = $(this).val().trim();
			if(data == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				// alert("입력하지 않거나 공백만 입력했을 경우");				
				$(this).parent().find(".error").show();
				$(":input").attr("disabled",true).addClass("bgcol");
				$(this).attr("disabled",false).removeClass("bgcol");
			}
			else{
				// 공백이 아닌 글자를 입력한 경우
				// alert("공백이 아닌 글자를 입력한 경우");
				$(this).parent().find(".error").hide();
				$(":input").attr("disabled",false).removeClass("bgcol");
			}
		});
		
	});// end of $(".requiredInfo").each()----------------
	
	
	$("#password").blur(function() {
		var passwd = $(this).val();
		
//		var regExp_PW = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
		// 또는
		var regExp_PW = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
		// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 객체 생성
		
		var bool = regExp_PW.test(passwd);
		/* 암호 정규표현식 검사를 하는 것 
		      정규표현식에 만족하면 리턴값은 true,
		      정규표현식에 틀리면 리턴값은 false */
		      
		if(!bool) {
			$("#error_passwd").show();
			$(":input").attr("disabled",true).addClass("bgcol"); 
			$(this).attr("disabled",false).removeClass("bgcol");
			$(this).focus();
		}   
		else {
			$("#error_passwd").hide();
			$(":input").attr("disabled",false).removeClass("bgcol"); 
			$("#pwdcheck").focus();
		}
		
	});// end of $("#pwd").blur()-------------------
	
	
	$("#pwdcheck").blur(function(){
		var password = $("#password").val();
		var pwdcheck = $(this).val();
		
		if(password != pwdcheck) {
			$(this).parent().find(".error").show();
			$(":input").attr("disabled",true).addClass("bgcol");
			$(this).attr("disabled",false).removeClass("bgcol");
			$("#password").attr("disabled",false).removeClass("bgcol");
			$("#password").focus();
		}
		else {
			$(this).parent().find(".error").hide();
			$(":input").attr("disabled",false).removeClass("bgcol"); 
		}
		
	});// end of $("#pwdcheck").blur()--------------		

	
	$("#email").blur(function(){
		
		var email = $(this).val();
		
		var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
		// email 을 검사하는 정규식 객체 생성
		
		var bool = regExp_EMAIL.test(email);
		
		if(!bool) {
			$(this).parent().find(".error").show();
			$(":input").attr("disabled",true).addClass("bgcol");
			$(this).attr("disabled",false).removeClass("bgcol"); 
			$(this).focus();
		}
		else {
			$(this).parent().find(".error").hide();
			$(":input").attr("disabled",false).removeClass("bgcol");
		}
		
	});// end of $("#email").blur()--------------

	$("#phone").blur(function(){
		
		var phone = $(this).val();
		var regExp = /^[0-9]+$/g;
		var bool = false;
		bool = regExp.test(phone);
		
		
		if(!bool) {
			$(this).parent().find(".error").show();
			$(":input").attr("disabled", true).addClass("bgcol");
			$(this).attr("disabled", false).removeClass("bgcol");
			
		}else if(!(10 <= phone.length <= 11))
		{
			$(this).parent().find(".error").show();
			$(":input").attr("disabled", true).addClass("bgcol");
			$(this).attr("disabled", false).removeClass("bgcol");
		} 
		else {
			$(this).parent().find(".error").hide();
			$(":input").attr("disabled", false).removeClass("bgcol");
		}
	
	});// $("#phone").blur

	<%-- 우편번호 --%>		
	$("#zipcodeSearch").click(function(){		
		
		new daum.Postcode({
			oncomplete: function(data) {
			    $("#postnum").val(data.zonecode);  // 우편번호의 첫번째 값     예> 151
			    var address1 = $("#address").val(data.address);    // 큰주소                        예> 서울특별시 종로구 인사로 17 
			    if(address1 == ""){
			    	address1 = $("#address").val("#address");
			    }
			    $("#address2").focus();
			}
		}).open();
	});
	<%-- 우편번호 --%>	
	$("#address2").blur(function(){
		var address2 = $("#address2").val();
		if(address == "") {
			$(this).parent().find(".error").show();
			$(":input").attr("disabled", true).addClass("bgcol");
			$(this).attr("disabled", false).removeClass("bgcol");
		}
		else {
			$(this).parent().find(".error").hide();
			$(":input").attr("disabled", false).removeClass("bgcol");
		}
	});
	
	$("#btnEdit").click(function() {
		goEdit();
	})
}); // end of $(document).ready()-------------------  


function goEdit(event) {
	
	var flagBool = false;
	
	$(".requiredInfo").each(function(){
		var data = $(this).val().trim();
		if(data == "") {
			flagBool = true;
			return false;
			/*
			   for문에서의 continue; 와 동일한 기능을 하는것이 
			   each(); 내에서는 return true; 이고,
			   for문에서의 break; 와 동일한 기능을 하는것이 
			   each(); 내에서는 return false; 이다.
			*/
		}
	});
	if(flagBool) {
		alert("필수입력란은 모두 입력하셔야 합니다.");
		event.preventDefault(); // click event 를 작동치 못하도록 한다.
		return;
	}
	else {
		var frm = document.editFrm;
		frm.method = "POST";
		frm.action = "memberEditEnd.do";
		frm.submit();
	}
	
}// end of goEdit(event)------------------
</script>
<div style="margin: 3%; border: 0px solid red;" align="center">
	<div style="width: 80%;margin: 0 auto;" align="center">
		<table style="width: 80%; border: 1px solid gray;">
			<tr height="100px;" style="">
				<td width="15%" style="font-size: 20pt; text-align: center; border: 1px solid gray;">
					<span id="name" class="name">${(sessionScope.loginUser).name}</span>
					<span style="font-size: 12pt">님</span><br>
					<span id="level" class="level" style="font-size: 12pt; font-weight: bold;" >${(sessionScope.loginUser).fk_lvnum}</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">배송현황</span>
					<br>
					<span style="font-size: 17pt">0</span><span style="font-size: 13pt">개</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">보유쿠폰</span>
					<br>
					<span style="font-size: 17pt">${(sessionScope.loginUser).cpnumCount}</span><span style="font-size: 13pt">개</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">Point</span>
					<br>
					<span style="font-size: 17pt">${(sessionScope.loginUser).point}</span><span style="font-size: 13pt">point</span>
				</td>
			</tr>
		</table>
	</div>
</div>
<div style="margin-top: 3%; margin-bottom: 1%;" align="center">
		<span style="font-weight: bold; font-size: 18pt; ">회원정보 수정</span>
		
		&nbsp;&nbsp;
	</div>	
<div class="container" style="margin-left: 25%;">      
   <div class="col-md-10">
      <form method="post" name="editFrm" class="colorlib-form">
      <input type="hidden" id="userid" name="userid" value="${(sessionScope.loginUser).userid}" />
       <input type="hidden" id="name" name="name" value="${(sessionScope.loginUser).name}" />
      <h5><span style="color: red">*은 필수 입력 사항입니다.</span></h5>
            <div class="form-group">
               <div class="col-md-6">
                  <label for="password">비밀번호<span style="color: red;">*</span></label>
                  <input type="password" id="password" name="pwd" class="form-control requiredInfo" placeholder="Password" required>
                  <span id="error_passwd">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>	
               </div>
            </div>
            <div class="form-group">
               <div class="col-md-6">
                  <label for="pwdcheck">*비밀번호확인<span style="color: red;">*</span></label>
                  <input type="password" id="pwdcheck" class="form-control requiredInfo" placeholder="Pwdcheck" required>
                  <span class="error">암호가 일치하지 않습니다.</span>
               </div>
            </div>
            <div class="form-group">
               <div class="col-md-6" >
                  <label for="email">이메일</label>
                  <input type="text" id="email" name="email" class="form-control" placeholder="State Province" value="${membervo.email}">
               	  <span class="error">이메일 형식에 맞지 않습니다.</span>
               </div>
            </div>
            <div class="form-group">   
               <div class="col-md-6">
                  <label for="phone ">연락처</label>
                  <input type="text" id="phone " name="phone" class="form-control" placeholder="Phone Number" value="${membervo.phone}">
               </div>   
            </div>
            <div class="form-group">
              	 <div class="col-md-3">
                 	 <label for="postnum">우편번호</label>
              		 <input type="text" id="postnum" name="postnum" class="form-control" placeholder="PostNum" value="${membervo.postnum}">
              	 </div>
              	 <div class="col-md-3" style="margin-top: 8.5%">
                  	<button type="button" class="btn" id="zipcodeSearch" style="width: 80px; height: 20px; padding: 0px;"><span style="font-size: 2pt;">우편번호찾기</span></button>
               	</div>
               	<div class="col-md-4" style="margin-top:8.5%">
                     <span class="error" style="color: blue; font-size: 12px;">우편번호 형식에 맞게 입력하세요.</span>
               </div>
            </div>
            <div class="col-md-6">
               <div class="form-group">
                  <label for="fname">주소</label>
                      <input type="text" id="address" name="address1" class="form-control" placeholder="Enter Your Address" value="${membervo.address1}">
                   </div>
                  <div class="form-group">
                         <input type="text" id="address2" name="address2" class="form-control" placeholder="Second Address" value="${membervo.address2}">
                  </div>
               </div>
         <div class="row">
            <div class="col-md-12" style="margin-left: 35%; margin-top: 5%;" >
               <p><button type="button" class="btn btn-primary" id="btnEdit">수정하기</button></p>
               <!-- <a href="" class="btn btn-primary" id="btnEdit">수정하기</a></p> -->
            </div>
         </div>

       </form>
   </div>
</div>

<div class="gototop js-top">
   <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>

<jsp:include page="../footer.jsp" />