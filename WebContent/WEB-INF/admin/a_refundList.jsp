<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp"/>

<%-- 검색 버튼 --%>              
<div class="col-lg-12 col-md-12">
	<div class="form-inline ml-auto" style="margin-left: 65%;">
	 <div class="form-group no-border">
	   <input type="text" class="form-control" placeholder="Search">
	 </div>
	 <button type="submit" class="btn btn-link btn-icon btn-round">
	     <i class="tim-icons icon-zoom-split"></i>
	 </button>
	</div>
</div>

<div class="content">
      <div class="col-lg-12 col-md-12">
            <div class="card ">
              	<div class="card-header">
                	<h4 class="card-title"> 취소/반품/환불 목록 </h4>
              	</div>
              	<div class="card-body">
                	<div class="table-responsive">
                  		<table class="table tablesorter" id="">
                    	<thead class="text-primary">	
                      		<tr>
		                        <th>주문번호</th>
		                        <th>주문일자</th>
		                        <th>제품정보</th>
		                        <th>수량</th>
		                        <th>금액</th>
		                        <th>포인트</th>
		                        <th>취소/반품/환불</th>
		                        <th>철회</th>
		                    </tr>
                    	</thead>
                    	<tbody>
	                      	<tr>
		                        <td>1</td>
		                        <td>2018-11-28</td>
		                        <td>오렌지주스</td>
		                        <td>1</td>
		                        <td>10000</td>
		                        <td>1000</td>
		                        <td>취소</td>
		                        <td>
		                        	<button class="btn btn-primary btn-sm">철회</button>
		                        </td>
		                    </tr>
                      		<tr>
		                        <td>2</td>
		                        <td>2018-11-28</td>
		                        <td>사과주스</td>
		                        <td>1</td>
		                        <td>10000</td>
		                        <td>1000</td>
		                        <td>반품</td>
		                        <td>
		                        	<button class="btn btn-primary btn-sm">철회</button>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>3</td>
		                        <td>2018-11-28</td>
		                        <td>포도주스</td>
		                        <td>1</td>
		                        <td>10000</td>
		                        <td>1000</td>
		                        <td>환불</td>
		                        <td>
		                        	<button class="btn btn-primary btn-sm">철회</button>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                    </tr>
                    	</tbody>
                  	</table>
                </div>
             </div>
         </div>
     </div>
</div>
<jsp:include page="admin_footer.jsp"/> 

