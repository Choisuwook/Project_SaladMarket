<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% String ctxPath = request.getContextPath(); %>     
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
				   					<h1>Checkout</h1>
				   					<h2 class="bread"><span><a href="index.html">Home</a></span> <span><a href="cart.html">Shopping Cart</a></span> <span>Checkout</span></h2>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
	<div class="colorlib-loader"></div>

	<div id="page">
		

<!--  구매 진행 상황  카트 - 결제 -주문완료  배너? -->
		<div class="colorlib-shop">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-10 col-md-offset-1">
						<div class="process-wrap">
							<div class="process text-center active">
								<p><span>01</span></p>
								<h3>Shopping Cart</h3>
							</div>
							<div class="process text-center active">
								<p><span>02</span></p>
								<h3>Checkout</h3>
							</div>
							<div class="process text-center">
								<p><span>03</span></p>
								<h3>Order Complete</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<form method="post" class="colorlib-form">
							<h2>결제 상세 </h2>
		              	<div class="row">
			               <div class="col-md-12">
			                  <div class="form-group">
			                  	<label for="country"> 주문번호 </label>
			                     <div class="form-field">
			                
			                        <input type="text" id="odrcode" class="form-control" placeholder="s-20181128-3">
			                     </div>
			                  </div>
			               </div>
			               <div class="form-group">
									<div class="col-md-6">
										<label for="fname">이름</label>
										<input type="text" id="fname" class="form-control" placeholder="홍길동">
									</div>
									
								</div>
								<div class="col-md-12">
								
			               </div>
			               <div class="col-md-12">
			                   <div class="form-group">
			                        <div class="col-md-6" style="padding:0;">
										<label for="fname" >우편번호</label>
										<input type="text" id="zippostalcode" class="form-control" placeholder="123-456">
									</div>
							   </div>
									<div class="form-group">
									
										<label for="fname">주소</label>
			                    	<input type="text" id="address" class="form-control" placeholder="서울 특별시 종로구 ">
			                  		</div>
			                  <div class="form-group">
			                    	<input type="text" id="address2" class="form-control" placeholder="다동 ">
			                  </div>
			               </div>
			              
								<div class="form-group">
									<div class="col-md-6">
										<label for="email">이메일 주소</label>
										<input type="text" id="email" class="form-control" placeholder="abc@naver.com">
									</div>
									<div class="col-md-6">
										<label for="Phone">전화번호</label>
										<input type="text" id="zippostalcode" class="form-control" placeholder="010-1234-5678">
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
									
									</div>
								</div>
		              </div>
		            </form>
					</div>
					<div class="col-md-5">
						<div class="cart-detail">
							<h2>장바구니</h2>
							<ul>
								<li>
									<span>Subtotal</span> <span>$100.00</span>
									<ul>
										<li><span>1 x Product Name</span> <span>$99.00</span></li>
										<li><span>1 x Product Name</span> <span>$78.00</span></li>
									</ul>
								</li>
								<li><span>배송료</span> <span>$0.00</span></li>
								<li><span>주문합계</span> <span>$180.00</span></li>
							</ul>
						</div>
						<div class="cart-detail">
							<h2>결제 방법</h2>
							<div class="form-group">
								<div class="col-md-12">
									<div class="radio">
									   <label><input type="radio" name="optradio">계좌이체</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="radio">
									   <label><input type="radio" name="optradio">체크카드</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="radio">
									   <label><input type="radio" name="optradio">무통장 입금</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="checkbox">
									   <label><input type="checkbox" value="">위 주문 사항에 대하여 확인하였습니다.</label>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<p><a href="#" class="btn btn-primary">주문하기</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		


		</div> 

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	</script>


<jsp:include page="../footer.jsp"/>