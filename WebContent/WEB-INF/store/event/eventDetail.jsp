<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	$("#totalEventCount").hide();
	$("#countEvent").hide();

	// "더보기.." 버튼 클릭액션에 대한 초기값 호출 
	displayEventAppend("1");

	// "더보기.." 버튼 클릭액션의 이벤트 등록
	$("#btnMoreEvent").click(function(){
		
		if($(this).text() == "처음으로") {
			$("#displayResultEvent").empty();
			displayEventAppend("1");
			$(this).text("더보기");
		}
		else {
			displayEventAppend($(this).val());	
		}
	});
});


// 상품보기
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
              			"<div class='product-img' style='background-image: url(/saladmarket/img/"+entry.pacimage+");'>"+
              				"<p class='tag'><span class='sale'>"+entry.stname+"</span></p>"+
              				"<div class='cart'>"+
                  				"<p>"+
		                  		"<span class='addtocart'><a href='cartAdd.do?orderpnum="+entry.pnum+"&orderoqty=1'><i class='icon-shopping-cart'></i></a></span>"+
		                  		"<span><a href='productDetail.do?pacnum="+entry.pacnum+"&pnum="+entry.pnum+"&img="+entry.pacimage+"'><i class='icon-eye'></i></a></span>"+ 
		                        "<span><a href='#'><i class='icon-heart3'></i></a></span>"+
		                        "<span><a href='like.do'><i class='icon-bar-chart'></i></a></span>"+
                        		"</p>"+
                    		"</div>"+
                    	"</div>"+
                 	"<div class='desc'>"+
                    "<h3><a href='productDetail.do?pacnum="+entry.pacnum+"&pnum="+entry.pnum+"'>"+entry.pacname+
                    "</a></h3>"+
                    "<p class='price' style='font-weight: bold;'><span>"+Number(entry.saleprice).toLocaleString()+"원</span>"+
                    "&nbsp; <span class='sale'>"+Number(entry.price).toLocaleString()+"원</span></p>"+
                 	"</div>"+
              		"</div>"+
           			"</div>";
							});// end of each
					html += "<div style=\"clear: both;\">&nbsp;</div>";
					
					$("#displayResultEvent").append(html);

					$("#btnMoreEvent").val(parseInt(start)+lenEVENT);
	 
				 	$("#countEvent").text(parseInt($("#countEvent").text()) + json.length);    
					
					
					if( $("#countEvent").text() ==  $("#totalEventCount").text()) {
						$("#btnMoreEvent").text("처음으로");
						$("#countEvent").text("0");
					} 
				}
			},error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});//end of ajax
	}
	
</script>

<%-- header End--%>	
		<aside id="colorlib-hero" class="breadcrumbs">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(<%= CtxPath %>/store/images/PFPI-WEBSITE-SLIDERS-1.png);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>이벤트 상세</h1>
				   					<h2 class="bread"><span><a href="<%= CtxPath %>/index.do">Home</a></span></h2>
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
				<div class="row result" id="displayResultEvent">
				
				</div>
					<%--  이미지 하단 태그 끝 --%>
			
				 <div class="row form-group" >
				  <div align="center">
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