<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<% String CtxPath = request.getContextPath(); %>
<jsp:include page="../header.jsp" />

<aside id="colorlib-hero" class="breadcrumbs">
	<div class="flexslider">
		<ul class="slides">
			<li
				style="background-image: url(<%= CtxPath %>/store/images/cover-img-1.jpg);">
				<div class="overlay"></div>
				<div class="container-fluid">
					<div class="row">
						<div
							class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
							<div class="slider-text-inner text-center">
								<h1>Search List</h1>
								<h2 class="bread">
									<span><a href="index.jsp">Home</a></span>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
</aside>

<div class="container">
	<h4>${search}에 대한 검색 결과 입니다.</h4>

	<div align="center" id="searchList">
			상품리스트 나오는 곳
	</div>
	<%-- 이벤트 리스트 끝  --%>
</div>

<jsp:include page="../footer.jsp" />