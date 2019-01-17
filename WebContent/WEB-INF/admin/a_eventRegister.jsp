<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp"/> 

  <div class="row">
  		  <div class="col-md-3"></div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="title">이벤트 등록</h5>
              </div>
              <div class="card-body">
                <form name="categoryFrm" >
                    <div class="col-md-12 pl-md-8">
                      <div class="form-group">
                        <label>이벤트명</label>
                        <input type="text" class="form-control etname" name="etname" id="etname" >
                      </div>
                    </div>
                    
                    <div class="col-md-12 pl-md-8">
                        <label>이벤트이미지</label><br/>
                 		<input type="file" name="etimagefilename" class="infodata"/>
                    </div>
                    
                    <div class="col-md-12 pl-md-12" align="center">
               		 	<button type="button" class="btn btn-fill btn-primary">등록</button>
                    </div>
                </form>
              	</div>
              
              </div>
          </div>
     </div>

<jsp:include page="admin_footer.jsp"/> 