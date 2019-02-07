<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="admin_header.jsp"/> 
<style type="text/css">
.list{
  text-align: center;
  vertical-align: center;
  padding: 3%;
  width: 100%; 
  border-bottom: 1px solid lightgray;
  cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	
	$("#fk_pacnameSelect").children().click(function(){
		var len = $(this).html().length;
		var html = $(this).text().trim();
		console.log(html);
		$("#pacname").val(html);
		
		if(len>6){
			html = html.substring(0,10);
		}
		$("#btnPacnameSelect").empty().html(html);

	});
	
	$("#fk_sdnameSelect").children().click(function(){
		var len = $(this).html().length;
		var html = $(this).html();
		
		var sdname = $(this).attr('id');
		console.log(sdname);
		$("#sdname").val(sdname);
		
		if(len>8){
			html = html.substring(0,13);
		}
		$("#btnSdnameSelect").empty().html(html);
		
		
	});
	
	$("#fk_ctnameSelect").children().click(function(){
		var len = $(this).html().length;
		var html = $(this).text();
		console.log(html);
		$("#ctname").val(html);
		if(len>6){
			html = html.substring(0,8);
		}
		$("#btnCtnameSelect").empty().html(html);
		
	});
	
	$("#fk_stnameSelect").children().click(function(){
		var len = $(this).html().length;
		var html = $(this).text();
		console.log(html);
		$("#stname").val(html);
		if(len>6){
			html = html.substring(0,8);
		}
		$("#btnStnameSelect").empty().html(html);
		
	});
	
	$("#fk_etnameSelect").children().click(function(){
		var len = $(this).html().length;
		var html = $(this).text();
		console.log(html);
		$("#etname").val(html);
		if(len>6){
			html = html.substring(0,8);
		}
		$("#btnEtnameSelect").empty().html(html);
		
	});
	
	$("#spinnerImgQty").bind("spinstop", function(){
		
		var html ="";
		var spinnerImgQtyVal = $("#spinnerImgQty").val();
		
		alert(html);
		
		if(spinnerImgQtyVal == "0"){
			$("#divfileattach").empty();
			$("#attachCount").val("");
			return;
		}
		else {
			for(var i=0; i<parseInt(spinnerImgQtyVal); i++){
				html += "<li>";
				html += "<input type='file' name='attach"+i+"' class=\"infodata btn btn-primary btn-simple\" /></li>";
			}
			$("#divfileattach").empty();
			$("#divfileattach").append(html);
			$("#attachCount").val(spinnerImgQtyVal);
		}

	});
	
	
});

}
</script>

  <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="title">상품 등록</h5>
              </div>
              <div class="card-body">
                <form name="registerFrm" enctype="multipart/form-data">
                  <div class="row">
                    <div class="col-md-3 pr-md-1">
                      <div class="dropdown">
			  		  <button class="btn btn-primary dropdown-toggle" type="button" id="btnPacnameSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	상품패키지명
					  </button>
					  <input type="hidden" class="infoData" name="pacname" id="pacname" value=""><span></span>
						  <div class="dropdown-menu" id="fk_pacnameSelect" aria-labelledby="btnPacnameSelect">
							<c:forEach var="map" items="${packageName}">
		   						<a class="dropdown-item" id="${map.pacnum}">${map.pacname}</a>
		   						
	    					</c:forEach>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
						  <button class="btn btn-primary dropdown-toggle" type="button" id="btnSdnameSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	소분류상세명
					 	 </button>
					 	 <input type="hidden" class="infoData" name="sdname" id="sdname" value=""><span></span>
						  <div class="dropdown-menu" id="fk_sdnameSelect" aria-labelledby="btnSdnameSelect">
						    <c:forEach var="map" items="${requestScope.subclassTag}">
		   						<a class="dropdown-item" id="${map.sdname}">${map.fk_sdname}</a>
	    					</c:forEach>
						  </div>
						  
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
						  <button class="btn btn-primary dropdown-toggle" type="button" id="btnCtnameSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	카테고리태그명
					 	 </button>
					 	 <input type="hidden" class="infoData" name="ctname" id="ctname" value=""><span></span>
						  <div class="dropdown-menu" id="fk_ctnameSelect" aria-labelledby="btnCtnameSelect">
						    <c:forEach var="map" items="${categoryTag}">
		   						<a class="dropdown-item" id="${map.ctnum}">${map.ctname}</a>
		   						
	    					</c:forEach>
						  </div>
						  
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
W						  <button class="btn btn-primary dropdown-toggle" type="button" id="btnStnameSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	스펙태그명
					 	 </button>
					 	 <input type="hidden" class="infoData" name="stname" id="stname" value=""><span></span>
						  <div class="dropdown-menu" id="fk_stnameSelect" aria-labelledby="btnStnameSelect">
						    <c:forEach var="map" items="${specTag}">
		   						<a class="dropdown-item" id="${map.stnum}">${map.fk_stname}</a>
		   						
	    					</c:forEach>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
W						  <button class="btn btn-primary dropdown-toggle" type="button" id="btnEtnameSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	이벤트태그명
					 	 </button>
					 	 <input type="hidden" class="infoData" name="etname" id="etname" value=""><span></span>
						  <div class="dropdown-menu" id="fk_etnameSelect" aria-labelledby="btnEtnameSelect">
						    <c:forEach var="map" items="${eventTag}">
		   						<a class="dropdown-item" id="${map.etnum}">${map.fk_etname}</a>
	    					</c:forEach>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-12 pl-md-8">
                      <div class="form-group">
                        <label>상품명</label>
                        <input type="text" class="form-control pname infoData" name="panme" id="pname" >
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>원가</label>
                        <input type="text" class="form-control price infoData" name="price" id="price">
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>판매가</label>
                        <input type="text" class="form-control saleprice infoData" name="saleprice" id="saleprice" >
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>포인트</label>
                        <input type="text" class="form-control point infoData" name="point" id="point" >
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>재고량</label>
                        <input type="text" class="form-control pqty infoData" name="pqty" id="pqty" >
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-8 pl-md-3">
                      <div class="form-group">
                        <label>상품설명</label>
                        <textarea rows="4" cols="80" class="form-control pcontents infoData" name="pcontents" id="pcontents" placeholder="설명을 입력하세요"></textarea>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                  	<div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>상품회사명</label>
                        <input type="text" class="form-control pcompanyname infoData" name="pcompanyname" id="pcompanyname">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>유통기한</label>
                        <input type="text" class="form-control pexpiredate infoData" name="pexpiredate" id="pexpiredate">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>알레르기정보</label>
                        <input type="text" class="form-control allergy infoData" name="allergy" id="allergy">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>용량</label>
                        <input type="text" class="form-control weight infoData" name="weight" id="weight">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>상품회사명</label>
                        <input type="text" class="form-control pcompanyname infoData" name="pcompanyname" id="pcompanyname">
                      </div>
                    </div>
                   </div>
                  
	              <label>제품이미지</label>
	              <label for="spinnerImgQty">파일 갯수 : </label>
		              <ul style="list-style-type: none;">
		              	<li>
		              	 <input id="spinnerImgQty" type="number" value="0" style="width: 10%; height: 20px;">
		              	</li>
		              	<li>
		              		<div id="divfileattach"></div>		                  
		                </li>
		                <li><input type="hidden" name="attachCount" id="attachCount" />
		              	</li>
		              </ul>
                </form>
              </div>
              
              <div class="card-footer">
                <button type="button" class="btn btn-fill btn-primary">등록</button>
              </div>
            </div>
          </div>
        </div>

<jsp:include page="admin_footer.jsp"/> 