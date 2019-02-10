<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="admin_header.jsp"/> 

<script type="text/javascript">
  $(document).ready(function() {		
  	
		$("#sizePerPage").val("${sizePerPage}");
		$("#searchWord").val("${searchWord}");
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13) {
				 goSearch();
			}
		});
		
  }); // end of $(document).ready()--------------
  
  
  function goSearch() {
  	
  	var searchWord = $("#searchWord").val().trim();
  	alert(searchWord);
  	if(searchWord == "") {
  		alert("검색어를 입력하세요!!");
  		return;
  	}
  	else {
  		var frm = document.productFrm;
  		frm.method = "GET";
  		frm.action = "a_productList.do";
  		frm.submit();
  	}
  	
  }// end of function goSearch()-----------------
 	function goDetail(event) {		
		
		var frm = document.productFrm;
		frm.method = "POST";
		frm.action = "a_productDetail.do?pnum="+event;
		frm.submit();  
		
	} // end of goDetail()----------------------------
 	function goEdit(event) {				
		var frm = document.productFrm;
		frm.method = "POST";
		frm.action = "a_productEdit.do?pnum="+event;
		frm.submit();  		
	} // end of goDetail()----------------------------

</script>
 <form name="productFrm">
<div class="form-inline ml-auto" style="margin-left: 65%;">
 <div class="form-group no-border">
   <input type="text" id="searchWord" name="searchWord" class="form-control" placeholder="검색">
 </div>
 <button type="button" class="btn btn-link btn-icon btn-round" onClick="goSearch();">
     <i class="tim-icons icon-zoom-split"></i>
 </button>
</div>

<table class="table">
    <thead>
        <tr>
        	<th class="text-center"></th>
            <th>상품번호</th>
            <th>상품이름</th>
            <th>판매가</th>
            <th>재고량</th>
            <th class="text-right">상세&nbsp;&nbsp;&nbsp;&nbsp;수정&nbsp;&nbsp;&nbsp;&nbsp;삭제</th>
        </tr>
            </thead>
    <tbody id="productList">
    	<c:forEach var="product" items="${productList}">
		     <tr><td class="text-center"></td>
	    	  <td>${product.pnum}</td>
			  <td>${product.pname}</td>			           
	          <td>${product.saleprice}</td>
	          <td>${product.pqty}</td>
	          <td class="td-actions text-right">
	           <button type="button" rel="tooltip" class="btn btn-info btn-sm btn-icon" OnClick="goDetail(${product.pnum});">
	               <i class="tim-icons icon-single-copy-04"></i>
	          </button>
	            <button type="button" rel="tooltip" class="btn btn-success btn-sm btn-icon" OnClick="goEdit(${product.pnum});">
	               <i class="tim-icons icon-settings"></i>
	            </button>
	            <button type="button" rel="tooltip" class="btn btn-danger btn-sm btn-icon">
	                <i class="tim-icons icon-simple-remove"></i>
	            </button>
	        </td>
	        </tr>
	        <td><input type="hidden" value="${product.pnum}"></td>     
 		</c:forEach> 
    </tbody>   
</table>
<div style="text-align: center; align-content: center; vertical-align: center;"><span>${pageBar}</span></div>
</form>
<jsp:include page="admin_footer.jsp"/> 










