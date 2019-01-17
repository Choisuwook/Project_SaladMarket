<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="<%= ctxPath %>/assets/img/favicon.png">
  <title>
     상품 상세정보
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="<%= ctxPath %>/assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="<%= ctxPath %>/assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="<%= ctxPath %>/assets/demo/demo.css" rel="stylesheet" />

   <!--   Core JS Files   -->
  <script src="<%= ctxPath %>/assets/js/core/jquery.min.js"></script>
  <script src="<%= ctxPath %>/assets/js/core/popper.min.js"></script>
  <script src="<%= ctxPath %>/assets/js/core/bootstrap.min.js"></script>
  <script src="<%= ctxPath %>/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <!-- Place this tag in your head or just before your close body tag. -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="<%= ctxPath %>/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="<%= ctxPath %>/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="<%= ctxPath %>/assets/js/black-dashboard.min.js?v=1.0.0"></script>
  <!-- Black Dashboard DEMO methods, don't include it in your project! -->
  <script src="<%= ctxPath %>/assets/demo/demo.js"></script>

<script>

	function editEnd() {		
		var frm = document.productEditFrm;
		frm.method = "POST";
		frm.action = "a_productEditEnd.do";
		frm.submit();
		
	}// end of goDetail()----------------------------
</script>
  
  
</head>

<body class="">
<div class="container" style="margin-top: 3%;">
  	<div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="title">상품 수정</h5>
              </div>
              <div class="card-body">
                <form name="productEditFrm" enctype="multipart/form-data">
                  <div class="row">
                    <div class="col-md-2 pr-md-1">
                      <div class="dropdown">
					  <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	상품패키지명
					  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	소분류상세명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	카테고리태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	스펙태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                        <div class="dropdown">
					  	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					     	이벤트태그명
					 	 </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">1</a>
						    <a class="dropdown-item" href="#">2</a>
						    <a class="dropdown-item" href="#">3</a>
						  </div>
					  </div>
                    </div>
                    <div class="col-md-12 pl-md-8">
                      <div class="form-group">
                        <label>상품명</label>
                        <input type="text" class="form-control pname" name="panme" id="pname" >
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>원가</label>
                        <input type="text" class="form-control price" name="price" id="price">
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>판매가</label>
                        <input type="text" class="form-control saleprice" name="saleprice" id="saleprice" >
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>포인트</label>
                        <input type="text" class="form-control point" name="point" id="point" >
                      </div>
                    </div>
                    <div class="col-md-2 pl-md-1">
                      <div class="form-group">
                        <label>재고량</label>
                        <input type="text" class="form-control pqty" name="pqty" id="pqty" >
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-8 pl-md-3">
                      <div class="form-group">
                        <label>상품설명</label>
                        <textarea rows="4" cols="80" class="form-control pcontents" name="pcontents" id="pcontents" placeholder="설명을 입력하세요"></textarea>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                  	<div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>상품회사명</label>
                        <input type="text" class="form-control pcompanyname" name="pcompanyname" id="pcompanyname">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>유통기한</label>
                        <input type="text" class="form-control pexpiredate" name="pexpiredate" id="pexpiredate">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>알레르기정보</label>
                        <input type="text" class="form-control allergy" name="allergy" id="allergy">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>용량</label>
                        <input type="text" class="form-control weight" name="weight" id="weight">
                      </div>
                    </div>
                    <div class="col-md-2 pr-md-1">
                      <div class="form-group">
                        <label>상품회사명</label>
                        <input type="text" class="form-control pcompanyname" name="pcompanyname" id="pcompanyname">
                      </div>
                    </div>
                   </div>
                  
	              <label>제품이미지</label>
		              <ul style="list-style-type: none;">
		              	<li>
		              		<input type="file" name="pimage1" class="infodata btn btn-primary btn-simple"/>
		              	</li>
		              	<li>
		                    <input type="file" name="pimage2" class="infodata btn btn-primary btn-simple"/>
		                </li>
		              	<li>
		                	<input type="file" name="pimage3" class="infodata btn btn-primary btn-simple"/>
		              	</li>
		              </ul>
                </form>
              </div>
              
              <div class="card-footer text-center">
                <button type="button" class="btn btn-fill btn-primary" OnClick="editEnd()">수정하기</button>
              </div>
            </div>
           
          </div>
        </div>
      </div>
</body>
</html>