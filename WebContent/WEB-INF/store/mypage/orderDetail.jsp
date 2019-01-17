<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath=request.getContextPath(); %>
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
<div id="colorlib-contact">
	<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="contact-wrap">
						<h4 align="center">이지예님의 ...상품 결제 내역</h4>
						<form action="#">
							<table class="table" style="margin-top:50px;">
							    <tbody>
									<tr>
										<th style="padding-left: 50px;"> 주문자명 </th>
										<td > 이지예님 </td>
									</tr>
									<tr>
										<th style="padding-left: 50px;"> 주문번호 </th>
										<td > 20182054124 </td>
									</tr>
									<tr>
										<th style="padding-left: 50px;"> 주문상품 </th>
										<td> 남성의류상의 </td>
									</tr>
									<tr>
										<th style="padding-left: 50px;"> 주문금액 </th>
										<td > 250,000원 </td>
									</tr>
									<tr>
										<th style="padding-left: 50px;"> 할인금액 </th>
										<td> 50,000원 </td>
									</tr>
									<tr>
										<th style="padding-left: 50px;"> 결제금액 </th>
										<td > 200,000원 </td>
									</tr>
									<tr>
										<th style="padding-left: 50px;"> 포인트적립혜택 </th>
										<td > 200 point </td>
									</tr>
								</tbody>
							</table>
						
							<div class="text-center" style="padding-top:50px;">
								<p>
									<a href="index.html"class="btn btn-primary">Home</a>
									<a href="shop.html"class="btn btn-primary btn-outline">Continue Shopping</a>
								</p>
							</div>
						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp"/>