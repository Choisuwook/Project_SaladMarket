<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h1>Find ID</h1>
                        <h2 class="bread"><span><a href="index.do">Home</a></span> <span><a href="login.do">Login</a></span></h2>
                     </div>
                  </div>
               </div>
            </div>
         </li>
        </ul> 
     </div>
</aside>
<script>
	$(document).ready(function() {
		$("#btnIdFind").click(function () {
			var username = $("#username").val().trim();
			var phone = $("#phone").val().trim();
			
			if(username == ""){
				alert("사용자 이름을 입력하세요!");
				 $("#username").focus();
				 return;
			}
			
			if(phone == ""){
				alert("핸드폰 번호를 입력하세요!");
				 $("#phone").focus();
				 return;
			}
			if(username != null && phone != null){
				goIdFind();
/* 				var url = "goIdFind.do";
				window.open(url, "userid",
						    "left=500px, top=100px, width=300px, height=230px"); */
			}

		});// end of $("#idcheck").click()------------
		
		
	});
	function goIdFind() {
		
/* 				console.log("하하하")
 			// 팝업창 띄우기
			var url = "goIdFind.do";
			window.open(url, "idfind",
					    "left=500px, top=100px, width=300px, height=230px");
			// 기본적으로 아무런 조건없이 그냥 어떤 창을 띄우면 method 는 GET 방식으로 움직인다. 	 		
		}*/
 		var frm = document.idFindFrm;
		frm.method="POST";
		frm.action="goIdFind.do";
		frm.submit();
		
	}
</script>
<div class="container">      
   <div class="col-md-12">
   	<div>
	   	<c:if test="${requestScope.method eq 'GET'}">
		    <form name="idFindFrm" method="POST" class="colorlib-form">    
		       <div class="form-group" style="margin-top: 3%;">
		         <div class="col-md-4" style="margin-top: 3%;"></div> <!-- 이부분은 칸 조정할려고 넣어놨어요ㅠㅠ -->
		       	 <div class="col-md-1" style="margin-top: 3%;"> 
		             <label for="username">성명</label>
		          </div>
		          <div class="col-md-3">
		             <input type="text" id="username" name="username" class="form-control" placeholder="Name">
		          </div>
		       </div>
		       
		       <div class="form-group" style="margin-bottom: 3%;">
			       <div class="col-md-3" style="margin-top: 3%; border: solid 0px red;"></div> <!-- 이부분은 칸 조정할려고 넣어놨어요ㅠㅠ -->
			       <div class="col-md-2" style="margin-top: 3%; padding-left:6%; padding-bottom:5%; border: solid 0px blue;">
			           <label for="phone">핸드폰번호</label>
			       </div>
			       <div class="col-md-3">
			           <input type="text" id="phone" name="phone" class="form-control" placeholder="Phone">
			       </div>
		       </div>
		       <div class="form-group">
			   </div>  		               
		       <div class="row" style="margin-bottom: 2%">
		          <div class="col-md-12" style="margin-top: 1%; margin-left: 43%;" >
		          	<button class="btn" id="btnIdFind"><span style="font-size: 9pt;">아이디 찾기</span></button>
		          </div>
		       </div>
		    </form>
	  	</c:if>   
	  	
	   <c:if test="${requestScope.method eq 'POST'}">
		   	<form name="idFindFrm" method="POST" class="colorlib-form">    
		       <div class="form-group" style="margin-top: 3%;">
		         <div class="col-md-4" style="margin-top: 3%;"></div> <!-- 이부분은 칸 조정할려고 넣어놨어요ㅠㅠ -->
		       	 <div class="col-md-1" style="margin-top: 3%;"> 
		         </div>
		          <div class="col-md-3">
		         </div>
		       </div>
		       
		       <div class="form-group" style="margin-bottom: 3%;">
			       <div class="col-md-3" style="margin-top: 3%; border: solid 0px red;"></div> <!-- 이부분은 칸 조정할려고 넣어놨어요ㅠㅠ -->
			       <div class="col-md-2" style="margin-top: 3%; padding-left:6%; padding-bottom:5%; border: solid 0px blue;">
			       </div>
			       <div class="col-md-3">
			        <span>아이디는 ${userid} 입니다.</span>
			        </div>
		       </div>
		       <div class="form-group">
			   </div>  		               
		       <div class="row" style="margin-bottom: 2%">
		          <div class="col-md-12" style="margin-top: 1%; margin-left: 43%;" >
		          </div>
		       </div>
		    </form>
	    </c:if>   
	  
     </div>
   </div>
</div>

<div class="gototop js-top">
   <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>

<jsp:include page="../footer.jsp" />