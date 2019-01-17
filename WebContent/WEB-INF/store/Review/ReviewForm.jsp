<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
<jsp:include page="../header.jsp" />

<style>

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

	<div id="colorlib-contact">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="contact-wrap">
						<h3>Review 작성하기</h3>
						<form action="#">
							<div class="row form-group">
								<div class="col-md-6 padding-bottom">
									<label for="fname">userid</label>
									<input type="text" id="fname" class="form-control" readonly/>
								</div>
								<div class="col-md-6">
									<label for="lname">성함</label>
									<input type="text" id="lname" class="form-control" readonly/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="subject">Subject</label>
									<input type="text" id="subject" class="form-control" placeholder="Your subject of this message">
								</div>
							</div>
							
							<div class="row form-group">
								<div class="col-md-12">
									<label for="subject">평점</label>
									<input type="text" id="grade" class="form-control" >
								</div>
							</div>
	
							<div class="row form-group">
								<div class="col-md-12">
									<label for="message">Message</label>
									<textarea name="message" id="message" cols="30" rows="10" class="form-control" placeholder="Say something about us"></textarea>
								</div>
							</div>
							
							<div class="row form-group">
								<div class="col-md-12">
									<label for="file">file</label>
									<input type="file" name="pimage1" class="infoData" />
								</div>
							</div>
							
							<div class="form-group text-center">
								<input type="submit" value="등록" class="btn btn-primary">
							</div>
						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




	<div id="colorlib-subscribe" style="margin-top: 3%;"></div><!-- 노란줄 -->
<jsp:include page="../footer.jsp" />