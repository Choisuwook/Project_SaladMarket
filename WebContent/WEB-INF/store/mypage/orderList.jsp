<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<span id="name" class="name">${(sessionScope.loginUser).name}</span>
					<span style="font-size: 12pt">님</span><br>
					<span id="level" class="level" style="font-size: 12pt; font-weight: bold;" >
						<c:if test="${membervo.fk_lvnum == 1}" >bronze</c:if>
						<c:if test="${membervo.fk_lvnum == 2}" >silver</c:if>
						<c:if test="${membervo.fk_lvnum == 3}" >gold</c:if>
					</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">배송현황</span>
					<br>
					<span style="font-size: 17pt">0</span><span style="font-size: 13pt">개</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">보유쿠폰</span>
					<br>
					<span style="font-size: 17pt">${(sessionScope.loginUser).cpnumCount}</span><span style="font-size: 13pt">개</span>
				</td>
				<td width="25%" style="padding: 0 10pt;" align="center">
					<span style="font-weight: bold; font-size: 15pt;">Point</span>
					<br>
					<span style="font-size: 17pt">${(sessionScope.loginUser).point}</span><span style="font-size: 13pt">point</span>
				</td>
			</tr>
		</table>
	</div>
</div>

<div style="" align="center">
	<div style="margin-top: 3%; margin-bottom: 1%;" align="center">
		<span style="font-weight: bold; font-size: 18pt; ">주문내역보기</span>
	</div>	
	<div class="colorlib-shop">
         <div class="container">
            <div class="row row-pb-md">
               <div class="col-md-12">
               
                  <div class="product-name">
                     <div class="one-forth text-center" style="width: calc(100% - 780px);">
                        <span>결제상품목록</span>
                     </div>
                     <div class="one-eight text-center">
                        <span>가격</span>
                     </div>
                     <div class="one-eight text-center">
                        <span>수량</span>
                     </div>
                     <div class="one-eight text-center">
                        <span>총가격</span>
                     </div>
                     <div class="one-eight text-center">
                        <span>주문날짜</span>
                     </div>
                     <div class="one-eight text-center">
                        <span>배송상태</span>
                     </div>
                     <div class="one-eight text-center">
                        <span>취소/환불</span>
                     </div>
                  </div>
                  
                  <div class="product-cart">
                     <div class="one-forth" style="width: calc(100% - 780px);">
                        <div class="product-img" style="background-image: url(images/item-6.jpg);">
                        </div>
                        <div class="display-tc">
                           <h3>Product Name</h3>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="price">$68.00</span>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <input type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="price">$120.00</span>
                        </div>
                     </div>   
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="">2018.06.19</span>
                        </div>
                     </div>   
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="order">배송완료</span>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <a href="#" class="">취소</a>/
                           <a href="#" class="">환불</a>
                        </div>
                     </div>
                  </div>
                  
                  
                  
                  <div class="product-cart">
                     <div class="one-forth" style="width: calc(100% - 780px);">
                        <div class="product-img" style="background-image: url(images/item-7.jpg);">
                        </div>
                        <div class="display-tc">
                           <h3>Product Name</h3>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="price">$68.00</span>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <form action="#">
                              <input type="text" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                           </form>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="price">$120.00</span>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="">2018.01.10</span>
                        </div>
                     </div>   
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="order">배송완료</span>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <a href="#" class="">취소</a>/
                           <a href="#" class="">환불</a>
                        </div>
                     </div>
                  </div>
                  
                  
                  <div class="product-cart">
                     <div class="one-forth" style="width: calc(100% - 780px);">
                        <div class="product-img" style="background-image: url(images/item-8.jpg);">
                        </div>
                        <div class="display-tc">
                           <h3>Product Name</h3>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="price">$68.00</span>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <input type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="price">$120.00</span>
                        </div>
                     </div>   
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="">2018.03.23</span>
                        </div>
                     </div>   
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <span class="order">배송완료</span>
                        </div>
                     </div>
                     <div class="one-eight text-center">
                        <div class="display-tc">
                           <a href="#" class="">취소</a>/
                           <a href="#" class="">환불</a>
                        </div>
                     </div>
                  </div>
                  
               </div>
            </div>
            
            
            
         </div>
      </div>

      <div class="colorlib-shop">
         <div class="container">
            <div class="row">
               <div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
                  <h2><span>Recommended Products</span></h2>
                  <p>We love to tell our successful far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
               </div>
            </div>
            <div class="row">
               <div class="col-md-3 text-center">
                  <div class="product-entry">
                     <div class="product-img" style="background-image: url(images/item-5.jpg);">
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
                     <div class="product-img" style="background-image: url(images/item-6.jpg);">
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
                     <div class="product-img" style="background-image: url(images/item-7.jpg);">
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
                     <div class="product-img" style="background-image: url(images/item-8.jpg);">
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
</div>
<jsp:include page="../footer.jsp"/>