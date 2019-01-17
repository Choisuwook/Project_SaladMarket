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

	function goEdit() {
		
		var frm = document.productDetailFrm;
		frm.method = "POST";
		frm.action = "a_productEdit.do";
		frm.submit();
		
	}// end of goDetail()----------------------------
</script>
  
  
</head>

<body class="">
<div class="container" style="margin-top: 3%;">
        <div class="row">
          <div class="col-md-12">
          <form name="productDetailFrm">
            <div class="card">
              <div class="card-header mb-5">
                <h3 class="card-title">상품 상세 정보</h3>
              </div>
              <div class="card-body">
                <div class="typography-line">
                  <h4>
                    <span>상품번호</span>1</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>상품패키지명</span>[퀸즈프레시] 프리미엄 샐러드 3종</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>대분류</span>샐러드</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>소분류</span>샐러드도시락</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>카테고리태그</span>다이어트용</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>스펙태그</span>HIT</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>이벤트태그</span>크리스마스 이벤트</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>상품명</span>베리&리코타</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>원가</span>6,900원</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>판매가</span>6,900원</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>포인트</span>690point</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>재고량</span>100</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>납품회사</span>queensfresh</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>유통기한</span>제조일로부터 5일</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>용량</span>245g</h4>
                </div>
                <div class="typography-line"></div>
                <div class="typography-line">
                  <h4>
                    <span>판매량</span>30</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>좋아요수</span>30</h4>
                </div>
                <div class="typography-line">
                  <h4>
                    <span>상품등록일자</span>2018-11-28</h4>
                </div>
                <div class="typography-line">
                  <p>
                  <span>알레르기 정보</span>
                   	 난류, 땅콩, 소고기, 닭고기, 새우와 같은 시설에서 생산
                  </p>
                </div>
                <div class="typography-line">
                  <p>
                    <span>상품 상세 설명</span>
                      	리코타 치즈는 부드러운 질감과 고소하면서도 살짝 시큼한 맛이 여심을 저격하는 대표 음식으로 칼슘은 물론 오메가 3와 6가 풍부하죠.<br/>
                      	여기에 상큼한 맛이 톡 튀며 즐거움을 안기는 아로니아, 블루베리, 크랜베리 등을 담아 칼로리 부담을 낮췄어요.<br/>
                      	베리류에는 비타민, 안토시아닌 등의 성분이 풍부하답니다.<br/>
                      	이탈리아산 포도 과즙으로 만들어진 발사믹 드레싱은 샐러드의 산뜻함을 한층 더해 줄 거예요.<br/>
                   		<img src="<%= ctxPath %>/img/berry_ricotta.jpg" style="width: 30%;">
                  </p>
                </div>
                <div class="button" align="center">
                	<button class="btn btn-primary animation-on-hover" type="button" OnClick="goEdit();">수정하기</button>
                	<button class="btn btn-danger animation-on-hover" type="button">삭제하기</button>
                </div>
              </div>
            </div>
            </form>
          </div>
        </div>
      </div>
</body>
</html>