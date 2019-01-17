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
<title>id 찾기</title>

<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />
<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
</script>

</head>
<body style="background-color: #fff0f5;">
  <span style="font-size: 10pt; font-weight: bold;"></span>
  		 <form name="frmIdcheck">
  		 	<table style="width: 95%; height: 100px;">
  		 		<tr>
  		 			<td style="text-align: center;">
  		 				아이디는 ${userid} 입니다<br style="line-height: 200%;"/>
  		 				<br style="line-height: 300%;"/>
  		 			</td>
  		 		</tr>
  		 	</table>
  		 </form>
</body>
</html>


