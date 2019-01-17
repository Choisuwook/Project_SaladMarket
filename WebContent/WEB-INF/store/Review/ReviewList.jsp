<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
<jsp:include page="../header.jsp" />

<style>

#search{
	float: right;

}

</style>

<aside id="colorlib-hero" class="breadcrumbs">
		<div class="flexslider">
			<ul class="slides">
		   	<li style="background-image: url(<%=CtxPath %>/store/images/cover-img-1.jpg);">
		   		<div class="overlay"></div>
		   		<div class="container-fluid">
		   			<div class="row">
			   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
			   				<div class="slider-text-inner text-center">
			   					<h1>Review</h1>
			   					<h2 class="bread"><span><a href="index.html">Home</a></span> <span>Review</span></h2>
			   				</div>
			   			</div>
			   		</div>
		   		</div>
		   	</li>
		  	</ul>
	  	</div>
	</aside>

		<div class="colorlib-shop">
			<div class="container"">
				<div class="row row-pb-md">
					<div class="col-md-10 col-md-offset-1">
						<div class="product-name">
							<div class="col-md-1 text-center">
								<span>글번호</span>
							</div>
							<div class="col-md-6 text-center">
								<span>제목</span>
							</div>
							<div class="col-md-1 text-center"> 
								<span>작성자</span>
							</div>
							<div class="col-md-2 text-center">
								<span>작성날짜</span>
							</div>
							<div class="col-md-1 text-center">
								<span>조회수</span>
							</div>
							<div class="col-md-1 text-center">
								<span>좋아요</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-1 text-center">
								<span>글번호</span>
							</div>
							<div class="col-md-6 text-center">
								<span>제목</span>
							</div>
							<div class="col-md-1 text-center"> 
								<span>작성자</span>
							</div>
							<div class="col-md-2 text-center">
								<span>작성날짜</span>
							</div>
							<div class="col-md-1 text-center">
								<span>조회수</span>
							</div>
							<div class="col-md-1 text-center">
								<span>좋아요</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-1 text-center">
								<span>글번호</span>
							</div>
							<div class="col-md-6 text-center">
								<span>제목</span>
							</div>
							<div class="col-md-1 text-center"> 
								<span>작성자</span>
							</div>
							<div class="col-md-2 text-center">
								<span>작성날짜</span>
							</div>
							<div class="col-md-1 text-center">
								<span>조회수</span>
							</div>
							<div class="col-md-1 text-center">
								<span>좋아요</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-1 text-center">
								<span>글번호</span>
							</div>
							<div class="col-md-6 text-center">
								<span>제목</span>
							</div>
							<div class="col-md-1 text-center"> 
								<span>작성자</span>
							</div>
							<div class="col-md-2 text-center">
								<span>작성날짜</span>
							</div>
							<div class="col-md-1 text-center">
								<span>조회수</span>
							</div>
							<div class="col-md-1 text-center">
								<span>좋아요</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-1 text-center">
								<span>글번호</span>
							</div>
							<div class="col-md-6 text-center">
								<span>제목</span>
							</div>
							<div class="col-md-1 text-center"> 
								<span>작성자</span>
							</div>
							<div class="col-md-2 text-center">
								<span>작성날짜</span>
							</div>
							<div class="col-md-1 text-center">
								<span>조회수</span>
							</div>
							<div class="col-md-1 text-center">
								<span>좋아요</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-1 text-center">
								<span>글번호</span>
							</div>
							<div class="col-md-6 text-center">
								<span>제목</span>
							</div>
							<div class="col-md-1 text-center"> 
								<span>작성자</span>
							</div>
							<div class="col-md-2 text-center">
								<span>작성날짜</span>
							</div>
							<div class="col-md-1 text-center">
								<span>조회수</span>
							</div>
							<div class="col-md-1 text-center">
								<span>좋아요</span>
							</div>
						</div>
						
						
							<span id="search">
								<select style="height: 30px; width: 70px; margin-top: 20%;">
									<option>옵션1</option>
									<option>옵션2</option>
									<option>옵션3</option>
								</select>
								<input type="text" size="25" style="height: 30px;"/>
								<button type="button">검색</button>
							</span>	
						
						
						
						</div>
					</div>
				</div>
			</div>
		</div>

<jsp:include page="../footer.jsp" />