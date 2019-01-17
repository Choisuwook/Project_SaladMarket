<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp"/>    
      <div class="col-lg-12 col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 회원 목록 </h4>
                <div class="text-right">
                <span>총 회원수: 100</span>&nbsp;&nbsp;
                <span>신규회원수 : 100</span>&nbsp;&nbsp;
                <span>휴면회원수 : 100</span>&nbsp;&nbsp;
                <span>탈퇴회원수 : 100</span>
 				</div>
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
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">	
                      <tr>
                      	<th style="text-align: center;">check</th>
                        <th>회원번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>누적금액</th>
                        <th>회원등급</th>
                        <th>회원상태</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                      	<td style="text-align: center;">
                      	<input type="checkbox" name="checknum" />
                      	</td>
                        <td>mnum</td>
                        <td>userid</td>
                        <td>name</td>
                        <td>email</td>
                        <td>summoney</td>
                        <td>fk_lvnum</td>
                        <td>status</td>
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
<jsp:include page="admin_footer.jsp"/>  