<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String ctxPath = request.getContextPath(); %> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 <jsp:include page="../header.jsp"/>

   <script type="text/javascript">
	$(document).ready(function() {
		$("#option").change(function () {
			var pnum = $(this).val();			
			var html = "<tr>"
	               +"<th style='width: 400px; height:35px border: 1px solid red;>단품골라담기 /</th>"
	               +"<td style='width: 400px; height:35px;'>"+$("#option"+pnum).html()
	               +"<input type='number' id='option"+pnum+"' name='oqty' value='1' max='100' min='1' style='width: 50px; height: 30px;'/></td>"
	               +"</tr> ";
	               $("#addList").append(html);
		
		});
		
		
		  
	});// end of $(document).ready(function()	

   </script>

	<aside id="colorlib-hero" class="breadcrumbs">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(<%=ctxPath %>/store/images/cover-img-1.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>Product Detail</h1>
				   					<h2 class="bread"><span><a href="index.html">Home</a></span> <span><a href="shop.html">Product</a></span> <span>Product Detail</span></h2>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
    <%-- 여기서부터 --%>
   <div class="colorlib-shop">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-md-10 col-md-offset-1">
						<div class="product-detail-wrap">
							<div class="row">
								<div class="col-md-5">
									<div class="product-entry">
									<!-- 상품 대표이미지 -->
										<c:if test="${pacnum!= 1}">
										   <div class="product-img" style="background-image: url(<%= ctxPath %>/img/${packageDetail.pacimage});"> 
											</div>
										</c:if>
										<c:if test="${pacnum == 1}">
										   <div class="product-img" style="background-image: url(<%= ctxPath %>/img/${packageDetail.pimgfilename});"> <!-- 상품 대표이미지 -->
											</div>
										</c:if>
									</div>
								</div>
								<div class="col-md-7">
									<div class="desc">


		     <div class="col-md-12">
				<div class="desc">
					<c:if test="${pacnum== 1}"><h3>${packageDetail.pname}</h3></c:if>
					<c:if test="${pacnum!= 1}"><h3>${packageDetail.pacname}</h3></c:if>	 	
						<div style="margin-top:5%; border: 1px solid red">
							<div class="row" style="border: 1px solid red">
								<div class="col-md-12" style="border: 1px solid blue">
									<div class="col-md-4" style="border: 1px solid blue">판매가</div>
									<div class="col-md-7"><fmt:formatNumber value="${packageDetail.saleprice}" pattern="###,###"></fmt:formatNumber>원</div>
								</div>
								<div class="col-md-12" style="border: 1px solid blue">
									   <div class="col-md-4" style="border: 1px solid blue">판매단위</div>
									   <div class="col-md-7">PK</div>
								   </div> 
								   <div class="col-md-12" style="border: 1px solid blue">
									   <div class="col-md-4" style="border: 1px solid blue">중량/용량</div>
									   <div class="col-md-7">${packageDetail.weight}</div>
								   </div> 
								   <div>
									   <th style="width: 100px; height:50px;">포장타입</th>
										<td >냉장/에코포장
											<span >택배배송은 에코포장이 스티로폼으로 대체됩니다.</span>
										</td>
									</div>	
									<div>
										<div style="width: 100px; height:50px;">알레르기 정보</div>
										<div >${packageDetail.allergy}</div>
									</div>
								<div>
									<div style="width: 100px; height:50px;">유통기한</div>
									<div>${packageDetail.pexpiredate}</div>
								</div>

											<%-- 상품선택 옵션 --%>
											<c:if test="${pacnum!= 1}">
											
												<tr>
													<th style="width: 80px; height:50px;"> 상품 선택</th>													
														<td>													
															<select name="addopt[]" label="단품골라담기" onchange="nsGodo_MultiOption(event);" id="option" >
																<option value="">==단품골라담기 선택==</option>																  
									 			 				<c:forEach var="productList" items="${packageDetailList}"> 
																	  <option id="option${productList.pnum}" name="${productList.pname}" value="${productList.pnum}">${productList.pname}</option>
																</c:forEach>  
															</select>														
														</td>
											    </tr>
										    </c:if>

										    <%-- 상품선택 옵션 --%>
<%-- 										    <c:if test="${packageDetail.pacname != '없음'}">
										 		<tr>
													<th style="width: 100px; height:50px;"> 상품 선택</th>													
														<td>													
															<input type="text" value="${indexPro.pname}" />
														</td>
											    </tr>
											   </c:if> --%>
										 <div>
											 <div>총 금액 </div>
											 <div> 0 원</div>
										 </div>
										 <div>
										 	<div id="addList" style="border: 1px solid blue;" width="600px;"></div>										 	
										 </div>
										 <c:if test="${pacnum == 1}">	
											 <div>
											 	<div>상품 갯수</div>
											 	<div><input id="qpty" name="pqty" type="number" style="width: 50px; height: 30px;"min="1" max="10" step="1" value="1" /></div>										 	
											 </div>	
										 </c:if>									 
										</div>
									</div>										
							<div class="row row-pb-sm" style="margin-top:20px;">
								 <div class="col-md-4">
                                    <div class="input-group"  > 
                                    <p ><a href="cart.do" class="btn btn-primary btn-addtocart"><i class="icon-shopping-cart"></i> Add to Cart</a></p>
                                 	</div>
                        		 </div>
							</div>

								</div>

			</div>


<%-- 					<ul style="list-style-type: none">
											<li><button type="button" class="btn btn-info" style="margin-right: 10px" onClick="goCart('${pvo.pnum}');">장바구니 담기</button>
							<button type="button" class="btn btn-warning" style="margin-right: 10px" onClick="goOrder('${pvo.pnum}');">바로주문하기</button>
						</li>
					</ul>
					<input type="hidden" name="pnum" value="${pvo.pnum}" />
					<input type="hidden" name="saleprice" value="${pvo.saleprice}" />
					<input type="hidden" name="sumtotalprice" />
					<input type="hidden" name="sumtotalpoint" />
					<input type="hidden" name="goBackURL" value="${goBackURL}" />  --%>
							</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="row">
							<div class="col-md-12 tabulation">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#description">상세 설명</a></li>
									<li><a data-toggle="tab" href="#manufacturer">생산자</a></li>
									<li><a data-toggle="tab" href="#review">리뷰</a></li>
								</ul>
								<div class="tab-content"> <!-- 상품 상세 설명 내용  -->
									<div id="description" class="tab-pane fade in active">
										<p>${pacontents}</p>
						         </div>
						         <!--  상품 생산자 설명  -->
						         <div id="manufacturer" class="tab-pane fade">
						         	<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
										<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>

								   </div>
								   <!--  리뷰  -->
								   <div id="review" class="tab-pane fade">
								   	<div class="row">
								   		<div class="col-md-7">
								   			<h3>23 Reviews</h3>
								   			<div class="review"> <!--background-image: 리뷰상품 이미지가 들어갑니다.  -->
										   		<div class="user-img" style="background-image: url(<%= ctxPath %>/store/images/person3.jpg);"></div>
										   		<div class="desc">
										   			<h4>
										   				<span class="text-left">Jacob Webb</span>
										   				<span class="text-right">14 March 2018</span>
										   			</h4>
										   			<p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-half"></i>
										   					<i class="icon-star-empty"></i>
									   					</span>
									   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
										   			</p>
										   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
										   		</div>
										   	</div>
										   	<div class="review">
										   		<div class="user-img" style="background-image: url(<%=ctxPath %>/store/images/person2.jpg);"></div>
										   		<div class="desc">
										   			<h4>
										   				<span class="text-left">Jacob Webb</span>
										   				<span class="text-right">14 March 2018</span>
										   			</h4>
										   			<p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-half"></i>
										   					<i class="icon-star-empty"></i>
									   					</span>
									   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
										   			</p>
										   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
										   		</div>
										   	</div>
										   	<div class="review">
										   		<div class="user-img" style="background-image: url(<%=ctxPath %>/store/images/person1.jpg);"></div>
										   		<div class="desc">
										   			<h4>
										   				<span class="text-left">Jacob Webb</span>
										   				<span class="text-right">14 March 2018</span>
										   			</h4>
										   			<p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-half"></i>
										   					<i class="icon-star-empty"></i>
									   					</span>
									   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
										   			</p>
										   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
										   		</div>
										   	</div>
								   		</div>
								   		<div class="col-md-4 col-md-push-1">
								   			<div class="rating-wrap">
									   			<h3>Give a Review</h3>
									   			<p class="star">
									   				<span>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					(98%)
								   					</span>
								   					<span>20 Reviews</span>
									   			</p>
									   			<p class="star">
									   				<span>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-empty"></i>
									   					(85%)
								   					</span>
								   					<span>10 Reviews</span>
									   			</p>
									   			<p class="star">
									   				<span>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-empty"></i>
									   					<i class="icon-star-empty"></i>
									   					(98%)
								   					</span>
								   					<span>5 Reviews</span>
									   			</p>
									   			<p class="star">
									   				<span>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-empty"></i>
									   					<i class="icon-star-empty"></i>
									   					<i class="icon-star-empty"></i>
									   					(98%)
								   					</span>
								   					<span>0 Reviews</span>
									   			</p>
									   			<p class="star">
									   				<span>
									   					<i class="icon-star-full"></i>
									   					<i class="icon-star-empty"></i>
									   					<i class="icon-star-empty"></i>
									   					<i class="icon-star-empty"></i>
									   					<i class="icon-star-empty"></i>
									   					(98%)
								   					</span>
								   					<span>0 Reviews</span>
									   			</p>
									   		</div>
								   		</div>
								   	</div>
								   </div>
					         </div>
				         </div>
						</div>
					</div>
				</div>
			</div>
		</div>


 <!--  추천 상품이 들어 갑니다.  -->
		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
						<h2><span>추천 상품!!</span></h2>
						<p>We love to tell our successful far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(<%=ctxPath %>/store/images/item-5.jpg);">
								<p class="tag"><span class="new">New</span></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="#"><i class="icon-shopping-cart"></i></a></span> 
										<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
										<span><a href="#"><i class="icon-heart3"></i></a></span>
										<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="shop.html">Floral Dress</a></h3>
								<p class="price"><span>$300.00</span></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(<%=ctxPath %>/store/images/item-6.jpg);">
								<p class="tag"><span class="new">New</span></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="#"><i class="icon-shopping-cart"></i></a></span> 
										<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
										<span><a href="#"><i class="icon-heart3"></i></a></span>
										<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="shop.html">Floral Dress</a></h3>
								<p class="price"><span>$300.00</span></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(<%=ctxPath %>/store/images/item-7.jpg);">
								<p class="tag"><span class="new">New</span></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="#"><i class="icon-shopping-cart"></i></a></span> 
										<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
										<span><a href="#"><i class="icon-heart3"></i></a></span>
										<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="shop.html">Floral Dress</a></h3>
								<p class="price"><span>$300.00</span></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(<%=ctxPath %>/store/images/item-8.jpg);">
								<p class="tag"><span class="new">New</span></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="#"><i class="icon-shopping-cart"></i></a></span> 
										<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
										<span><a href="#"><i class="icon-heart3"></i></a></span>
										<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="shop.html">Floral Dress</a></h3>
								<p class="price"><span>$300.00</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>





	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>





<jsp:include page="../footer.jsp"/> 