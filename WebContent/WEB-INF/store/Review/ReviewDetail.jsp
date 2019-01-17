<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
<jsp:include page="../header.jsp" />

<style>

#btnEdit, #btnDel{
	border: none;
	width: 10%;
	margin-top: 5%;
	margin-left: 40%;
}

#btnDel{
	margin-left: 5%;

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
					<div class="col-md-9 col-md-offset-2">
						<div class="product-cart">
							<div class="col-md-3 text-center">
								<span>제목</span>
							</div>
							<div class="col-md-7 text-center">
								<span>제목 내용</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-3 text-center">
								<span>작성자</span>
							</div>
							<div class="col-md-7 text-center">
								<span>작성자내용</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-3 text-center">
								<span>작성날짜</span>
							</div>
							<div class="col-md-7 text-center">
								<span>작성날짜내용</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-3 text-center">
								<span>평점</span>
							</div>
							<div class="col-md-7 text-center">
								<span>평점내용</span>
							</div>
						</div>
						<div class="product-cart">
							<div class="col-md-3 text-center">
								<span>조회수</span>
							</div>
							<div class="col-md-7 text-center">
								<span>조회수내용</span>
							</div>
						</div>
						
						<div class="product-cart">
							<div class="col-md-offset-3 col-md-7 text-center" style="padding-top: 5%; padding-bottom: 5%;">
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							 글내용이 들어오는 자리입니다.<br/>
							</div>
						</div>
						
						
							<button type="button" id="btnEdit" class="btn btn-primary">수정</button>
							<button type="button" id="btnDel" class="btn btn-primary">삭제</button>
						
					</div>
				</div>
			</div>
		</div>

<jsp:include page="../footer.jsp" />