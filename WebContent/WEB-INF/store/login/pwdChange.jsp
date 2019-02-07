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
                        <h1>Password Change</h1>
                        <h2 class="bread"><span><a href="index.jsp">Home</a></span> <span><a href="login.jsp">Login</a></span></h2>
                     </div>
                  </div>
               </div>
            </div>
         </li>
        </ul> 
     </div>
</aside>
      
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#btnUpdate").click( function(event){
			
			var password = $("#password").val();
			var pwdcheck = $("#pwdcheck").val();
			var regexp_passwd = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
			/* 암호는 숫자,영문자,특수문자가 포함된 형태의 8~15글자 이하만 허락해주는 정규표현식 객체 생성 */
			
			var bool = regexp_passwd.test(password);
			/* 암호 정규표현식 검사를 하는 것 
			      정규표현식에 만족하면 리턴값은 true,
			      정규표현식에 틀리면 리턴값은 false */
			  console.log("#userid");
			if(!bool) {
				alert("암호는 8글자 이상 15글자 이하에 영문자, 숫자, 특수기호가 혼합되어야 합니다."); 
				$("#password").val("");
				$("#pwdcheck").val("");
				event.preventDefault();
				return;
			}else if(password != pwdcheck) {
				alert("암호가 일치하지 않습니다.");
				$("#password").val("");
				$("#pwdcheck").val("");
				event.preventDefault();
				return;
			}else {//정규표현식에도 맞고 pwd와 pwd2가 같다
				var frm = document.pwdChangeFrm;
				frm.method = "POST";
				frm.action = "pwdChangeEnd.do";
				frm.submit();	
				//정규표현식을 검사한 다음 post방식으로 다시 pwdCinfirm.do에 보낸다
			}
		});
				
	});
	
</script>
<div class="container"  style="text-align: center; vertical-align: center;">      
   <div class="col-md-12">
   	<div>
	    <form method="post"  name="pwdChangeFrm"  class="colorlib-form">    
		       <div class="form-group" style="margin-top: 3%;">
		         <div class="col-md-4" style="margin-top: 3%;"></div> <%-- 이부분은 칸 조정할려고 넣어놨어요ㅠㅠ --%>
		       	 <div class="col-md-1" style="margin-top: 3%;">
		             <label for="password">비밀번호</label>
		          </div>
		          <div class="col-md-3">
		              <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호">
		          </div>
		       </div>
				<input type="hidden" name="userid" value="${userid}" />
		       <div class="form-group" style="margin-bottom: 3%; border:1px solid red;">
			       <div class="col-md-3" style="margin-top: 3%;"></div> <%-- 이부분은 칸 조정할려고 넣어놨어요ㅠㅠ --%>
			       <div class="col-md-2" style="margin-top: 3%;" align="right">
			           <label for="password">비밀번호 확인</label>
			       </div>
			       <div class="col-md-3">
			           <input type="password" id="pwdcheck" class="form-control" placeholder="비밀번호확인">
			       </div>
		       </div>		       
		       <div class="row" style="margin-bottom: 2%">
		          <div class="col-md-12" style="margin-left: 43%;" >
		          	<button type="button" id="btnUpdate" class="btn"><span style="font-size: 9pt;">비밀번호 변경</span></button>
		          </div>
		       </div>       
	    </form>
     </div>
   </div>
</div>

<div class="gototop js-top">
   <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>
<jsp:include page="../footer.jsp" />