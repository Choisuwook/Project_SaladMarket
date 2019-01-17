<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div style="margin: 3%; border: 0px solid red;" align="center">
	<div style="width: 80%;margin: 0 auto;" align="center">
		<table style="width: 80%; border: 1px solid gray;">
			<tr height="100px;" style="">
				<td width="15%" style="font-size: 20pt; text-align: center; border: 1px solid gray;">
					<span id="name" class="name">전가현</span>
					<span style="font-size: 12pt">님</span><br>
					<span id="level" class="level" style="font-size: 12pt; font-weight: bold;" >골드</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">배송상품</span>
					<br>
					<span style="font-size: 17pt">0</span><span style="font-size: 13pt">개</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">보유쿠폰</span>
					<br>
					<span style="font-size: 17pt">0</span><span style="font-size: 13pt">개</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">보유포인트</span>
					<br>
					<span style="font-size: 17pt">0</span><span style="font-size: 13pt">개</span>
				</td>
			</tr>
		</table>
	</div>
</div>

<div style="" align="center">
	<div style="margin-top: 3%; margin-bottom: 1%;" align="center">
		<span style="font-weight: bold; font-size: 18pt; ">나의 리뷰 보기</span>
	</div>	
		<div class="colorlib-shop">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-12 ">
						<div class="product-name">
							<div class="one-forth text-center" style="width: 110px;">
								<span>상품</span>
							</div>
							<div class="one-forth text-center" style="width: 300px;">
								<span>작성자</span>
							</div>
							<div class="one-eight text-center" style="width: 300px; ">
								<span>리뷰내용</span>
							</div>
							<div class="one-eight text-center" >
								<span>조회수</span>
							</div>
							<div class="one-eight text-center" style="width: 260px;">
								<span>리뷰작성일자</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="one-forth" style="width: 110px; padding-left: 2%;">
								<div class="product-img" style="background-image: url(<%=ctxPath %>/store/images/item-8.jpg);">
                        		</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span id="userid" class="userid">rkgus3575</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span class="review">정말 감미로운 맛이었습니다. 신선하고...</span>
								</div>
							</div>
							<div class="one-eight text-center" style=" width: 120px;">
								<div class="display-tc">
									<span class="totalprice" id="totalprice">15만</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span class="reviewDate" id="reviewDate">2018-05-06</span>
								</div>
							</div>
						</div>
						<div class="product-cart">
							<div class="one-forth" style="width: 110px; padding-left: 2%;">
								<div class="product-img" style="background-image: url(<%=ctxPath %>/store/images/item-6.jpg);">
                        		</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span id="userid" class="userid">rkgus3575</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span class="review">양배추와 브로콜리의 조화가 마치...</span>
								</div>
							</div>
							<div class="one-eight text-center" style=" width: 120px;">
								<div class="display-tc">
									<span class="totalprice" id="totalprice">15만</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span class="reviewDate" id="reviewDate">2018-05-06</span>
								</div>
							</div>
						</div>
						<div class="product-cart">
							<div class="one-forth" style="width: 110px; padding-left: 2%;">
								<div class="product-img" style="background-image: url(<%=ctxPath %>/store/images/item-2.jpg);">
                        		</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span id="userid" class="userid">rkgus3575</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span class="review">소스의 산미가 인상깊었습니다. 그중 토마토가...</span>
								</div>
							</div>
							<div class="one-eight text-center" style=" width: 120px;">
								<div class="display-tc">
									<span class="totalprice" id="totalprice">15만</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 300px;">
								<div class="display-tc">
									<span class="reviewDate" id="reviewDate">2018-05-06</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<jsp:include page="../footer.jsp"/>