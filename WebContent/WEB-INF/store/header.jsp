<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String CtxPath = request.getContextPath(); %>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Store Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	<!-- jQuery -->
	<script src="<%=CtxPath %>/store/js/jquery.min.js"></script>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="<%=CtxPath %>/store/fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="<%=CtxPath %>/store/css/style.css">

	<!-- Modernizr JS -->
	<script src="<%=CtxPath %>/store/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<<<<<<< HEAD
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#Submit").click(function() {
			goSearch();
			
		});
	});
	
	function goSearch(){
		var search= $("#search").val();

		var frm = document.searchFrm;
		frm.search.value=search;
		frm.method="GET";
		frm.action="productSearch.do?search="+search;
		frm.submit();
	}
</script>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
<%-- 						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="index.html"><img src="<%=CtxPath %>/store/images/index/logo.png" width="110%" height="110%"></a></div>
						</div> --%>
						<div class="col-xs-10 text-right menu-1">
							<ul>							 
								<li class="active"><a href="index.do">Home</a></li>													
								<c:if test="${(sessionScope.loginUser).userid == null}">
									<li><a href="login.do">로그인</a></li>																	
									<li><a href="join.do">회원가입</a></li>
								</c:if>
								<c:if test="${(sessionScope.loginUser).userid != null}">
									<li>${(sessionScope.loginUser).name}님 환영합니다!</li>
									<li><a href="logout.do">로그아웃</a></li>	
									<li><a href=""></a></li>
									<li class="has-dropdown">
										<a href="">마이페이지</a>
										<ul class="dropdown">
											<li><a href="memberInfomain.do?userid=${(sessionScope.loginUser).userid}">회원정보</a></li>
											<li><a href="cuponList.do">할인쿠폰</a></li>
											<li><a href="">환불교환</a></li>
											<li><a href="">주문내역</a></li>
											<li><a href="orderList.do?userid=${(sessionScope.loginUser).userid}">장바구니</a></li>
											<li><a href="">찜</a></li>
										</ul>
									</li>
								</c:if>
								<li class="has-dropdown">
									<a href="#">샐러드</a>
									<ul class="dropdown">
										<li><a href="productList.do?sdname=시리얼">시리얼</a></li>
										<li><a href="productList.do?sdname=샐러드도시락">샐러드</a></li>
										<li><a href="productList.do?sdname=죽/스프">죽/스프</a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="">디톡스</a>
									<ul class="dropdown">
										<li><a href="productList.do?sdname=물/주스">물/주스</a></li>
										<li><a href="productList.do?sdname=건강즙">건강즙</a></li>
										<li><a href="productList.do?sdname=건강차">건강차></a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="">DIY</a>
									<ul class="dropdown">
										<li><a href="productList.do?sdname=야채/곡류">야채/곡류</a></li>
										<li><a href="productList.do?sdname=과일">과일</a></li>
										<li><a href="productList.do?sdname=고기/달걀">고기/달걀</a></li>
										<li><a href="productList.do?sdname=생선">생선</a></li>
										<li><a href="productList.do?sdname=소스">소스</a></li>
										<li><a href="productList.do?sdname=유제품">유제품</a></li>
									</ul>
								</li>
								<li><a href="event.do">EVENT</a></li>
								<li><a href=""><i class="icon-shopping-cart"></i> Cart [0]</a></li>
							</ul>
						</div><!--  -->
						             
                  <div style="margin-top: 5%;">
                     <div class="classynav">
                        <div class="col-xs-2">
                           <div id="colorlib-logo">
                              <a href="<%=CtxPath %>/index.do">
                                 <img src="<%=CtxPath %>/store/images/index/logo.png" width="110%" height="110%">
                              </a>
                           </div>
                        </div>
                        <div class="search_form">
                           <form name="searchFrm">
                              <ul style="margin: 0 auto; float: right;">
                                 <li style="float: left;">
                                    <input type="search" id="search" placeholder="검색할 상품명을 입력하세요" style="border: 2px solid #b7b7b7; border-radius: 0; width: 300px; height: 50px; font-size: 15px; position: relative; top: 30%;" >
                                 	
                                 </li>
                                 
                                 <li style="float: left;">
                                    <button type="submit" id="Submit" value="Submit" style="height: 50px; border: none;">
                                       <img src="<%=CtxPath%>/store/images/search.png" style="width:20px; height:20px;">
                                    </button>
                                 </li>                                 
