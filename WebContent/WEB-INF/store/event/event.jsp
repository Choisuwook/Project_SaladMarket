<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<% String CtxPath = request.getContextPath(); %>
<jsp:include page="../header.jsp" />

<aside id="colorlib-hero" class="breadcrumbs">
	<div class="flexslider">
		<ul class="slides">
			<li
				style="background-image: url(<%= CtxPath %>/store/images/PFPI-WEBSITE-SLIDERS-1.png);">
				<div class="overlay"></div>
				<div class="container-fluid">
					<div class="row">
						<div
							class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
							<div class="slider-text-inner text-center">
								<h1>이벤트 목록</h1>
								<h2 class="bread">
									<span><a href="<%= CtxPath %>/index.do">Home</a></span>
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
	<h2>이벤트 목록</h2>

	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>이벤트명</th>
				</tr>
			</thead>
		</table>
	</div>
	<%-- 이벤트 리스트  --%>
	<div align="center">
	<c:forEach var="event" items="${eventList}">
		<c:if test="${event.etnum != 4}">
		<%-- 이벤트 1 --%>
		<div style="margin-bottom: 10px;">
			<%-- 이벤트 넘어가는 주소 넣는 곳 --%> <span> <a href="eventDetail.do?etnum=${event.etnum}&etname=${event.etname}">
			<img src="<%= CtxPath %>/store/images/index/${event.etimagefilename}"
					width="70%" height="20%" /></a>
			</span>
		</div>
		</c:if>
	</c:forEach>
	</div>
	<%-- 이벤트 리스트 끝  --%>
</div>

<jsp:include page="../footer.jsp" />