<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp"/> 

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
					  <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	상품패키지명
					  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	소분류상세명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	카테고리태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	스펙태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	이벤트태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
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