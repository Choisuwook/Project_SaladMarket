<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp"/>
<script>
$(document).ready(function(){
	$('#divfileattach').hide();
	$('#categoryeditattach').hide();
	
    $('[data-toggle="popover"]').popover();

    $("#categoryAdd").click(function() {
        
        $('#divfileattach').toggle('display'); 
    });
    
 $("#categoryEdit").click(function() {
        
        $('#categoryeditattach').toggle('display'); 
    });
    
});

</script>

<div class="container"> 
	<div class="row">
         <div class="col-md-12">
           <div class="card-plain ">
             <div class="card-header">
               <h4 class="card-title">카테고리 태그 관리</h4>
             </div>
             
             <%-- 검색 버튼 --%>              
 			<div class="form-inline ml-auto text-right">
	          <div class="form-group no-border">
	            <input type="text" class="form-control" placeholder="Search">
	          </div>
	          <button type="submit" class="btn btn-link btn-icon btn-round">
	              <i class="tim-icons icon-zoom-split"></i>
	          </button>
	         </div>
             
             <div class="card-body">
               <div class="table-responsive">
                 <table class="table tablesorter" id="">
                   <thead class=" text-primary">
                   	<%-- 카테고리 태그 추가하기 버튼 --%>
                     <tr class="text-right" style="padding-right: 15%;  border-top-style: none;">
                   		<td colspan="4" style="border-top-style: none;">
       					<button type="button" id="categoryAdd" rel="tooltip" class="btn btn-default btn-sm btn-icon">
                   		<i class="tim-icons icon-simple-add"></i>
               			</button>
               		<%-- 추가 버튼을 눌렀을 때 뜨는 input 박스 --%>
           				<div class="col-md-3 form-inline ml-auto" id="divfileattach">
	           				<br/>
							<input type='text' name='categoryadd' class='form-control'/>&nbsp;&nbsp;
							<button type='button' rel='tooltip' class='btn btn-default btn-md btn-icon' onClick='categoryAdd();'>추가</button>
           				</div>
               			</td>
                     </tr>
                     
                     <tr>
                       <th class="text-center">
                         NO
                       </th>
                       <th class="text-center">
                       	  카테고리명
                       </th>
                       <th class="text-center">
                      	   수량
                       </th>
                       <th class="text-center">
                     	    관리
                       </th>
                     </tr>
                   </thead>
                   <tbody>
                     <tr>
                       <td class="text-center">
                         1
                       </td>
                       <td class="text-center">
                     	    다이어트용
                       </td>
                       <td class="text-center">
                         6
                       </td>
                      
                       <td class="td-actions text-center">
		                <button type="button" rel="tooltip" id="categoryEdit" class="btn btn-default btn-sm btn-icon">
		                    <i class="tim-icons icon-pencil"></i>
		                </button>
		                <button type="button" rel="tooltip" class="btn btn-default btn-sm btn-icon">
		                    <i class="tim-icons icon-simple-delete"></i>
		                </button>
           			   </td>
                    </tr>
               		<tr>
               			<td colspan="4">
               			<div class="col-md-3 form-inline ml-auto" id="categoryeditattach">
	           				<br/>
							<input type='text' name='categoryedit' class='form-control'/>&nbsp;&nbsp;
							<button type='button' rel='tooltip' class='btn btn-default btn-md btn-icon' onClick='categoryEdit();'>수정</button>
           				</div>
           				</td>
               		</tr>
                   </tbody>
                 </table>
               </div>
             </div>
           </div>
         </div>
	</div>
</div>
<jsp:include page="admin_footer.jsp"/> 

