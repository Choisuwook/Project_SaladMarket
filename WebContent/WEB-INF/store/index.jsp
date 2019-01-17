<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String CtxPath = request.getContextPath(); %>
<jsp:include page="header.jsp" />
<script type="text/javascript">
  $(document).ready(function () {
 	  ///////////////// BEST 상품 보기 //////////////////
		$("#totalBESTCount").hide();
		$("#countBEST").hide();
 
		// NEW상품 게시물을 더보기 위하여 "더보기.." 버튼 클릭액션에 대한 초기값 호출 
		displayBestAppend("1");
		
		// HIT상품 게시물을 더보기 위하여 "더보기.." 버튼 클릭액션의 이벤트 등록
		$("#btnMoreBEST").click(function(){
			
			if($(this).text() == "처음으로") {
				$("#displayResultBEST").empty();
				displayBestAppend("1");
				$(this).text("더보기..");
			}
			else {
				displayBestAppend($(this).val());	
			}
		});
	///////////////// BEST 상품보기 ///////////////////	
	///////////////// NEW 상품 보기 //////////////////
		$("#totalNEWCount").hide();
		$("#countNEW").hide();
 
		// NEW상품 게시물을 더보기 위하여 "더보기.." 버튼 클릭액션에 대한 초기값 호출 
		displayNEWAppend("1");
		
		// HIT상품 게시물을 더보기 위하여 "더보기.." 버튼 클릭액션의 이벤트 등록
		$("#btnMoreNEW").click(function(){
			
			if($(this).text() == "처음으로") {
				$("#displayResultNEW").empty();
				displayNEWAppend("1");
				$(this).text("더보기..");
			}
			else {
				displayNEWAppend($(this).val());	
			}
		});
	///////////////// NEW 상품보기 ///////////////////	
 });
///////////////// BEST 상품보기 ///////////////////
 var lenBEST = 4;
 function displayBestAppend(start) {
	 
	 var form_data = {"start":start,
					 "len":lenBEST,
					 "stname":"BEST"};
		$.ajax({
			url:"indexBestJSON.do",
			type:"GET",
			data:form_data,
			dataType:"JSON",
			success:function(json){
				var html="";
		 		if(json.length == 0){
					html +="현재상품 준비중..";
					$("#displayResultBEST").html(html);
					// 더보기 버튼의 비활성화 처리
			 		$("#btnMoreBEST").attr("disabled", true);
					$("#btnMoreBEST").css("cursor", "not-allowed") 
				}else{ 
					$.each(json,function(entryIndex,entry){						
				      html +="<div class='col-md-3 text-center' style='border : 0px solid red;'>"+		             
					                  "<div class='product-entry' >"+                     
					                    "<div class='product-img' style='background-image: url(<%=CtxPath %>/img/"+entry.pacimage+");'>"+
					                        "<p class='tag'><span class='new'>Best</span></p>"+
					                        "<div class='cart'>"+
					                          " <p>"+
					                              "<span class='addtocart'><a href='cart.do'><i class='icon-shopping-cart'></i></a></span>"+ 
					                              "<span><a href='product-detail.do?pacnum="+entry.pacnum+"'><i class='icon-eye'></i></a></span>"+ 
					                              "<span><a href='#'><i class='icon-heart3'></i></a></span>"+
					                              "<span><a href='add-to-wishlist.html'><i class='icon-bar-chart'></i></a></span>"+
					                           "</p>"+
					                        "</div>"+
					                     "</div>"+
					                     "<div class='desc'>"+
					                     	"<h3>"+entry.pacname+"</h3><a href='product-detail.do?pacnum="+entry.pacnum+"></a>"+
					                        "<p class='price'><span>"+entry.saleprice+"</span></p>"+
					                     "</div>"+			                     
					                  "</div>"+            
		              			 "</div>"; 	              	
							});// end of each
					$("#displayResultBEST").append(html);
					// >>> (중요!!!!!) 더보기 버튼의 value 속성에 값을 지정하기 <<< 
					$("#btnMoreBEST").val(parseInt(start) + lenBEST);
					/*
					   http://localhost:9090/MyMVC/mallHome.do 을 
					    처음 띄울때  parseInt(start) 값은 1 이다.
					    그런 다음에 더보기.. 버튼을 클릭하면 더보기.. 버튼의 value값은
					    parseInt(start) + lenNEW 이므로 즉, 1+8 이므로 
					    더보기.. 버튼의 value값은 9 가 된다.
					*/
					
					// 웹브라우저상에 count 출력하기 
				 	$("#countBEST").text(parseInt($("#countBEST").text()) + json.length);    
					
					// 더보기.. 버튼을 계속해서 눌러서 countBEST 와  totalBESTCount 가 일치하는 경우 
					// 버튼의 이름을 "처음으로" 라고 변경하고 countBEST 는 0 으로 초기화 한다.
				
			/* 		alert("countBEST : " + $("#countBEST").text() + "\r\n" +
						  "totalBESTCount : " + $("#totalBESTCount").text() );
				 */
					
					if( $("#countBEST").text() == $("#totalBESTCount").text()) {
						$("#btnMoreBEST").text("처음으로");
						$("#countBEST").text("0");
					}
				 } 
			},error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});//end of ajax
	}// end of function displayHitAppend(start) 
	
 ///////////////// BEST 상품보기 ///////////////////
	 var lenNEW = 4;
	 function displayNEWAppend(start) {
		 var form_data = {"start":start,
						 "len":lenNEW,
						 "stname":"NEW"};
			$.ajax({
				url:"indexNEWJSON.do",
				type:"GET",
				data:form_data,
				dataType:"JSON",
				success:function(json){
					var html="";
					if(json.length == 0){
						html +="현재상품 준비중..";
						$("#displayResultNEW").html(html);
						// 더보기 버튼의 비활성화 처리
				 		$("#btnMoreNEW").attr("disabled", true);
						$("#btnMoreNEW").css("cursor", "not-allowed") 
					}else{
						$.each(json,function(entryIndex,entry){						
						      html +="<div class='col-md-3 text-center' style='border : 0px solid red;'>"+		             
			                  "<div class='product-entry' >"+                     
			                    "<div class='product-img' style='background-image: url(<%=CtxPath %>/img/"+entry.pacimage+");'>"+
			                        "<p class='tag'><span class='new'>NEW</span></p>"+
			                        "<div class='cart'>"+
			                          " <p>"+
			                              "<span class='addtocart'><a href='cart.do'><i class='icon-shopping-cart'></i></a></span>"+ 
			                              "<span><a href='product-detail.do?pacnum="+entry.pacnum+"'><i class='icon-eye'></i></a></span>"+ 
			                              "<span><a href='#'><i class='icon-heart3'></i></a></span>"+
			                              "<span><a href='add-to-wishlist.html'><i class='icon-bar-chart'></i></a></span>"+
			                           "</p>"+
			                        "</div>"+
			                     "</div>"+
			                     "<div class='desc'>"+
			                     	"<h3>"+entry.pacname+"</h3><a href='product-detail.do?pacnum="+entry.pacnum+"></a>"+
			                        "<p class='price'><span>"+entry.saleprice+"</span></p>"+
			                     "</div>"+			                     
			                  "</div>"+            
              			 "</div>"; 
            	
    					});// end of each
    					
						$("#displayResultNEW").append(html);
						// >>> (중요!!!!!) 더보기 버튼의 value 속성에 값을 지정하기 <<< 
						$("#btnMoreNEW").val(parseInt(start) + lenNEW);
						
						
						// 웹브라우저상에 count 출력하기 
					 	$("#countNEW").text(parseInt($("#countNEW").text()) + json.length);    
					
						
						if($("#countNEW").text() == $("#totalNEWCount").text()) {
							$("#btnMoreNEW").text("처음으로");
							$("#countNEW").text("0");
							 						
						} 
					}
				},error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});//end of ajax 
		}// end of function displayHitAppend(start) 

