<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>

<style>
#goDetailBtn{
	    background-color: inherit;
	    float: center;
	    border: none;
	    outline: none;
	    cursor: pointer;
	    padding: 14px 16px;
	    transition: 0.3s;
	    font-size: 17px;
}
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
	$(document).ready(function(){	 
	
	// ==== BEST/NEW/HIT 의 상품보기 ==== 
		$(".tablinks").hover(function(evnet){	
			
		
			var form_data = {"stname":event.target.value,
							"sdname":"${sdname}"};
	    	  	
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
		   			
		   				html +=	"<div class='col-md-3 text-center'>"+
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
		   		                // " <h3><a href='product-detail.do?pacnum="+entry.pacnum+"&pnum="+entry.pnum+"'>"+entry.pacname+"</a></h3>"+
		   		              	" <h3><button onClick='goDetail()' style='background:none;border:none;'>"+entry.pacname+"</button></h3>"+
		   		              	"<input type='hidden' value='"+entry.pacname+"' />"+
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
	
	function goDetail() {
		var frm = document.productListFrm;
		frm.action="product-detail.do";
		frm.submit();
	}
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
						"<input type='hidden' value='"+entry.pacname+"'>"+
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
		                  //" <h3><a href='product-detail.do?pacnum="+entry.pacnum+"&pnum="+entry.pnum+"'>"+entry.pacname+"</a></h3>"+
		                 " <h3><button onClick='goDetail()' style='border:none; background-color:white;'>"+entry.pacname+"</button></h3>"+		  
		                 " <p class='price'><span class='sale'>"+entry.price+"원</span><br/>"+
		                 " <span>"+entry.saleprice+"원</span></p>"+
		                 "<input type='hidden' name='pacname' value='"+entry.pacname+"'/>"+
		                 "<input type='hidden' name='pnum' value='"+entry.pnum+"'/>"+
		                 "<input type='hidden' name='pacnum' value='"+entry.pacnum+"'/>"+
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
<form name="productListFrm">
<div align="center" class=" col-md-offset-2 col-md-8" style="margin-top: 50px; display: block;">
    <div id="page">
         <div class="colorlib-shop">
            <div class="row" id="proListOrder"></div>
         </div>
      </div>
</div>
</form>

<jsp:include page="../footer.jsp"/> 