<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

	function goEdit() {
		
		var frm = document.eventFrm;
		frm.method = "POST";
		frm.action = "a_eventEdit.do";
		frm.submit();
		
	}

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
<form name="eventFrm">
<table class="table">
    <thead>
        <tr>
            <th class="text-center">이벤트번호</th>
            <th>이벤트명</th>
            <th class="text-center">이벤트이미지</th>
            <th class="text-center">수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="text-center">1</td>
            <td>크리스마스이벤트</td>
            <td class="td-actions text-center">
            	<button type="button" rel="tooltip" class="btn btn-success btn-sm btn-icon">
                    <i class="tim-icons icon-zoom-split"></i>
                </button>
            </td>
            <td class="td-actions text-center"> 
            	<button type="button" rel="tooltip" class="btn btn-success btn-sm btn-icon" onClick="goEdit();">
                    <i class="tim-icons icon-settings"></i>
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
        </tr>
    </tbody>
</table>
</form>
<jsp:include page="admin_footer.jsp"/> 

