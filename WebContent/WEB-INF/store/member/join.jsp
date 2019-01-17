<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>

<jsp:include page="../header.jsp" />
<aside id="colorlib-hero" class="breadcrumbs">
    <div class="flexslider">
       <ul class="slides">
          <li style="background-image: url(<%=CtxPath %>/store/images/cover-img-1.jpg);">
             <div class="overlay"></div>
             <div class="container-fluid">
                <div class="row">
                   <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
                      <div class="slider-text-inner text-center">
                         <h1>Join Us</h1>
                         <h2 class="bread"><span><a href="index.do">Home</a></span> <span><a href="login.do">Login</a></span></h2>
                      </div>
                   </div>
                </div>
             </div>
          </li>
         </ul> 
      </div>
</aside> 
<%-- header 끝  --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	var now = new Date(); 
	// 자바스크립트에서 현재날짜시각을 얻어온다.
		
	$(".error_idCheck").hide();
 	$(".error").hide();	
	$("#error_passwd").hide();
 	//$("#userid").focus(); 	
 	
	 $(".requiredInfo").each(function(){
		$(this).blur(function(){
			var data = $(this).val().trim();
			if(data == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$(this).parent().find(".error").show();
				$(":input").attr("disabled",true);
				$(this).attr("disabled",false);
				$(this).focus();
			}
			else {
				// 공백이 아닌 글자를 입력했을 경우
				$(this).parent().find(".error").hide();
				$(":input").attr("disabled",false).removeClass("bgcol"); 
			}
		});
	}); 

	// end of $(".requiredInfo").each()-------
	// 선택자.each(); 은
	// 선택자의 갯수만큼 반복처리를 해주는 것이다.
	// 그러므로 $(".requiredInfo").each(); 은
	// 클래스가 requiredInfo 인 것마다 하나하나씩 반복업무를 해주는 것이다. 

	$("#userid").click("keyup",function() {
		$(".error_idCheck").show();
		$("#idCheck").attr("disabled",true);
		$(this).val("");
	});
	
		$("#error").empty();
		$("#good").empty();
		
		$("#idCheck").click(function(){
			$(".error_idCheck").hide();
			if($("#userid").val().trim() == "") {
				alert("ID를 입력하세요!!");
				return;
			}
			
			var form_data = {userid:$("#userid").val()};
			$.ajax({
				url:"3idDuplicateCheck.do",
				type:"POST",
				data:form_data,
			    dataType:"JSON",
			    success:function(json){
			    	if(json.n == 0) {
			    		$("#error").empty();
			    		$("#good").empty().html("ID로 사용가능");
			    	}
			    	else if(json.n == 1) {
			    		$("#good").empty();
			    		$("#error").empty().html("이미사용중");
			    	}
			    },
			    error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
			
		});// end of $("#btn").click()-----------

	<%-- 비밀번호 --%>
		$("#password").blur(function(){
			var passwd = $(this).val();			
			//	var regExp_PW = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
			// 또는
			var regExp_PW = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식
			var bool = regExp_PW.test(passwd);
			if(!bool) {
				$(this).parent().find(".error_passwd").show();
				$(":input").attr("disabled", true).addClass("bgcol");
				$(this).attr("disabled", false).removeClass("bgcol");
				$(this).empty();
				$(this).focus();
			}
			else {
				$("#error_passwd").hide();
				$(":input").attr("disabled",false); 
				$("#pwdcheck").focus();
			} 
		}); // end of $("#pwd").blur()---------------	
	
		$("#pwdcheck").blur(function(){
			var passwd = $("#password").val();
			var passwdCheck = $(this).val();
			$(".error").hide();
			if(passwd != passwdCheck) {
				$(this).parent().find(".error").show();
				$(":input").attr("disabled", true).addClass("bgcol");
				$(this).attr("disabled", false).removeClass("bgcol");
				$(this).val("");
				$("#password").attr("disabled",false);
				$("#password").focus();
			}
			else {
				$(this).parent().find(".error").hide();
				$(":input").attr("disabled",false).removeClass("bgcol");
			}			
		});// end of $("#pwdcheck").blur()--------------		
		<%-- 비밀번호 --%>	
	$("#email").blur(function(){		
		var email = $(this).val();		
		var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 		
		var bool = regExp_EMAIL.test(email);
		if(!bool) {// 이메일 형식에 맞지 않을 때.
			$(this).parent().find(".error").show();
			$(":input").attr("disabled",true);
			$(this).attr("disabled",false).removeClass("bgcol"); 
			$(this).val("");
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
		
	}); //$("#phone").blur(function()-------------

	<%-- 우편번호 --%>		
	$("#zipcodeSearch").click(function(){		
		
		new daum.Postcode({
			oncomplete: function(data) {
			    $("#postnum").val(data.zonecode);  // 우편번호의 첫번째 값     예> 151
			   // $("#post2").val(data.postcode2);  // 우편번호의 두번째 값     예> 019
			    $("#addr1").val(data.address);    // 큰주소                        예> 서울특별시 종로구 인사로 17 
			    $("#addr2").focus();
			}
		}).open();
	});
	<%-- 우편번호 --%>	
	$("#addr2").blur(function(){
		var address = $("#addr2").val();
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
}); // end of $(document).ready()-------------------  



function goRegister(event) {
 
	  if( !$("input:checkbox[id=agree]").is(":checked") ) {
		  alert("이용약관에 동의하셔야 합니다.");
		  return;
	  } 
	 
	  var frm = document.registerFrm;
	  frm.method = "POST";
	  frm.action = "memberJoinEnd.do";
	  frm.submit();
}// end of function goRegister(event)---------- 

</script>
<%-- 본문 시작 --%>

  <div class="container" style="margin-left: 30%;">      
   <div class="col-md-8">
      <form class="colorlib-form joinfrm" name="registerFrm">
      <%-- 아이디 --%>
            <div class="form-group">
               <div class="col-md-6">
                  <label for="userid">아이디</label>
                  <input type="text" id="userid" name="userid" class="form-control requiredinfo" placeholder="ID">   
                  <span class="error_idCheck" style="color: blue; font-size: 12px;">아이디 확인 버튼을 누르세요.</span>             
               </div>
<<<<<<< HEAD
               <div class="col-md-4" style="margin-top:5.5%">
                  <button type="button" class="btn" style="width: 80px; height: 20px; padding: 0%;"><span style="font-size: 2px;" id="idCheck" >아이디 확인</span></button>
                  <br/><span id="error" style="color: red; font-weight: bold;"></span>
				  <span id="good" style="color:blue;font-weight:bold; margin:5%"></span>
=======
               <div class="col-md-2" style="margin-top:8.5%">
                  <button type="button" class="btn" style="width: 80px; height: 20px; padding: 0%;"><span style="font-size: 2px;" id="idCheck" >아이디 확인</span></button>
                  <br/><span id="error" style="color: red; font-weight: bold;"></span>
				  <span id="good" style="color: blue; font-weight: bold;"></span>
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git
<!--                </div>               
               <div class="col-md-4 error" style="margin-top:8.5%"> -->
				
               </div>            
            </div>
       <%-- 아이디 --%>
       <%-- 비밀번호 --%>
            <div class="form-group">
               <div class="col-md-6">
                  <label for="password">비밀번호</label>
                  <input type="password" id="password" name="pwd" class="form-control requiredinfo" placeholder="Password">
                  <span class="error error_passwd" style="color: blue; font-size: 12px;">비밀번호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
               </div>
                <div class="col-md-5" style="margin-top:5%">
                   
               </div>
            </div>
            <div class="form-group">
               <div class="col-md-6">
                  <label for="pwdcheck">비밀번호확인</label>
                  <input type="password" id="pwdcheck" class="form-control requiredinfo" placeholder="Password">
                        <span class="error" style="color: blue; font-size: 12px;">암호가 일치하지 않습니다.</span>
               </div>
               <div class="col-md-4" style="margin-top:8.5%">               
               </div>
            </div>
            <%-- 비밀번호 --%>
            <div class="form-group">
               <div class="col-md-6">
                  <label for="username">성명</label>
                  <input type="text" id="username" name="name" class="form-control requiredinfo" placeholder="Name">
               </div>
               <div class="col-md-4" style="margin-top:8.5%">
                    <!--  <span class="error" style="color: blue; font-size: 12px;">성명을 입력하세요.</span> -->
               </div>
            </div>
            <%-- 이메일 --%>
            <div class="form-group">
               <div class="col-md-6" >
                  <label for="email">이메일</label>
                  <input type="text" id="email" name="email" class="form-control requiredinfo" placeholder="abc@gmail.com">
                  <span class="error" style="color: blue; font-size: 12px;">이메일 형식에 맞게 입력하세요.</span>
               </div>
               <div class="col-md-5" style="margin-top:8.5%">                     
               </div>
            </div>
              <%-- 이메일 --%>
              <%-- 휴대전화 --%>
            <div class="form-group">   
               <div class="col-md-6">
                  <label for="phone ">연락처</label>
                  <input type="text" id="phone" name="phone" class="form-control requiredInfo" placeholder="Phone Number" maxlength="11">
                  <span class="error error_phone" style="color: blue; font-size: 12px;"> 연락처를 확인하세요.</span>
               </div>  
               <div class="col-md-5" style="margin-top:8%">
                     <span class="error error_hp" style="color: blue; font-size: 12px;"> - 없이 입력해주세요.</span>
               </div> 
               <div class="col-md-5" style="margin-top:8.5%">                    
               </div>
            </div>
            <%-- 휴대전화 --%>
            <%-- 우편번호 --%>
            <div class="form-group">
               <div class="col-md-3">
                  <label for="postnum">우편번호</label>
                  <input type="text" id="postnum" name="postnum" size="6" maxlength="3" class="form-control requiredinfo" placeholder="PostNum">
               	  <span class="error error_post">우편번호 형식이 아닙니다.</span>
               </div>
<!--                <div class="col-md-3" style="margin-top: 4%">
               	  <input type="text" id="post2" class="form-control requiredinfo" placeholder="PostNum" name="post2" size="6" maxlength="3">
               	 
               </div> -->
               <div class="col-md-2" style="margin-top: 8.5%">
                  <button type="button" class="btn" id="zipcodeSearch" style="width: 80px; height: 20px; padding: 0%;"><span style="font-size: 2pt;">우편번호찾기</span></button>
               </div>
               <div class="col-md-4" style="margin-top:8.5%">
                     <span class="error" style="color: blue; font-size: 12px;">우편번호 형식에 맞게 입력하세요.</span>
               </div>
            </div>
              <%-- 우편번호 끝 --%>
              <%-- 주소  --%>
             <div class="form-group">
               <div class="col-md-6">
                  <label for="address">주소</label>
                  <input type="text" id="addr1" name="addr1" class="form-control requiredinfo" placeholder="Enter Your Address">
               </div>
            </div>
            <div class="form-group">
               <div class="col-md-6">
                  <input type="text" id="addr2" name="addr2" class="address form-control requiredinfo" placeholder="Enter Your Address">
               </div>
               <div class="col-md-4" style="margin-top:4%">
                     <span class="error" style="color: blue; font-size: 12px;">주소를 입력하세요.</span>
               </div>
            </div>
            <%-- 생넌 월일 --%>
            <div class="form-group">
               <div class="col-md-3">
                  <label for="postnum">생년월일</label>
                  <input type="number" id="birthyyyy" name="birthyyyy" class="form-control requiredinfo" min="1950" max="2050" step="1" value="1995"/>      
               </div>
               <div class="col-md-2" style="margin-top: 4%">
                  <select id="birthmm" name="birthmm" class="form-control requiredinfo">
                     <option value ="01">01</option>
                     <option value ="02">02</option>
                     <option value ="03">03</option>
                     <option value ="04">04</option>
                     <option value ="05">05</option>
                     <option value ="06">06</option>
                     <option value ="07">07</option>
                     <option value ="08">08</option>
                     <option value ="09">09</option>
                     <option value ="10">10</option>
                     <option value ="11">11</option>
                     <option value ="12">12</option>
                  </select> 
               </div>
               <div class="col-md-2" style="margin-top: 4%">
                  <select id="birthdd" name="birthdd" class="form-control">
                  <option value ="01">01</option>
                  <option value ="02">02</option>
                  <option value ="03">03</option>
                  <option value ="04">04</option>
                  <option value ="05">05</option>
                  <option value ="06">06</option>
                  <option value ="07">07</option>
                  <option value ="08">08</option>
                  <option value ="09">09</option>
                  <option value ="10">10</option>
                  <option value ="11">11</option>
                  <option value ="12">12</option>
                  <option value ="13">13</option>
                  <option value ="14">14</option>
                  <option value ="15">15</option>
                  <option value ="16">16</option>
                  <option value ="17">17</option>
                  <option value ="18">18</option>
                  <option value ="19">19</option>
                  <option value ="20">20</option>
                  <option value ="21">21</option>
                  <option value ="22">22</option>
                  <option value ="23">23</option>
                  <option value ="24">24</option>
                  <option value ="25">25</option>
                  <option value ="26">26</option>
                  <option value ="27">27</option>
                  <option value ="28">28</option>
                  <option value ="29">29</option>
                  <option value ="30">30</option>
                  <option value ="31">31</option>
               </select> 
            </div>
            <div class="col-md-4" style="margin-top:8.5%">
               <span class="error" style="color: blue; font-size: 12px;">생년월일을 입력하세요.</span>
             </div>      
          </div>
          
         <div class="row col-md-12">
            <label for="agree">이용약관에 동의합니다</label>&nbsp;&nbsp;<input type="checkbox" id="agree" />
         </div>
         
         <div class="row col-md-12">
            <iframe src="<%=CtxPath %>/store/agree/agree.html" width="100%" height="150px" class="box" ></iframe>
         </div>
         

         <div class="row">
            <div class="col-md-12" style="margin-left: 35%; margin-top: 5%;" >
               <p><a href="#" id="join" class="btn btn-primary" onClick="goRegister();">가입하기</a></p>
            </div>
         </div>

       </form>
   </div>
</div>

<div class="gototop js-top">
   <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>

<jsp:include page="../footer.jsp" />