=======
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
<%-- 						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="index.html"><img src="<%=CtxPath %>/store/images/index/logo.png" width="110%" height="110%"></a></div>
						</div> --%>
						<div class="col-xs-10 text-right menu-1">
							<ul>							 
								<li class="active"><a href="index.do">Home</a></li>													
								<c:if test="${(sessionScope.loginUser).userid == null}">
									<li><a href="login.do">로그인</a></li>																	
									<li><a href="join.do">회원가입</a></li>
								</c:if>
								<c:if test="${(sessionScope.loginUser).userid != null}">
									<li>${(sessionScope.loginUser).name}님 환영합니다!</li>
									<li><a href="logout.do">로그아웃</a></li>	
									<li><a href=""></a></li>
									<li class="has-dropdown">
										<a href="">마이페이지</a>
										<ul class="dropdown">
											<li><a href="memberInfomain.do?userid=${(sessionScope.loginUser).userid}">회원정보</a></li>
											<li><a href="cuponList.do">할인쿠폰</a></li>
											<li><a href="">환불교환</a></li>
											<li><a href="">주문내역</a></li>
											<li><a href="orderList.do?userid=${(sessionScope.loginUser).userid}">장바구니</a></li>
											<li><a href="">찜</a></li>
										</ul>
									</li>
								</c:if>
								<li class="has-dropdown">
									<a href="#">샐러드</a>
									<ul class="dropdown">
										<li><a href="productList.do?sdname=시리얼">시리얼</a></li>
										<li><a href="productList.do?sdname=샐러드도시락">샐러드</a></li>
										<li><a href="productList.do?sdname=죽/스프">죽/스프</a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="">디톡스</a>
									<ul class="dropdown">
										<li><a href="productList.do?sdname=물/주스">물/주스</a></li>
										<li><a href="productList.do?sdname=건강즙">건강즙</a></li>
										<li><a href="productList.do?sdname=건강차">건강차></a></li>
									</ul>
								</li>
								<li class="has-dropdown">
									<a href="">DIY</a>
									<ul class="dropdown">
										<li><a href="productList.do?sdname=야채/곡류">야채/곡류</a></li>
										<li><a href="productList.do?sdname=과일">과일</a></li>
										<li><a href="productList.do?sdname=고기/달걀">고기/달걀</a></li>
										<li><a href="productList.do?sdname=생선">생선</a></li>
										<li><a href="productList.do?sdname=소스">소스</a></li>
										<li><a href="productList.do?sdname=유제품">유제품</a></li>
									</ul>
								</li>
								<li><a href="event.do">EVENT</a></li>
								<li><a href=""><i class="icon-shopping-cart"></i> Cart [0]</a></li>
							</ul>
						</div><!--  -->
						             
                  <div style="margin-top: 5%;">
                     <div class="classynav">
                        <div class="col-xs-2">
                           <div id="colorlib-logo">
                              <a href="<%=CtxPath %>/index.do">
                                 <img src="<%=CtxPath %>/store/images/index/logo.png" width="110%" height="110%">
                              </a>
                           </div>
                        </div>
                        <div class="search-form">
                           <form action="#" method="get">
                              <ul style="margin: 0 auto; float: right;">
                                 <li style="float: left;">
                                    <input type="search" placeholder="검색할 상품명을 입력하세요" style="border: 2px solid #b7b7b7; border-radius: 0; width: 300px; height: 50px; font-size: 15px; position: relative; top: 30%;" >
                                 </li>
                                 
                                 <li style="float: left;">
                                    <button type="submit" value="Submit" style="height: 50px; border: none;">
                                       <img src="<%=CtxPath%>/store/images/search.png" style="width:20px; height:20px;"alt="">
                                    </button>
                                 </li>
                                 
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git
                              </ul>
                           </form>
                        </div>
                     </div>
                  </div>	
					</div>
				</div>
			</div>
		</nav>
	<div class="contatin">