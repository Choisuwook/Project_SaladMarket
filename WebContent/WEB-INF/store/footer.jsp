<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String CtxPath = request.getContextPath(); %>
			<div id="colorlib-subscribe" style="margin-top: 3%;"></div><!-- 노란줄 -->
		</div>
<style type="text/css">/* footer style */
	#footer {
	border: 0px;
	width: 66%;
	margin-left: 17%;
	margin-top: 1%;
	}
	
	#footer .footer_cc {
    overflow: hidden;
    width: 100%;
    padding: 30px 10px;
    border-top: 1px solid #b7b7b7;
    border-bottom: 1px solid #b7b7b7;
	}
	
	#footer .tit_cc {
    font-weight: 700;
    font-size: 20px;
    line-height: 30px;
    color: #514859;
	}
	
	#footer .cc_view {
    float: left;
    width: 350px;
    padding-top: 9px;
	}
	
	#footer .cc_view h3 {
    overflow: hidden;
    width: 100%;
	}
	
	#footer .cc_view .tit {
    float: left;
    padding: 0 11px 10px 0;
    background: url(https://res.kurly.com/pc/img/1804/ico_arrow_12x18.png) no-repeat 100% 6px;
    background-size: 6px 9px;
    font-weight: 700;
    font-size: 14px;
    line-height: 20px;
    color: #512772;
	}
	
	#footer .footer_link {
    /*overflow: hidden;*/
    width: 100%;
    padding: 40px 0 50px 10px;
    
	}
	
	#footer .footer_link .link {
	float: left;
	border: 0px solid red;
    font-size: 14px;
    color: #514859;
    line-height: 20px;
    width: 200px;
    padding-top: 9px;
	}
	
	li {
    display: list-item;
    text-align: -webkit-match-parent;
    list-style-type: none;
	}
	
	#footer .footer_info {
    overflow: hidden;
    width: 100%;
    padding-left: 10px;
	}
	
	#footer .info_company {
    float: left;
    width: 400px;
    padding-bottom: 60px;
	}
	
	#footer .info_company .list {
    float: left;
    width: 100%;
    font-size: 12px;
    line-height: 15px;
    color: #949296;
    margin-bottom: 8px;
	}
	
	#footer .info_company dt {
    float: left;
    padding-right: 2px;
	}
	
	#footer .info_copy {
	/*border: 1px solid red;*/
    /*float: right;*/
    /*padding-right: 10px;*/
    text-align: right;
    margin-top: 10px;
    vertical-align: top;
	}
</style>
		<div id="footer">
			<div class="footer_cc" style="float: center; ">
			<h2 class="tit_cc">고객센터</h2> 
			<div class="cc_view cc_call">
			<h3><span class="tit">전화문의 (1577-6688)</span></h3>
			<dl class="list">
			<dt>평일</dt>
			<dd>오전 8시 - 오후 4시 <span class="sub">(점심시간 오후 12시 - 오후 1시)</span></dd>
			</dl>
			<dl class="list">
			<dt>토요일, 일요일 &amp; 공휴일</dt>
			<dd>오전 8시 - 오후 12시</dd>
			</dl>
			</div>
			<div class="cc_view cc_kakao" >
			<h3><a class="tit" href="#none">카카오톡 문의</a></h3>
			
			<dl class="list">
			<dt>평일</dt>
			<dd>오전 8시 - 오후 4시 <span class="sub">(점심시간 오후 12시 - 오후 1시)</span></dd>
			</dl>
			<dl class="list">
			<dt>토요일, 일요일 &amp; 공휴일</dt>
			<dd>오전 8시 - 오후 12시</dd>
			</dl>
			</div>
			<div class="cc_view cc_qna">
			<h3><a href="/shop/mypage/mypage_qna_register.php?mode=add_qna" class="tit">1:1 문의</a></h3>
			<p class="desc">
			궁금한 점이 있으신가요?<br>
			1:1 문의에 남겨주시면 친절히 답변 드리겠습니다.
			</p>
			</div>
			</div>
			<ul class="footer_link">
				<li><a class="link" href="/shop/introduce/about_kurly.php">마켓소개</a></li>
				<li><a class="link" href="/shop/service/guide.php">이용안내</a></li>
				<li><a class="link" href="/shop/service/agreement.php">이용약관</a></li>
				<li><a class="link" href="/shop/service/private.php">개인정보처리방침</a></li>
				<li><a class="link" href="https://marketkurly.recruiter.co.kr/appsite/company/index" target="_blank">인재채용</a></li>
			</ul>
		
			<div class="footer_info">
				<div class="info_company col-md-3" style="border: 0px solid red;">
					<dl class="list">
					<dt>법인명 (상호) :</dt>
					<dd>주식회사 마켓 수</dd>
					</dl>
					<dl class="list">
					<dt>대표자 (성명) :</dt>
					<dd>배수미 대표</dd>
					</dl>
					<dl class="list">
					<dt>개인정보보호책임자 :</dt>
					<dd>김혜원 (<a href="mailto:help@kurlycorp.com" target="_blank" class="emph">help@suecorp.com</a>)</dd>
					</dl>
					<dl class="list">
					<dt>사업자등록번호 :</dt>
					<dd class="emph">374-84-12347</dd>
					</dl>
					<dl class="list">
					<dt>통신판매업 :</dt>
					<dd>제 2018-서울청담-00001 호</dd>
					</dl>
				</div>
				
				<div class="info_company col-md-3" style="border: 0px solid red;">
					<dl class="list">
					<dt>입점문의 :</dt>
					<dd><a href="https://docs.google.com/forms/d/1snV875C0U6NdFCCOWqV3VwH4UdwcxZYNVokqg1VKJa4/viewform?edit_requested=true" target="_blank" class="emph">입점문의하기</a></dd>
					</dl>
					<dl class="list">
					<dt>마케팅제휴 :</dt>
					<dd><a href="mailto:marketing@kurlycorp.com" target="_blank" class="emph">marketing@suecorp.com</a></dd>
					</dl>
					<dl class="list">
					<dt>채용문의 :</dt>
					<dd><a href="mailto:recruit@kurlycorp.com" target="_blank" class="emph">recruit@suecorp.com</a></dd>
					</dl>
					<dl class="list">
					<dt>팩스 :</dt>
					<dd>070 - 7456 - 7876</dd>
					 </dl>
					<dl class="list">
					<dt>주소 :</dt>
					<dd><address>서울특별시 청담동 891-01번지, 혜원빌딩 B1~20F</address></dd>
					</dl>
				</div>
				
				<div class="info_copy col-md-4" style="border: 0px solid blue;">
				<a class="logo" href="/" style="float: left;"><img src="<%=CtxPath %>/store/images/index/logo.png" alt="마켓로고"></a>
				</div>
			</div>
		</div>	
	</div><!-- footer -->

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	<!-- jQuery Easing -->
	<script src="<%=CtxPath %>/store/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="<%=CtxPath %>/store/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=CtxPath %>/store/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="<%=CtxPath %>/store/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="<%=CtxPath %>/store/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="<%=CtxPath %>/store/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=CtxPath %>/store/js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="<%=CtxPath %>/store/js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="<%=CtxPath %>/store/js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="<%=CtxPath %>/store/js/main.js"></script>

	</body>
</html>