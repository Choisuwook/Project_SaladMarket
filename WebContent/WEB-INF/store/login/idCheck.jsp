<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String method = request.getMethod();
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 ID 검사하기</title>

<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />
<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){		
		$("#error").hide();		
	});// end of $(document).ready()--------------

	function goCheck() {		
		var userid = $("#userid").val().trim();		
		if(userid == "") {
			$("#error").show();			
			$("#userid").val("");
			$("#userid").focus();
			return;
		}
		else {
			$("#error").hide();			
			var frm = document.frmIdcheck;
			frm.method = "POST";
			frm.action = "idDuplicateCheck.do";
			frm.submit();
		}
	}
	// ** !!!!! 팝업창에서 부모창으로 값 넘기기 jQuery를 사용한 방법 !!!!! **// 
	function setUserID(userid) {
		
		$("#userid", opener.document).val(userid);
	//  또는
	   // $(opener.document).find("#userid").val(userid);
		
		$("#pwd", opener.document).focus();
	//  또는
	//    $(opener.document).find("#pwd").focus();
		
		self.close();
		// 여기서 self 는 팝업창 자기자신을 말한다.
		// 지금의 self 는 idcheck.jsp 페이지 이다.
		
	} // end of setUserID(userid)----------------
	

	</script>

</head>
<body style="background-color: #fff0f5;">
  <span style="font-size: 10pt; font-weight: bold;"></span>
<c:if test="${requestScope.method == 'GET' }">	 
  		 <form name="frmIdcheck">
  		 	<table style="width: 95%; height: 100px;">
  		 		<tr>
  		 			<td style="text-align: center;">
  		 				아이디를 입력하세요<br style="line-height: 200%;"/>
  		 				<input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/>
  		 				<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!!</span><br/> 
  		 				<button type="button" class="box" onClick="goCheck();">확인</button> 
  		 			</td>
  		 		</tr>
  		 	</table>
  		 </form>
 </c:if>	
<c:if test="${requestScope.method == 'POST'}">	 

  		<c:if test="${requestScope.flag == true}">
  		 	 <div align="center">
  			 	<br style="line-height: 400%;" />
  			 	ID로[ <span style="color: red; font-weight: bold;">${requestScope.userid}</span> ] 사용가능합니다.
  			 	<br/><br/><br/>
  			 	<button type="button" class="box" onClick="setUserID('${requestScope.userid}');">닫기</button>
  			 </div>
  
		</c:if>
		<c:if test="${requestScope.flag == false}">	 			
	  			<div align="center">
				 	[<span style="color: red; font-weight: bold;">${requestScope.userid}</span>] 는 이미 사용중입니다.
				 	<br/>
				 	<form name="frmIdcheck">
			  		 	<table style="width: 95%; height: 100px;">
			  		 		<tr>
			  		 			<td style="text-align: center; border: solid 1px red;" >
			  		 				아이디를 입력하세요<br/>
  		 							<span>하하하</span></span><input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/>
  		 							<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!!</span><br/> 
  		 							<button type="button" class="box" onClick="goCheck();">확인</button>
			  		 			</td>
			  		 		</tr>
			  		 	</table>
			  		 </form>
				 </div>
		 </c:if>
</c:if>
<%-- 		<c:if test="${requestScope.flag == false}">	 			
	  			<div align="center">
				 	[<span style="color: red; font-weight: bold;">${requestScope.userid}</span>] 는 이미 사용중입니다.
				 	<br/>
				 	<form name="frmIdcheck">
			  		 	<table style="width: 95%; height: 100px;">
			  		 		<tr>
			  		 			<td style="text-align: center;">
			  		 				<input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/>
			  		 				<button type="button" class="box" onClick="goCheck();">확인</button> 
			  		 				<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!!</span><br/> 			  		 				
			  		 			</td>
			  		 		</tr>
			  		 	</table>
			  		 </form>
				 </div>
		 </c:if> --%>
</body>
</html>


