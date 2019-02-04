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

function packageName(event) {
	$("#package"+event).parent().parent().show();
	var selectPackage= $("#package"+event).val();
		
	$("#dropdownMenuButton1").text("").text(selectPackage);
	$("#package"+event).parent().parent().html("<a href='self.close()'></a>"); 

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
                <form name="" enctype="multipart/form-data">
                  <div class="row">
                    <div class="col-md-3 pr-md-1">
                      <div class="dropdown">
					  <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	상품패키지명
					  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  	<c:forEach items="${packageName}" var="name">
						  		<div class="list" aria-labelledby="dropdownMenuButton" style="border:1px solid red; width:300px;">
						  			<input type="text" value="${name.pacname}" id="package${name.pacnum}" onClick="packageName(${name.pacnum});" size="15" style="width:100%;border:none; cursor: pointer;"/>
						  		</div>
						  	</c:forEach>				
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	소분류상세명
					 	 </button>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  		<c:forEach items="${subclassTag}" var="name">
						  			<div class="list" id="package${name.sdnum}" onClick="">${name.fk_sdname}</div>
						  		</c:forEach>				
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	카테고리태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						     	<c:forEach items="${categoryTag}" var="name">
						  			<div class="list" id="package${name.ctnum}" onClick="">${name.ctname}</div>
						  		</c:forEach>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	스펙태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<c:forEach items="${specTag}" var="name">
						  			<div class="list" id="package${name.stnum}" onClick="">${name.fk_stname}</div>
						  		</c:forEach>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton6" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	이벤트태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  	  <c:forEach items="${eventTag}" var="name">
						  		 <div class="list"><input type="button" id="event${name.etnum}" value="${name.fk_etname}" onclick="event(${name.etnum});" /></div>
						  	  </c:forEach>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-12 pl-md-8">
                      <div class="form-group">
                        <label>상품명</label>
                        <input type="text" class="form-control pname" name="panme" id="pname" >
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>원가</label>
                        <input type="text" class="form-control price" name="price" id="price">
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>판매가</label>
                        <input type="text" class="form-control saleprice" name="saleprice" id="saleprice" >
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>포인트</label>
                        <input type="text" class="form-control point" name="point" id="point" >
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>재고량</label>
                        <input type="text" class="form-control pqty" name="pqty" id="pqty" >
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-8 pl-md-3">
                      <div class="form-group">
                        <label>상품설명</label>
                        <textarea rows="4" cols="80" class="form-control pcontents" name="pcontents" id="pcontents" placeholder="설명을 입력하세요"></textarea>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                  	<div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>상품회사명</label>
                        <input type="text" class="form-control pcompanyname" name="pcompanyname" id="pcompanyname">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>유통기한</label>
                        <input type="text" class="form-control pexpiredate" name="pexpiredate" id="pexpiredate">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>알레르기정보</label>
                        <input type="text" class="form-control allergy" name="allergy" id="allergy">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>용량</label>
                        <input type="text" class="form-control weight" name="weight" id="weight">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>상품회사명</label>
                        <input type="text" class="form-control pcompanyname" name="pcompanyname" id="pcompanyname">
                      </div>
                    </div>
                   </div>
                  
	              <label>제품이미지</label>
		              <ul style="list-style-type: none;">
		              	<li>
		              		<input type="file" name="pimage1" class="infodata btn btn-primary btn-simple"/>
		              	</li>
		              	<li>
		                    <input type="file" name="pimage2" class="infodata btn btn-primary btn-simple"/>
		                </li>
		              	<li>
		                	<input type="file" name="pimage3" class="infodata btn btn-primary btn-simple"/>
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