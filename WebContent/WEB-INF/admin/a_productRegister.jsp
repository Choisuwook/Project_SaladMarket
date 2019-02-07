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
		console.log("sdname"+sdname);
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
	
	$("#spinnerImgQty").click("spinstop", function(){
		var html ="";
		var spinnerImgQtyVal = $("#spinnerImgQty").val();
		
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

 function goRegister() {
	 
	var flag =false;
	$(".infoData").each(function () {		
		var value = $(this).val();
		if(value == ""){
			$(this).next().html("<br/>해당값을 입력하세요!");
			flag=true;
			return;
		}else{
			flag=false;
			$(this).next().html("");
		}

	});
	if(flag){
		event.preventDefault(); // 이벤트를 가로막는다(아래 form에 기재되어 있는 action을 취하지 않음)
		return;
	}else{			 
		var frm = document.registerFrm;
		frm.method="POST";
		frm.action="goRegister.do";
		frm.submit();
	}


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
					  <input type="hidden" class="infoData" name="pacname" id="pacname"><span></span>
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
					 	 <input type="hidden" class="infoData" name="sdname" id="sdname"><span></span>
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
					 	 <input type="hidden" class="infoData" name="ctname" id="ctname"><span></span>
						  <div class="dropdown-menu" id="fk_ctnameSelect" aria-labelledby="btnCtnameSelect">
						    <c:forEach var="map" items="${categoryTag}">
		   						<a class="dropdown-item" id="${map.ctnum}">${map.ctname}</a>		   						
	    					</c:forEach>
						  </div>
						  
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
						  <button class="btn btn-primary dropdown-toggle" type="button" id="btnStnameSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	스펙태그명
					 	 </button>
					 	 <input type="hidden" class="infoData" name="stname" id="stname"><span></span>
						  <div class="dropdown-menu" id="fk_stnameSelect" aria-labelledby="btnStnameSelect">
						    <c:forEach var="map" items="${specTag}">
		   						<a class="dropdown-item" id="${map.stnum}">${map.fk_stname}</a>
		   						
	    					</c:forEach>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
						  <button class="btn btn-primary dropdown-toggle" type="button" id="btnEtnameSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                        <input type="text" class="infoData form-control pname" name="panme" id="pname" >
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>원가</label>
                        <input type="text" class="infoData form-control price" name="price" id="price"><span></span>
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>판매가</label>
                        <input type="text" class="infoData form-control saleprice" name="saleprice" id="saleprice" ><span></span>
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>포인트</label>
                        <input type="text" class="infoData form-control point" name="point" id="point" ><span></span>
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>재고량</label>
                        <input type="text" class="infoData form-control pqty" name="pqty" id="pqty" ><span></span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-8 pl-md-3">
                      <div class="form-group">
                        <label>상품설명</label>
                        <textarea rows="4" cols="80" class="infoData form-control pcontents" name="pcontents" id="pcontents" placeholder="설명을 입력하세요"></textarea><span></span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                  	<div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>상품회사명</label>
                        <input type="text" class="infoData form-control pcompanyname" name="pcompanyname" id="pcompanyname"><span></span>
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>유통기한</label>
                        <input type="text" class="infoData form-control pexpiredate" name="pexpiredate" id="pexpiredate"><span></span>
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>알레르기정보</label>
                        <input type="text" class="infoData form-control allergy" name="allergy" id="allergy"><span></span>
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>용량</label>
                        <input type="text" class="infoData form-control weight" name="weight" id="weight"><span></span>
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>상품회사명</label>
                        <input type="text" class="infoData form-control pcompanyname" name="pcompanyname" id="pcompanyn<span></span>ame">
                      </div>
                    </div>
                   </div>
                  
	              <label>제품이미지</label>
	              <label for="spinnerImgQty">파일 갯수 : </label>
		              <ul style="list-style-type: none;">
		              	<li>
		              	 <input id="spinnerImgQty" name ="spinnerImgQty" type="number" value="0" style="width: 10%; height: 20px;">
		              	</li>
		              	<li>                  
		                </li>
		                <li><input type="text" name="attachCount" id="attachCount" value=""/>
		              	</li>
		              </ul>
		              <div id="divfileattach"></div>
                </form>
              </div>
              
              <div class="card-footer">
                <button type="button" class="btn btn-fill btn-primary" onClick="goRegister();">등록</button>
              </div>
            </div>
          </div>
        </div>

<jsp:include page="admin_footer.jsp"/> 