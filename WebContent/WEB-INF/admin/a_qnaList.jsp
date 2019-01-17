<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>

	function goDetail() {
		
		var frm = document.qnaFrm;
		frm.method = "POST";
		frm.action = "qnaDetail.do";
		frm.submit();
		
	}// end of goDetail()----------------------------


</script>
    
    
<jsp:include page="admin_header.jsp"/> 


<%-- 검색 버튼 --%>              
<div class="form-inline ml-auto" style="margin-left: 65%;">
 <div class="form-group no-border">
   <input type="text" class="form-control" placeholder="Search">
 </div>
 <button type="submit" class="btn btn-link btn-icon btn-round">
     <i class="tim-icons icon-zoom-split"></i>
 </button>
</div>
<form name="qnaFrm">
<table class="table">
    <thead>
        <tr>
            <th class="text-center">상품문의번호</th>
            <th>상품번호</th>
            <th>사용자아이디</th>
            <th>상품문의제목</th>
            <th class="text-right">상세&nbsp;&nbsp;&nbsp;&nbsp;삭제&nbsp;</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="text-center">1</td>
            <td>1</td>
            <td>leess</td>
            <td>많이 맵진 않나요?</td>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" class="btn btn-info btn-sm btn-icon" onclick="goDetail();">
                    <i class="tim-icons icon-single-copy-04"></i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-danger btn-sm btn-icon">
                    <i class="tim-icons icon-simple-remove"></i>
                </button>
            </td>
        </tr>
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