</script>
      <aside id="colorlib-hero">
         <div class="flexslider">
            	<ul class="slides">    
            	  <li><a href="eventDetail.do?etnum=1&etname=크리스마스 이벤트"><img src="<%=CtxPath %>/store/images/index/MerryChristmas.PNG" style="width: 70%; margin: 0 auto;"></a></li>
                  <li><a href="eventDetail.do?etnum=2&etname=연말 이벤트"><img src="<%=CtxPath %>/store/images/index/LastSale.png" style="width: 70%; margin: 0 auto;"></a></li>
                  <li><a href="eventDetail.do?etnum=3&etname=연초 이벤트"><img src="<%=CtxPath %>/store/images/index/NewYearSale.png" style="width: 70%; margin: 0 auto;"></a></li>
              	</ul>
           </div>
      </aside><!-- 메인 이벤트 -->

       <!-- ##### Hero Area End ##### -->
       <!-- 이벤트 및 쿠폰  -->
       <div class="colorlib-shop">
          <div style="border: 0px gray solid; margin-top : 50px;">
             <div align="center">       
                    <a href=""><span class="main-event-item"><img src="<%=CtxPath %>/store/images/index/coupon.jpg" align="middle"></span></a>
                    <a href=""><span class="main-event-item"><img src="<%=CtxPath %>/store/images/index/membergrade.jpg" align="middle"></span></a>
                    <a href=""><span class="main-event-item"><img src="<%=CtxPath %>/store/images/index/freedeliver.jpg" align="middle"></span></a>
               </div>
          </div>
       </div>

  <!-- New 상품 -->
      <div class="colorlib-shop">
         <div class="container">
            <div class="row">
               <div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
                  <h2><span>NEW Products</span></h2>
               </div>
            </div> 
            
            <div class="row" id="displayResultNEW"></div>
            <!--  NEW 상품 더보기 버튼 -->
           
            <c:if test="${totalNEWCount > 4}">
           	<div class="form-group">           		
				<div>
					<button type="button" id="btnMoreNEW" name="btnMoreName" class="btn btn-primary">더보기</button>
					  	<span id="totalNEWCount">${totalNEWCount}</span>
						<span id="countNEW">0</span>
				</div>
			</div>
			</c:if>
			<!--  NEW 상품 더보기 버튼끝 -->
        </div>
      </div>
	<!-- New 상품 끝 -->
      <!--  BEST 상품 -->
        <div class="colorlib-shop">
         <div class="container">
            <div class="row">
               <div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
                  <h2><span>Best Products</span></h2>
               </div>
            </div>          
            
            <div class="row" id="displayResultBEST"></div>
           <!--  BEST 상품 더보기 버튼 -->
           <c:if test="${totalBESTCount > 4}">
	           	<div class="form-group" >
	       			  <div>
					    <button type="button" id="btnMoreBEST" name="btnMoreName" class="btn btn-primary">더보기</button>
					    	<span id="totalBESTCount">${totalBESTCount}</span>
							<span id="countBEST">0</span>
					  </div>
			 
				</div>
			</c:if>
			<!--  BEST 상품 더보기 버튼끝 -->
        </div>
      </div>
     <!--  BEST 상품 끝--> 

      <div align="center">
         <img src="<%=CtxPath %>/store/images/index/info.jpg">
      </div><!-- Market Sue's Pick -->
      
<jsp:include page="footer.jsp" />