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

<script>
<<<<<<< HEAD
	$(document).ready(function(){	 
	
	// ==== BEST/NEW/HIT 의 상품보기 ==== 
		$(".tablinks").hover(function(evnet){	
			
		
			var form_data = {"stname":event.target.value,
							"sdname":"${sdname}"};
	    	//alert(event.target.value);
	    	
	    	 $.ajax({
	   		  url:"productListJSON.do",
	   		  type:"GET",
	   		  data:form_data,
	   		  dataType:"JSON",
	   		  success:function(json){
	   			  var html="";
	   			  if(json.length ==0){//상품이 하나도 없을 경우
	   				  html +="현재상품 준비중..."
	   				  $("#displayResultBEST").html(html);
	   			}
		   		 else{
		   			 $("#displayResultBEST").empty();
		   			$.each(json,function(entryIndex, entry){ 		   				
		   			
		   				html +=		
		   					 	 "<div class='col-md-3 text-center'>"+
		   						 "<div class='product-entry'>"+
		   						 "<div class='product-img' style='background-image: url(<%=CtxPath%>/img/"+entry.pacimage+")'>"+
		   						 "<p class='tag'><span class='sale'>"+entry.v_stname+"</span></p>"+		   						 
		   		                 "<div class='cart'>"+
		   		                 "<p>"+
		   		                 "          <span class='addtocart'><a href='cart.do'><i class='icon-shopping-cart'></i></a></span>"+ 
		   		                 "          <span><a href='product-detail.do'><i class='icon-eye'></i></a></span>"+
		   		                 "          <span><a href='#'><i class='icon-heart3'></i></a></span>"+
		   		                 "		   <span><a href='add-to-wishlist.do'><i class='icon-bar-chart'></i></a></span>"+
		   		                           "</p>"+
		   		                        "</div>"+
		               				"</div>"+
		   		                    "<div class='desc'>"+
		   		                 " <h3><a href='product-detail.do?pacnum="+entry.pacnum+"&pnum="+entry.pnum+"'>"+entry.pacname+"</a></h3>"+
		   		                       "<p class='price'><span>"+entry.saleprice+"</span></p>"+
		   		                    "</div>"+
		             				"</div>"+
		          				"</div>";       	
		          				
		   				  });//end of $.each(jsonmfunction(entryIndex, entry)					
		   				$("#displayResultBEST").append(html);
		   					   			
		   			  }// end of else

		   		  }, //end of success
	   		  error: function(request, status, error){
	   				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	   			}		   
	   	   });// end of ajax
	    });// end of $(".tablinks").click(function(evnet){

	// ==== BEST/NEW/HIT 의 상품보기 끝 ==== 
		
		// ** 정렬 순서로 상품 정렬하기 **//
		goListAline();
	
	  	$("#alineName").click(function() {	
	  		$("#proListOrder").empty();
	  		var order = "pacname"; 
			goListAline(order);
		});
	  	$("#alineHIT").click(function() {
	  		$("#proListOrder").empty();	  	
	  		var order = "stname asc";
	  		goListAline(order);
		});
	  	$("#alineNEW").click(function() {
	  		$("#proListOrder").empty();
	  		var order = "stname desc";
	  		goListAline(order);
		});
	  	$("#alineSaleprice").click(function() {
	  		$("#proListOrder").empty();
	  		var order = "saleprice";
	  		goListAline(order);
		});
		
	});// end of $(document).ready

	function goListAline(order) {
		var form_data = {"sdname":"${sdname}",
						 "order":order}; 
		$.ajax({
			url:"productListOrderJSON.do",
			type:"GET",
			data:form_data,
			dataType:"JSON",
			success:function(json) {
				var html ="";
				$.each(json,function(entryIndex,entry){
				html = "<div class='col-md-3 text-center'>"+
						"<div class='product-entry'>"+
						"<div class='product-img' style='background-image: url(<%=CtxPath%>/img/"+entry.pacimage+");'>"+
		                "  <p class='tag'><span class='sale'>"+entry.stname+"</span></p>"+
		                "	  <div class='cart'>"+
		                "     <p>"+
		                        "<span class='addtocart'><a href='cart.do'><i class='icon-shopping-cart'></i></a></span> "+
		                        "<span><a href='product-detail.do?pacnum=${productPack.pacnum}&pnum="+entry.pnum+"'><i class='icon-eye'></i></a></span>"+ 
		                        "<span><a href='product-detail.do?pacnum=${productPack.pacnum}&pnum="+entry.pnum+"'><i class='icon-heart3'></i></a></span>"+
		                        "<span><a href='add-to-wishlist.do'><i class='icon-bar-chart'></i></a></span>"+		                        
		                    " </p>"+
		                  "</div>"+ 
		               "</div>"+
		               "<div class='desc'>"+
		                  " <h3><a href='product-detail.do?pacnum="+entry.pacnum+"&pnum="+entry.pnum+"'>"+entry.pacname+"</a></h3>"+
		                 " <p class='price'><span class='sale'>"+entry.price+"원</span><br/>"+
		                 " <span>"+entry.saleprice+"원</span> </p>"+
		               "</div>"+ 
		         "   </div>"+
		        " </div>";
		        	$("#proListOrder").append(html);
				});
			},	error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});//end of ajax
	}
   window.innerWidth 

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
     			<div class="tab" style="margin-bottom: 50px;">
			        <button type="button" class="tablinks" value="BEST">BEST</button>
			        <button type="button" class="tablinks" value="HIT">HIT</button>
			        <button type="button" class="tablinks" value="NEW">NEW</button>
				</div> 
				<div class="tabcontent" style="display: block;">
					<div id="page">
						<div class="colorlib-shop">
							<div id="displayResultBEST" class="row">
	               			   <%--  <span>${packageList.pname}</span> --%>	 		          			
	             			</div>
	         			</div>
	      			</div>
	   			</div><!-- Best Product -->
			</div>
		</div> <!-- 스펙태그  끝 -->
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
							<li style="float: right;">
								<div class="dropdown">
									<button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="border-radius: 0; height: 50px; background-color: #FFC300;">정렬<span class="caret"></span></button>
									<ul class="dropdown-menu">
										<li><span style="align: center; cursor: pointer; margin-left: 13%;" id="alineName" >이름순</span></li>
										<li><span style="align: center; cursor: pointer; margin-left: 13%;" id="alineHIT" >인기순</span></li>
										<li><span style="align: center; cursor: pointer; margin-left: 13%;" id="alineNEW" >신상품순</span></li>
										<li><span style="align: center; cursor: pointer; margin-left: 13%;" id="alineSaleprice" >가격순</span></li>
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
<div align="center" class=" col-md-offset-2 col-md-8" style="margin-top: 50px; display: block;">
    <div id="page">
         <div class="colorlib-shop">
            <div class="row" id="proListOrder"></div>
