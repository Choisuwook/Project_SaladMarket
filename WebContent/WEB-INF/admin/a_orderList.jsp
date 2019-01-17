<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp"/>
<%
	String ctxPath=request.getContextPath();
%>
<%-- 검색 버튼 --%>              
<div class="form-inline ml-auto" style="margin-left: 65%;">

  <div class="col-lg-4 col-md-4">
	  <button style="align-self: left" type="button" class="btn btn- dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    검색조건
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" href="#">아이디</a>
	    <a class="dropdown-item" href="#">배송상태</a>
	  </div>
	  
	  <div class="form-group no-border">
	   <input type="text" class="form-control" placeholder="Search">
		 <button type="submit" class="btn btn-link btn-icon btn-round">
		     <i class="tim-icons icon-zoom-split"></i>
		 </button>
	 </div>
  </div>
</div>

<div class="content">
      <div class="col-lg-12 col-md-12">
            <div class="card ">
              	<div class="card-header">
                	<h4 class="card-title"> 주문 목록 </h4>
              	</div>
              	<div class="card-body">
                	<div class="table-responsive">
                  		<table class="table tablesorter" id="">
                    	<thead class="text-primary">	
                      		<tr>
                      			<th class="text-center">선택</th>
		                        <th class="text-center">주문번호</th>
		                        <th class="text-center">주문일자</th>
		                        <th class="text-center">제품정보</th>
		                        <th class="text-center">수량</th>
		                        <th class="text-center">금액</th>
		                        <th class="text-center">포인트</th>
		                        <th class="text-center">배송상태</th>
		                        <th class="text-center">배송상태변경</th>
		                    </tr>
                    	</thead>
                    	<tbody>
	                      	<tr>
	                      		<td class="text-center">
	                      			<div class="form-check">
							          <label class="form-check-label">
							              <input class="form-check-input" type="checkbox" value="">
							              <span class="form-check-sign">
							              <span class="check"></span>
							              </span>
							          </label>
							    	</div>
	                      		</td>
		                        <td class="text-center">odrcode</td>
		                        <td class="text-center">odrdate</td>
		                        <td class="text-center">
		                        	<img src="<%=ctxPath%>/img/fruitjuice4.jpg" style="width:10%;"/>
		                        	제품명
		                        </td>
		                        <td class="text-center">oqty</td>
		                        <td class="text-center">summoney</td>
		                        <td class="text-center">sumpoint</td>
		                        <td class="text-center">deliverStatus</td>
		                        <td class="text-center">
		                        	<button class="btn btn-info btn-sm">배송준비</button>
		                        	<button class="btn btn-success btn-sm">배송중</button>
		                        	<button class="btn btn-warning btn-sm">배송완료</button>
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

