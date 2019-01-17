 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="admin_header.jsp"/> 

  <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="title">회원 상세 정보/수정</h5>
              </div>
              <div class="card-body">
                <form>
                
                   <div class="row">
                    <div class="col-md-3 pr-md-1">
                      <div class="form-group">
                        <label>회원번호</label>
                        <input type="text" class="form-control" placeholder="" value="">
                      </div>
                    </div>
                    <div class="col-md-3 pr-md-1">
                      <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" placeholder="name" value="이순신">
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-3 pr-md-1">
                      <div class="form-group">
                        <label>아이디</label>
                        <input type="text" class="form-control" placeholder="userid" value="leess">
                      </div>
                    </div>
                    <div class="col-md-4 pl-md-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">이메일</label>
                        <input type="email" class="form-control" placeholder="leess@email.com">
                      </div>
                    </div>
                  </div>
                  
                  <div class="row"> 
                    <div class="col-md-3 pl-md-3">
                      <div class="form-group">
                        <label>생년월일</label>
                        <input type="date" class="form-control" placeholder="birthday" value="19870704">
                      </div>
                    </div>
                    <div class="col-md-3 pl-md-1">
                      <div class="form-group">
                        <label>나이</label>
                        <input type="number" class="form-control" placeholder="ZIP Code">
                      </div>
                    </div>
                     <div class="col-md-3 pl-md-1">
                      <div class="form-group">
                        <label>성별</label><br>
                       	<!-- <input type="checkbox" id="form-control" />남&nbsp;
                        <input type="checkbox" id="form-control" />여 -->
                        <input type="radio" id="male" name="gender" value="1" /><label for="male" style="margin-left: 2%;">남자</label>
			   			<input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-3 pr-md-1">
                      <div class="form-group">
                        <label>전화번호</label>
                        <input type="tel" class="form-control" placeholder="010-1111-2222">
                      </div>
                    </div>
                  </div>
                    
                  <div class="row">
                  <div class="col-md-3 pr-md-1">
                      <div class="form-group">
                        <label>우편번호</label>
                        <input type="number" class="form-control" placeholder="ZIP Code">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>주소</label>
                        <input type="text" class="form-control" placeholder="address1" value="도로명주소">
                      </div>
                    </div>
                     <div class="col-md-12">
                      <div class="form-group">
                        <input type="text" class="form-control" placeholder="address2" value="상세주소">
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-3 pr-md-1">
                      <div class="form-group">
                        <label>가입일자</label>
                        <input type="date" class="form-control" placeholder="registerdate" value="2018-11-26">
                      </div>
                    </div>
                    <div class="col-md-3 pl-md-1">
                      <div class="form-group">
                        <label>누적금액</label>
                        <input type="text" class="form-control" name="summoney" placeholder="summoney" value="0">
                      </div>
                    </div>
                    <div class="col-md-3 pl-md-1">
                      <div class="form-group">
                        <label>회원등급</label>
                        <input type="text" class="form-control" name="fk_lvnum" placeholder="fk_lvnum" value="bronze">
                      </div>
                    </div>
                  </div>
                
                 
                  <div class="row">
                    <div class="col-md-8">
                      <div class="form-group">
                        <label>그냥 입력기능</label>
                        <textarea rows="4" cols="80" class="form-control" placeholder="내용을 입력하세요." value="Mike">좋아보여</textarea>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <div class="card-footer">
                <button type="submit" class="btn btn-fill btn-primary">Save</button>
              </div>
            </div>
          </div>
        </div>
        
<jsp:include page="admin_footer.jsp"/> 