=======
	$(document).ready(function(){
		
	
	// ==== BEST/NEW/HIT 의 상품보기 ==== 
		$(".tablinks").click(function(evnet){
			var form_data = {"stname":event.target.value,
							"sdname":"${sdname}"};
	    	//alert(event.target.value);
	    	
	    	 $.ajax({
	   		  url:"productListJSON.do",
	   		  type:"GET",
	   		  data:form_data,
	   		  dataType:"JSON",
	   		  success:function(json){
	   			  var html="";
	   			  if(json.length ==0){//상품이 하나도 없을 경우
	   				  html +="현재상품 준비중..."
	   				  $("#displayResultBEST").html(html);
	   			}
		   		 else{
		   			 $("#displayResultBEST").empty();
		   			$.each(json,function(entryIndex, entry){ 		   				
		   			
		   				html +=		
		   					 	 "<div class='col-md-3 text-center'>"+
		   						 "<div class='product-entry'>"+
		   						 "<div class='product-img' style='background-image: url(<%=CtxPath%>/img/"+entry.pacimage+")'>"+
		   						 "<p class='tag'><span class='sale'>"+entry.v_stname+"</span></p>"+		   						 
		   		                 "<div class='cart'>"+
		   		                 "<p>"+
		   		                 "          <span class='addtocart'><a href='cart.do'><i class='icon-shopping-cart'></i></a></span>"+ 
		   		                 "          <span><a href='product-detail.do'><i class='icon-eye'></i></a></span>"+
		   		                 "          <span><a href='#'><i class='icon-heart3'></i></a></span>"+
		   		                 "		   <span><a href='add-to-wishlist.do'><i class='icon-bar-chart'></i></a></span>"+
		   		                           "</p>"+
		   		                        "</div>"+
		               				"</div>"+
		   		                    "<div class='desc'>"+
		   		                       "<h3><a href='shop.do'>"+entry.pacname+"</a></h3>"+
		   		                       "<p class='price'><span>"+entry.saleprice+"</span></p>"+
		   		                    "</div>"+
		             				"</div>"+
		          				"</div>";       	
		          				
		   				  });//end of $.each(jsonmfunction(entryIndex, entry)					
		   				$("#displayResultBEST").append(html);
		   					   			
		   			  }// end of else

		   		  }, //end of success
	   		  error: function(request, status, error){
	   				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	   			}		   
	   	   });// end of ajax
	    });// end of $(".tablinks").click(function(evnet){

	// ==== BEST/NEW/HIT 의 상품보기 끝 ==== 
		
	});
	
 	function displayListAppend(start) {
		var form_data = {"start":start, // start 맨 처음 얼마부터 출발 할 것인지
						 "len":len,// len:hit 상품을 몇개를 볼 것인가.
						 "sdname":"${sdname}"}; 
		//==> GET방식으로 데이터를 보내준다 
		$.ajax({
			url:"productListJSON.do",
			type:"GET",
			data:form_data,
			dataType:"JSON",
			success:function(json) {
								
				var html ="";				
				if(json.length == 0){// 데이터가 아예 없는 경우라면
					// 주의 ! json == null 이 아닌 json.length == 0으로 해야함 !
				
					html += "현재 상품 준비중....";
				
					//NEW 상품 결과 출력하기 
					$("#displayResultNEW").html(html);
					
					// 더보기 버튼의 비활성화 처리
					$("#btnMoreNEW").attr("disabled",true); // attr :  속성값
					$("#btnMoreNEW").css("cursot","not=allowed");
					
				}else{// 데이터가 존재하는 경우라면					
					$.each(json, function(entryIndex, entry){ 
			        	  html += "<div style=\"display: inline-block; margin: 30px; border: solid gray 1px;\" align=\"left\">" 
			        	        + "  <a href=\"/MyMVC/prodView.do?pnum="+entry.pnum+"\">"
			        	        + "    <img width=\"120px;\" height=\"130px;\" src=\"images/"+entry.pimage1+"\">"
			        	        + "  </a><br/>"
			        	        + "제품명 : "+entry.pname+"<br/>"
			        	        + "정가 : <span style=\"color: red; text-decoration: line-through;\">"+entry.price+" 원</span><br/>"
			        	        + "판매가 : <span style=\"color: red; font-weight: bold;\">"+entry.saleprice+" 원</span><br/>"
			        	        + "할인율 : <span style=\"color: blue; font-weight: bold;\">["+entry.percent+"%] 할인</span><br/>"
			        	        + "포인트 : <span style=\"color: orange;\">"+entry.point+" POINT</span><br/>"
			        	        + "</div>";
			        	  
			        } ); // end of $.each()---------------------------
			          
			           html += "<div style=\"clear: both;\">&nbsp;</div>";
														
								//New 상품 결과 출력하기 
								$("#displayResultNEW").append(html);	
								
								// 			! 중요 !
								// >>> 더보기 버튼의 Value 속성값을 지정하기 <<<
								$("#btnMoreNEW").val(parstInt(start)+lenNEW);
								/*
									mallHome.do를 처음을 띄울 때 맨처음에 parstInt(start) 값은 1이다.
									그다음에 더보기 버튼을 클릭 하면 더보기 버튼의 value값은 9가 되어진다.
									=>더보기 버튼의 value 값 = parstInt(start)+lenHIT) = 1 + 8 = 9
								*/
								
								//웹브라우저 상의 카운트를 출력
								$("#countNEW").text(parseInt($("#countNEW").text())+json.length); // JQuery 에선 변수를 $()로 감싼다.
								
								//더보기.. 버튼을 계속해서 눌러서 countNEW와 totalNEWCount가 일치하는 경우 
								//버든의 이름을 처음으로 변경하고, countNEW에는 0으로 초기화 해준다.
								if($("#countNEW").text() == $("#totalNEWCount").text()){
									$("#btnMoreNEW").empty();
									//$("#btnMoreNEW").text("처음으로 ..");
									$("#countNEW").text("0"); 
								}
								$("#totalNEWCount").text();
								
						}// ehd of for
					html += "</tr>";
					
				}// end of success function
				,	error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		
		});//end of ajax
	}// end of function 
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function openCity(evt, cityName) {
		/*   var i, tabcontent, tablinks;
		   tabcontent = document.getElementsByClassName("tabcontent");
		   for (i = 0; i < tabcontent.length; i++) {
		       tabcontent[i].style.display = "none";
		   }
		   tablinks = document.getElementsByClassName("tablinks");
		   for (i = 0; i < tablinks.length; i++) {
		       tablinks[i].className = tablinks[i].className.replace(" active", "");
		   }
		   document.getElementById(cityName).style.display = "block";
		   evt.currentTarget.className += " active";  */	 
		}  // end of function
		
   window.innerWidth 

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
     			<div class="tab" style="margin-bottom: 50px;">
			        <button type="button" class="tablinks active" onclick="openCity(event, 'BEST');" value="BEST">BEST</button>
			        <button type="button" class="tablinks" onclick="openCity(event, 'HIT');" value="HIT">HIT</button>
			        <button type="button" class="tablinks" onclick="openCity(event, 'NEW');" value="NEW">NEW</button>
				</div> 
				<div class="tabcontent" style="display: block;">
					<div id="page">
						<div class="colorlib-shop">
							<div id="displayResultBEST" class="row">
	               			   <%--  <span>${packageList.pname}</span> --%>	 		          			
	             			</div>
	         			</div>
	      			</div>
	   			</div><!-- Best Product -->
			</div>
		</div> <!-- 스펙태그  끝 -->
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
<div align="center" class=" col-md-offset-2 col-md-8" style="margin-top: 50px; display: block;">
    <div id="page">
         <div class="colorlib-shop">
            <div class="row">
               <c:forEach var="productPack" items="${packageList}">
	               <div class="col-md-3 text-center">               
	                  <div class="product-entry">
	                     <div class="product-img" style="background-image: url(<%=CtxPath%>/img/${productPack.pacimage});">
	                        <p class="tag"><span class="sale">${productPack.fk_stname}</span></p>
	                      	  <div class="cart">
	                           <p>
	                              <span class="addtocart"><a href="cart.do"><i class="icon-shopping-cart"></i></a></span> 
	                              <span><a href="product-detail.do?pacnum=${productPack.pacnum}&pnum=${productPack.pnum}"><i class="icon-eye"></i></a></span> 
	                              <span><a href="#"><i class="icon-heart3"></i></a></span>
	                              <span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
	                           </p>
	                        </div> 
	                     </div>
	                     <div class="desc">
	                         <h3><a href="product-detail.do?pacnum=${productPack.pacnum}&pnum=${productPack.pnum}">
	                         <c:if test="${productPack.pacname != '없음'}">${productPack.pacname}</c:if>
	                         <c:if test="${productPack.pacname == '없음'}">${productPack.pname}</c:if></a></h3> 
	                        <p class="price"><span class="sale">${productPack.price}원</span><br/>
	                        <span>${productPack.saleprice}원</span> </p>
	                     </div> 
	                  </div>
	               </div>
               </c:forEach>

            </div>
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git
         </div>
      </div>
</div>
 
<jsp:include page="../footer.jsp"/>