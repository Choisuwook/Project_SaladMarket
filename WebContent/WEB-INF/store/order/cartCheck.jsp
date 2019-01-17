<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="member.model.*" %>    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
	#div_findResult {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;		
		position: relative;
	}
	
	#div_btnFind {
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
</style>

<script type="text/javascript">
	
	$(document).ready(function(){
			
		$("#btnYes").click(function(){
			var frm = document.cartFrm;
			frm.method = "POST";
			frm.action = "jumun.do";
			frm.submit();
		});
		
		$("#btnNo").click(function(){
			window.close();
		});
		
		
			var method = "${method}";
			var userid = "${userid}";
			var email = "${email}";
			var n = "${n}";
/* 			
			if(method=="POST" && userid != "" && email != "") {
				$("#userid").val(userid);
				$("#email").val(email);
			}
			
			if(method=="POST" && n==1) {
				$("#div_btnFind").hide();
			}
			else if(method=="POST" && (n == -1 || n == 0)) {
				$("#div_btnFind").show();
			} */


		$("#btnConfirmCode").click(function(){
				var frm  = document.verifyCertificationFrm;
				frm.userid.value = $("#userid").val();
				frm.userCertificationCode.value = $("#input_confirmCode").val();
				frm.action = "<%= CtxPath %>/verifyCertification.do";
				frm.method = "POST";
				frm.submit();
		});// end of 	$("#btnConfirmCode").click(function()

	});
</script>


<form name="cartFrm">
   <div id="div_userid" align="center">
      <span style="font-size: 12pt; margin: 20%;">${pacname} 을 장바구니에 담기 하겠습니가? </span><br/>
   </div>
   
   <div id="divbtn" align="center">
   	  <button type="button" class="btn btn-success" id="btnYes">예</button>
 	  <button type="button" class="btn btn-success" id="btnNo">아니오</button>
   </div>
   
</form>
<form name = "verifyCertificationFrm">
	<input type="hidden" name="userid" />
	<input type="hidden" name="userCertificationCode" />
</form>
    