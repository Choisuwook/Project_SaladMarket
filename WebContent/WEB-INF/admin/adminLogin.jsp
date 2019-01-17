 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath();
%>   
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <link href="<%= ctxPath %>/assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <link href="<%= ctxPath %>/assets/demo/demo.css" rel="stylesheet" />
  <script src="<%= ctxPath %>/assets/js/core/jquery.min.js"></script>
  <script src="<%= ctxPath %>/assets/js/core/popper.min.js"></script>
  <script src="<%= ctxPath %>/assets/js/core/bootstrap.min.js"></script>
  <script src="<%= ctxPath %>/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <script src="<%= ctxPath %>/assets/js/plugins/chartjs.min.js"></script>
  <script src="<%= ctxPath %>/assets/js/plugins/bootstrap-notify.js"></script>
  <script src="<%= ctxPath %>/assets/js/black-dashboard.min.js?v=1.0.0"></script>
  <script src="<%= ctxPath %>/assets/demo/demo.js"></script>
  
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none; 
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin-top: 20%;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}


/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
</head>
<body>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
	  <form>
	    <div class="imgcontainer">
	      <img src="<%=ctxPath %>/img/main_textlogo.png"/>
	    </div>
	
	    <div class="container">
	      <label for="userid"><b>아이디</b></label>
	      <input type="text" placeholder="아이디를 입력하세요" name="userid" required>
	
	      <label for="pwd"><b>비밀번호</b></label>
	      <input type="password" placeholder="비밀번호를 입력하세요" name="pwd" required>
	        
	      <button type="button" class="btn">Login</button>
	      <label>
	        <input type="checkbox" checked="checked" name="remember"> 로그인 정보 저장
	      </label>
	    </div>
	
	    <div class="container">
	      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="btn btn-warning cancelbtn">Cancel</button>
	      <span class="psw"><a href="#">비밀번호 찾기</a></span>
	    </div>
	  </form>
	</div>
	<div class="col-md-4"></div>
</div>
<script>

</script>

</body>
</html>

