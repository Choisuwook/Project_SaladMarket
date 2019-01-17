<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
 ///////////////// BEST 상품 보기 //////////////////
$("#totalEventCount").hide();
$("#countEvent").hide();

// NEW상품 게시물을 더보기 위하여 "더보기.." 버튼 클릭액션에 대한 초기값 호출 
displayEventAppend("1");

// HIT상품 게시물을 더보기 위하여 "더보기.." 버튼 클릭액션의 이벤트 등록
$("#btnMoreEvent").click(function(){
	
	if($(this).text() == "처음으로") {
		$("#displayResultEvent").empty();
		displayEventAppend("1");
		$(this).text("더보기..");
	}
	else {
		displayEventAppend($(this).val());	
	}
});
///////////////// BEST 상품보기 ///////////////////
///////////////// BEST 상품보기 ///////////////////
 var lenEVENT = 8;
 function displayEventAppend(start) {
	 var form_data = {"start":start,
					 "len":lenEVENT,
					 "etname":"${etname}"};
		$.ajax({
			url:"eventDetailJSON.do",
			type:"GET",
			data:form_data,
			dataType:"JSON",
			success:function(json){
				var html="";
				if(json.length == 0){
					html +="현재상품 준비중..";
					$("#displayResultEvent").html(html);
					// 더보기 버튼의 비활성화 처리
			 		$("#btnMoreEvent").attr("disabled", true);
					$("#btnMoreEvent").css("cursor", "not-allowed") 
				}else{
					$.each(json,function(entryIndex,entry){						
				      html += "<div class='col-md-3 text-center'>"+									
							  "<div class='product-entry'>"+
							  "<div class='product-img'>"+  
							  "<img src='<%= CtxPath %>/img/"+entry.pacimage+"' width='100%' height='100%'/>"+
							 "<p class='tag'><span class='new'>"+entry.stname+"</span></p>"+										
						     "<div class='cart'>"+
							 "<p>"+
							 "<span class='addtocart'><a href='cart.do'><i class='icon-shopping-cart'></i></a></span>"+
							  "<span><a href='product-detail.do'><i class='icon-eye'></i></a></span>"+
							  "<span><a href='#'><i class='icon-heart3'></i></a></span>"+										 
							  "<span><a href='add-to-wishlist.do'><i class='icon-bar-chart'></i></a></span>"+
								 "</p>"+
								"</div>"+ 
								"</div>"+
							"<div class='desc'>"+												 
								"<h3>"+entry.pacname+"</h3>"+
								"<input type='hidden' id='productPnum' value='"+entry.pacname+"' />"
	 							"<p class='price'><span>"+entry.saleprice+" 원</span>"+
								"</p>"+
							"</div> "+
						"</div>"+
					"</div>";
							});// end of each
					$("#displayResultEvent").append(html);

					$("#btnMoreEvent").val(parseInt(start)+lenEVENT);
	 
				 	$("#countEvent").text(parseInt($("#countEvent").text()) + json.length);    
					
					
					if( $("#countEvent").text() ==  $("#totalEventCount").text()  ) {
						$("#btnMoreEvent").text("처음으로");
						$("#countEvent").text("0");
					} 
				}
			},error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});//end of ajax
	}// end of function displayHitAppend(start) 
	
 ///////////////// BEST 상품보기 ///////////////////
</script>

<%-- header End--%>	

		<aside id="colorlib-hero" class="breadcrumbs">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(<%= CtxPath %>/store/images/cover-img-1.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>Event Detail</h1>
				   					<h2 class="bread"><span><a href="index.do">Home</a></span></h2>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
<%-- 상위 이미지 끝 --%>

		
<div class="colorlib-shop" style="margin-bottom: 50px;">

			<div class="container" >
			<%-- 이벤트 이름 --%>
				<div class="row" align="center">
					 <h3>${etname}</h3> 
					<hr style="border: 1px solid gray;">
				</div>
				<div class="row" >
				       	
					<div class="col-md-12">	
						<div class="row row-pb-lg" id="displayResultEvent"></div>
							<%--  이미지 하단 태그 끝 --%>
							
							<div class="form-group" >
							  <div>
							    <button type="button" id="btnMoreEvent" name="btnMoreName" class="btn btn-primary">더보기</button>
							    	<span id="totalEventCount">${totalEventCount}</span>
									<span id="countEvent">0</span>
							  </div>
						</div>
				
			</div>
		</div>
	</div>
</div>

		
<jsp:include page="../footer.jsp" />