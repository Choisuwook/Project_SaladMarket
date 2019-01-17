<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>

<style>
.tab button {
	    background-color: inherit;
	    float: center;
	    border: none;
	    outline: none;
	    cursor: pointer;
	    padding: 14px 16px;
	    transition: 0.3s;
	    font-size: 17px;
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
	    /*background-color: #ddd;*/
	    border-bottom: 5px solid #FFC300;
	}
	
	/* Create an active/current tablink class */
	.tab button.active {
	     border-bottom: 5px solid #FFC300;
	}
	
	/* Style the tab content */
	.tabcontent {
	    display: none;
	    padding: 6px 12px;
	    border: 0px solid #ccc;
	    border-top: none;
	}


</style>

<script type="text/javascript">
/*    
	function openCity(evt, cityName) {
   var i, tabcontent, tablinks;
   tabcontent = document.getElementsByClassName("tabcontent");
   for (i = 0; i < tabcontent.length; i++) {
       tabcontent[i].style.display = "none";
   }
   tablinks = document.getElementsByClassName("tablinks");
   for (i = 0; i < tablinks.length; i++) {
       tablinks[i].className = tablinks[i].className.replace(" active", "");
   }
   document.getElementById(cityName).style.display = "block";
   evt.currentTarget.className += " active";
} */
/*    
   window.innerWidth */
   $(document).ready(function() {
		$("#cart").click(function () {			
			var pacname = $("#pacname").val();
			var url="cartCheck.do"			
			window.open(url, "cartCheck",
					    "left=20px, top=20px, width=300px, height=300px");
		});
	});	
	
	   function openCity(evt, cityName) {
       var i, tabcontent, tablinks;
       tabcontent = document.getElementsByClassName("tabcontent");
       for (i = 0; i < tabcontent.length; i++) {
           tabcontent[i].style.display = "none";
       }
       tablinks = document.getElementsByClassName("tablinks");
       for (i = 0; i < tablinks.length; i++) {
           tablinks[i].className = tablinks[i].className.replace(" active", "");
       }
       document.getElementById(cityName).style.display = "block";
       evt.currentTarget.className += " active";
	}

</script>

<aside id="colorlib-hero" class="breadcrumbs">
	<div class="flexslider">
		<ul class="slides">
	   	<li style="background-image: url(<%=CtxPath %>/store/images/cover-img-1.jpg);">
	   		<div class="overlay"></div>
	   		<div class="container-fluid">
	   			<div class="row">
		   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
		   				<div class="slider-text-inner text-center">
		   					<h1>Shop</h1>
		   					<h2 class="bread">
			   					<span style="font-size: 13pt;"><a href="#">Home</a></span>
			   					<span style="font-size: 13pt;">ProductList</span>
		   					</h2>
		   				</div>
		   			</div>
		   		</div>
	   		</div>
	   	</li>
	  	</ul>
  	</div>
</aside>
<div style="overflow: hidden; width: 100%; border-bottom: 0px solid #b7b7b7; padding-bottom: 50px;">

<%-- 스펙태그 시작 --%>
 <form name="specTag">
	   <div align="center" style=" margin-top: 50px;">
	      <div style="width: 70%;"> 
     			<div class="tab" style="margin-bottom: 50px;">각 태그별 상품 이미지는 8개씩!!!!
			        <button class="tablinks active" onclick="openCity(event, 'BEST')">BEST</button>
			        <button class="tablinks" onclick="openCity(event, 'HIT')">HIT</button>
			        <button class="tablinks" onclick="openCity(event, 'NEW')">NEW</button>
				</div> 
				<div id="BEST" class="tabcontent" style="display: block;">
					<div id="page">
						<div class="colorlib-shop">
							<div class="row">			
							<span>${SpecList.pacname}</span>
             			            			
	             			</div>
	         			</div>
	      			</div>
	   			</div><!-- Best Product -->
			</div>
		</div> <%-- 스펙태그  끝 --%>
	</form>
</div> <!-- horizontal -->
<!-- Navbar Area-->

<div class="classy-nav-container breakpoint-off">
	<div class="container">
		<!-- Menu -->
		<nav class="classy-navbar" id="foodeNav">
			<!-- Navbar Toggler -->
			<div class="classy-navbar-toggler">
				<span class="navbarToggler"><span></span><span></span><span></span></span>
			</div>
		
			<!-- Nav Start -->
			<div class="classynav">
				<div class="search-form" >
					<form action="#" method="get">
						<ul style="margin: 0 auto;">													
							</li>
							
							<li style="float: right;">
								<div class="dropdown">
									<button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="border-radius: 0; height: 50px; background-color: #FFC300;">정렬<span class="caret"></span></button>
									<ul class="dropdown-menu">
										<li><a href="#">이름순</a></li>
										<li><a href="#">인기순</a></li>
										<li><a href="#">신상품순</a></li>
										<li><a href="#">가격순</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</form>
				</div>
			</div>
		</nav>
	</div>
</div><!-- 검색창 -->

<!-- 상품 List  -->
<form name="listFrm">
<div align="center" class=" col-md-offset-2 col-md-8" style="margin-top: 50px; display: block;">
    <div id="page">
         <div class="colorlib-shop">
            <div class="row">
               <c:forEach var="productPack" items="${packageList}">
	               <div class="col-md-3 text-center">               
	                  <div class="product-entry">
	                     <div class="product-img" style="background-image: url(<%=CtxPath%>/img/${productPack.pacimage});">
	                     	<input id="pacname" type="hidden" value="${productPack.pacname}"/>
	                        <p class="tag"><span class="sale">${productPack.fk_stname}</span></p><!-- sale이라는 클래스가 디자인이 걸려 있어서 그냥 클래스는 sale로 할께요 -->
	                      	  <div class="cart">
	                           <p>
	                              <span class="addtocart" id="cart" style="cursor: pointer;"><a><i class="icon-shopping-cart"></i></a></span><!-- <a href="cartCheck.do"></a> -->  
	                              <span><a href="product-detail.do" ><i class="icon-eye"></i></a></span> 
	                              <span><a href="product-detail.do?pacnum=3"><i class="icon-heart3"></i></a></span>
	                              <span><a href="add-to-wishlist.do"><i class="icon-bar-chart"></i></a></span>
	                           </p>
	                        </div> 
	                     </div>
	                     <div class="desc">
	                         <h3><a href="product-detail.do?pacnum="+${productPack.pacnum}>${productPack.pacname}</a></h3> 
	                        <p class="price"><span class="sale">${productPack.price}원</span><br/>
	                        <span>${productPack.saleprice}원</span> </p>
	                     </div> 
	                  </div>
	               </div>
               </c:forEach>

            </div>
         </div>
      </div>
</div>
</form>
<jsp:include page="../footer.jsp"/>