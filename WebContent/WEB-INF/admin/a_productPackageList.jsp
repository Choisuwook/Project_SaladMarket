<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<jsp:include page="admin_header.jsp"/> 



<script>
	$(document).ready(function() {
		

		$.ajax({
			url:"a_productPackageJSON.do",
			type:"GET",
			dataType:"JSON",
			success:function(json){
				var html ="";
				$.each(json,function(entryIndex,entry){
						html ="<tr>"+
						"<td class='text-center'>"+entry.pacnum+"</td>"+
			            "<td>"+entry.pacname+"</td>"+			           
			            "<td class='td-actions text-right'>"+
			            "  <button type='button' rel='tooltip' class='btn btn-info btn-sm btn-icon' OnClick='goDetail();'>"+
			              "      <i class='tim-icons icon-single-copy-04'></i>"+
			               " </button>"+
			                "<button type='button' rel='tooltip'class='btn btn-success btn-sm btn-icon'>"+
			                 "   <i class='tim-icons icon-settings'></i>"+
			               " </button>"+
			               " <button type='button' rel='tooltip' class='btn btn-danger btn-sm btn-icon'>"+
			                "    <i class='tim-icons icon-simple-remove'></i>"+
			               " </button>"+
			            "</td>"+
			            "</tr>"+
     					"<td> <input type='hidden' name='pacnum' value="+entry.pacnum+"></td>";

					 $("#productList").append(html);
				});// end of each
				
			},	error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});//end of ajax
	});// end of ready
	
	
 	function goDetail() {
		
		var frm = document.productFrm;
		frm.method = "POST";
		frm.action = "a_productDetail.do";
		frm.submit(); 
		
	} // end of goDetail()----------------------------


</script>
    

<%-- 검색 버튼  --%>        
<div class="form-inline ml-auto" style="margin-left: 65%;">
 <div class="form-group no-border">
   <input type="text" class="form-control" placeholder="Search">
 </div>
 <button type="submit" class="btn btn-link btn-icon btn-round">
     <i class="tim-icons icon-zoom-split"></i>
 </button>
</div>
<form name="productFrm">
<table class="table">
    <thead>
        <tr>
            <th class="text-center">상품번호</th>
            <th>상품이름</th>
            <th>판매가</th>
            <th>재고량</th>
            <th class="text-right">상세&nbsp;&nbsp;&nbsp;&nbsp;수정&nbsp;&nbsp;&nbsp;&nbsp;삭제</th>
        </tr>
    </thead>
    <tbody id="productList">
    	<tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
    </tbody>
</table>
</form>

<jsp:include page="admin_footer.jsp"/> 










