<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
		// /MyWeb
%>
<!DOCTYPE html>
<html>
<head>

<title>:::HOMEPAGE:::</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/jquery-ui-1.11.4.custom/jquery-ui.min.css" /> 
<script type="text/javascript" src="<%= ctxPath %>/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script> 

<script type="text/javascript">
 	$(document).ready(function(){
		
		var vhtml = "";
		for(var i=0; i<15; i++) {
			vhtml += (i+1)+".내용물<br/>";
		}
		
		//$("#sideconent").html(vhtml);
		
	});
 
</script>

</head>
<body>
<div class="row">
    <div class="col-md-3 space-sm-4">
      <div class="sidenav">
  <ul class="sidenav-list">
    <li>
      <a href="https://www.airbnb.co.kr/users/edit/231754930" aria-selected="true" class="sidenav-item">프로필 수정</a>
    </li>
    <li>
      <a href="https://www.airbnb.co.kr/users/edit/231754930?section=media" aria-selected="false" class="sidenav-item">사진</a>
    </li>
    <li>
      <a href="https://www.airbnb.co.kr/users/edit_verification/231754930" aria-selected="false" class="sidenav-item">인증 현황</a>
    </li>
    <li>
      <a href="https://www.airbnb.co.kr/users/reviews/231754930" aria-selected="false" class="sidenav-item">후기</a>
    </li>
    <li>
      <a href="https://www.airbnb.co.kr/users/references/231754930" aria-selected="false" class="sidenav-item">추천글</a>
    </li>
    <li>
    </li>
  </ul>
</div>


      <a href="/users/show/231754930" class="btn btn-block space-top-4">프로필 보기</a>
    </div>
    <div class="col-md-9">
      
      <div id="dashboard-content">
        



<form accept-charset="UTF-8" action="/update/231754930" data-hook="update-profile-form" enctype="multipart/form-data" id="update_form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="V4$.airbnb.co.kr$jk61MSGPzxc$rxUh2p_3LTE_mWMb45e7Pp8TnvNAKTVWzbBgKAtL2tI="></div>







<h1 class="screen-reader-only">
  프로필 수정
</h1>

<div class="panel space-4">
  <div class="panel-header">
    <h2 class="edit-profile-section-heading">
      필수사항
    </h2>
  </div>
  <div class="panel-body">
    <input type="hidden" name="password" id="user_email_password" value="">

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_first_name">
          이름(예: 길동) 
        </label>
        <div class="col-sm-9">
          
      <input id="user_first_name" name="user[first_name]" size="30" type="text" value="Suwook">

          
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_last_name">
          성(예: 홍) 
        </label>
        <div class="col-sm-9">
          
      <input id="user_last_name" name="user[last_name]" size="30" type="text" value="Choi">

          <div class="text-muted space-top-1">공개 프로필에는 성을 제외한 이름만 표시됩니다. 예약 요청 시 호스트는 회원님의 성과 이름을 모두 확인할 수 있습니다.</div>
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_sex">
          성별 <i aria-label="비공개" class="icon icon-lock icon-ebisu" data-behavior="tooltip" role="img" tabindex="0"></i>
        </label>
        <div class="col-sm-9">
          
      <div class="select">
        <select id="user_sex" name="user[sex]"><option value="" selected="selected">성별</option>
<option value="Male">남자</option>
<option value="Female">여자</option>
<option value="Other">기타</option></select>
      </div>

          <div class="text-muted space-top-1">이 정보는 통계 목적으로 사용되며 다른 회원들에게 절대 공개되지 않습니다.</div>
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_birthdate">
          생년월일 <i aria-label="비공개" class="icon icon-lock icon-ebisu" data-behavior="tooltip" role="img" tabindex="0"></i>
        </label>
        <div class="col-sm-9">
          
        <fieldset>
          <legend class="screen-reader-only">생년월일</legend>
          <div class="select">
            <select aria-label="월" id="user_birthdate_2i" name="user[birthdate(2i)]">
<option value="">월</option>
<option value="1">1월</option>
<option value="2">2월</option>
<option value="3">3월</option>
<option selected="selected" value="4">4월</option>
<option value="5">5월</option>
<option value="6">6월</option>
<option value="7">7월</option>
<option value="8">8월</option>
<option value="9">9월</option>
<option value="10">10월</option>
<option value="11">11월</option>
<option value="12">12월</option>
</select>

          </div>
          <div class="select">
            <select aria-label="일" id="user_birthdate_3i" name="user[birthdate(3i)]">
<option value="">일</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option selected="selected" value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
</select>

          </div>
          <div class="select">
            <select aria-label="년" id="user_birthdate_1i" name="user[birthdate(1i)]">
<option value="">년</option>
<option value="2018">2018</option>
<option value="2017">2017</option>
<option value="2016">2016</option>
<option value="2015">2015</option>
<option value="2014">2014</option>
<option value="2013">2013</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
<option value="2009">2009</option>
<option value="2008">2008</option>
<option value="2007">2007</option>
<option value="2006">2006</option>
<option value="2005">2005</option>
<option value="2004">2004</option>
<option value="2003">2003</option>
<option value="2002">2002</option>
<option value="2001">2001</option>
<option value="2000">2000</option>
<option value="1999">1999</option>
<option value="1998">1998</option>
<option value="1997">1997</option>
<option value="1996">1996</option>
<option value="1995">1995</option>
<option value="1994">1994</option>
<option value="1993">1993</option>
<option selected="selected" value="1992">1992</option>
<option value="1991">1991</option>
<option value="1990">1990</option>
<option value="1989">1989</option>
<option value="1988">1988</option>
<option value="1987">1987</option>
<option value="1986">1986</option>
<option value="1985">1985</option>
<option value="1984">1984</option>
<option value="1983">1983</option>
<option value="1982">1982</option>
<option value="1981">1981</option>
<option value="1980">1980</option>
<option value="1979">1979</option>
<option value="1978">1978</option>
<option value="1977">1977</option>
<option value="1976">1976</option>
<option value="1975">1975</option>
<option value="1974">1974</option>
<option value="1973">1973</option>
<option value="1972">1972</option>
<option value="1971">1971</option>
<option value="1970">1970</option>
<option value="1969">1969</option>
<option value="1968">1968</option>
<option value="1967">1967</option>
<option value="1966">1966</option>
<option value="1965">1965</option>
<option value="1964">1964</option>
<option value="1963">1963</option>
<option value="1962">1962</option>
<option value="1961">1961</option>
<option value="1960">1960</option>
<option value="1959">1959</option>
<option value="1958">1958</option>
<option value="1957">1957</option>
<option value="1956">1956</option>
<option value="1955">1955</option>
<option value="1954">1954</option>
<option value="1953">1953</option>
<option value="1952">1952</option>
<option value="1951">1951</option>
<option value="1950">1950</option>
<option value="1949">1949</option>
<option value="1948">1948</option>
<option value="1947">1947</option>
<option value="1946">1946</option>
<option value="1945">1945</option>
<option value="1944">1944</option>
<option value="1943">1943</option>
<option value="1942">1942</option>
<option value="1941">1941</option>
<option value="1940">1940</option>
<option value="1939">1939</option>
<option value="1938">1938</option>
<option value="1937">1937</option>
<option value="1936">1936</option>
<option value="1935">1935</option>
<option value="1934">1934</option>
<option value="1933">1933</option>
<option value="1932">1932</option>
<option value="1931">1931</option>
<option value="1930">1930</option>
<option value="1929">1929</option>
<option value="1928">1928</option>
<option value="1927">1927</option>
<option value="1926">1926</option>
<option value="1925">1925</option>
<option value="1924">1924</option>
<option value="1923">1923</option>
<option value="1922">1922</option>
<option value="1921">1921</option>
<option value="1920">1920</option>
<option value="1919">1919</option>
<option value="1918">1918</option>
</select>

          </div>
        </fieldset>

          <div class="text-muted space-top-1">이 정보는 통계 목적으로 사용되며 다른 회원들에게 절대 공개되지 않습니다.</div>
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_email">
          이메일 주소 <i aria-label="비공개" class="icon icon-lock icon-ebisu" data-behavior="tooltip" role="img" tabindex="0"></i>
        </label>
        <div class="col-sm-9">
          
        <input id="user_email" name="user[email]" size="30" type="text" value="fine2656@gmail.com">

          <div class="text-muted space-top-1">이메일 주소는 다른 에어비앤비 회원에게 공개되지 않습니다. <a href="/help/article/694" target="blank">더 알아보기</a>.</div>
        </div>
      </div>

      <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_phone_numbers">
          전화번호
        </label>
        <div class="col-sm-9">
          <style data-aphrodite="data-aphrodite">._1k01n3v1{color:#008489 !important;font:inherit !important;font-family:Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;text-decoration:none !important;-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;cursor:pointer !important;margin:0px !important;padding:0px !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;text-align:left !important;}._1k01n3v1:hover{text-decoration:underline !important;color:#008489 !important;}._1k01n3v1:focus{text-decoration:underline !important;}@supports(--custom: properties){._1k01n3v1{color:var(--color-text-link, #008489) !important;font-family:var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;}._1k01n3v1:hover{color:var(--color-text-link-hover, #008489) !important;}._1k01n3v1:active{color:var(--color-text-link-active, #006C70) !important;}}._1k01n3v1:active{color:#006C70 !important;outline:0px !important;}</style>
<div data-hypernova-key="edit_profilephone_numbersbundlejs" data-hypernova-id="d04a6e6f-46f6-4b89-84ee-8f54ae6bb13f"><div dir="ltr" data-reactroot=""><div style="margin-top:9px"><div><strong>입력된 전화번호가 없습니다.</strong><div style="margin-top:4px"><div class="text-muted">예약 요청, 미리 알림 및 기타 알림을 보내드립니다.</div></div><div style="margin-top:8px"><button type="button" class="_1k01n3v1" aria-busy="false">전화번호 입력</button></div></div></div></div></div>
<script type="application/json" data-hypernova-key="edit_profilephone_numbersbundlejs" data-hypernova-id="d04a6e6f-46f6-4b89-84ee-8f54ae6bb13f"><!--{"bootstrapData":{"reduxData":{"existingPhoneNumbers":[],"canAddPhoneNumber":true,"isHost":false}},"phrases":{"shared.government_id":"정부 발행 신분증","shared.confirmed":"확인됨","shared.remove":"삭제","shared.removed":"삭제됨","shared.cancel":"취소","shared.identification":"신분증","shared.private":"사생활 보장","shared.OK":"확인","shared.Learn_more":"더 알아보기","edit_profile.verifications.footnote":"신분증 정보 제공을 완료하셨습니다. %{link_start}자세히 알아보기%{link_end}","edit_profile.verifications.footnote.removed":"예약을 하려면 필수적으로 신분증을 제공해야 합니다. 여권이나 사진을 삭제하여 예정된 예약이 모두 취소되었으며, 다음 예약을 할 때 다시 제출해야 합니다. %{link_start}자세히 알아보세요.%{link_end}","identity_verified.modal.title.remove_id":"신분증 삭제","identity_verified.modal.body.are_you_sure":"정말 삭제하시겠어요?","identity_verified.modal.body.if_you_remove":"이 신분증을 삭제하면 예정된 예약이 모두 삭제됩니다. 또한 다음 예약 전에 신분증을 다시 스캔하여 제출해야 합니다.","identity_verified.modal.body.you_can_remove":"가장 최근 예약이 완료되고 90일이 지난 후 신분증을 삭제할 수 있습니다.","edit_profile.emergency_contact.edit":"수정","shared.Emergency Contact":"긴급 연락처","edit_profile.emergency_contact.intro_text":"고객지원 팀에서 긴급 상황시 연락할 수 있도록 신뢰하는 사람의 연락처를 제공하여 주세요.","edit_profile.emergency_contact.add_contact":"연락처 추가하기","shared.Emergency Contact Phone":"전화","shared.Emergency Contact Name":"이름","shared.Emergency Contact Relationship":"관계","shared.Emergency Contact Email":"이메일","edit_profile.label next to choice of preferred language of Airbnb communications":"선호하는 언어","edit_profile.guest_identifications.privacy_explanation":"이 정보는 중국으로 여행할 시에만 필요하며 호스트 및 다른 게스트와는 공유되지 않습니다.","edit_profile.guest_identifications.guest_profiles":"게스트 프로필","edit_profile.guest_identifications.remove":"삭제","edit_profile.guest_identifications.add_new_profile":"새로운 게스트 프로필 추가하기","user_profile.china_transparency.header":"거주 국가 확인","user_profile.china_transparency.p1":"에어비앤비의 기록에 따르면 현재 회원님의 거주 국가는 중국입니다. 회원님의 정보는 Airbnb China에 전송, 저장 및 처리됩니다. 에어비앤비는 중국에서 운영되는 다른 모든 기업과 마찬가지로 개인정보 및 정보 공개 법을 포함한 현지 법규를 준수해야 합니다.","user_profile.china_transparency.p2":"중국에 거주하지 않으면 프로필의 \"거주 국가\" 섹션을 업데이트하세요.","edit_profile.code_input_screen.title":"보안 코드를 입력하세요","edit_profile.code_input_screen.try_again":"다시 시도하기","edit_profile.code_input_screen.verify":"인증","edit_profile.code_input_screen.phone_call.subtitle":"전화(%{phone_number})로 코드를 안내해드리겠습니다.","edit_profile.code_input_screen.phone_call.retry_label":"전화를 못 받으셨나요?","edit_profile.code_input_screen.phone_call.other_option_label":"문자 메시지 받기","edit_profile.code_input_screen.text.subtitle":"전화(%{phone_number})로 코드가 전송되었습니다. 몇 분 정도 걸릴 수 있어요.","edit_profile.code_input_screen.text.retry_label":"코드를 못 받으셨나요?","edit_profile.code_input_screen.text.other_option_label":"전화 받기","edit_profile.contact_phone_introduction.title":"게스트가 이 전화(%{phone_number})로 연락해도 되나요?","edit_profile.contact_phone_introduction.subtitle":"이 번호는 예약한 게스트에게만 공개됩니다.","edit_profile.contact_phone_introduction.yes_button":"예, 게스트가 전화해도 됩니다","edit_profile.contact_phone_introduction.no_button":"아니요, 게스트에게 공개될 전화번호를 입력하세요","edit_profile.phone_number_input.contact.title":"게스트가 연락할 수 있는 번호를 알려주세요.","edit_profile.phone_number_input.contact.subtitle":"이 전화번호의 인증도 필요합니다.","edit_profile.phone_number_input.verification.title":"전화번호 추가하기","edit_profile.phone_number_input.verification.subtitle":"이 전화번호로 알림을 보내드립니다.","edit_profile.phone_number_input.verify_via_sms":"문자로 인증하기","edit_profile.phone_number_input.verify_via_phone_button":"전화로 인증","edit_profile.phone_number_input.why_verify":"인증이 왜 필요한가요?","edit_profile.phone_number_row.verify_now":"지금 인증","edit_profile.phone_number_row.not_verified":"인증되지 않음","edit_profile.phone_number_row.remove":"삭제하기","edit_profile.phone_numbers_section.no_phone_number.title":"입력된 전화번호가 없습니다.","edit_profile.phone_numbers_section.no_phone_number.subtitle":"예약 요청, 미리 알림 및 기타 알림을 보내드립니다.","edit_profile.phone_numbers_section.verification_and_contact.subtitle":"게스트 연락처, 예약 요청, 미리 알림 및 기타 알림.","edit_profile.phone_numbers_section.verification_only.subtitle":"이 번호로 예약 요청, 미리 알림 및 기타 알림을 보내드립니다.","edit_profile.phone_numbers_section.contact_only.subtitle":"예약한 게스트가 호스트님에게 직접 연락하려면 이 번호를 사용하게 됩니다.","edit_profile.phone_numbers_section.add new number":"전화번호 입력","edit_profile.phone_numbers.generic_error_message":"죄송합니다. 오류가 발생했습니다. 다시 시도해 주세요."},"trebuchets":{},"breakpointCookie":"4","themeId":1,"i18nInit":{"locale":"ko","language":"ko","moment_locale":"ko","country":"KR","tld_country":"KR","currencies":[{"code":"ZAR","id":"ZAR","localized_full_name":"남아프리카공화국 란드","name":"Rand","symbol":"R","unicode_symbol":"R","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"NOK","id":"NOK","localized_full_name":"노르웨이 크로네","name":"Krone","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"NZD","id":"NZD","localized_full_name":"뉴질랜드 달러","name":"New Zealand Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"DKK","id":"DKK","localized_full_name":"덴마크 크로네","name":"Danish Kroner","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"RUB","id":"RUB","localized_full_name":"러시아 루블","name":"Rubles","symbol":"&amp;#1088;","unicode_symbol":"₽","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":false},{"code":"RON","id":"RON","localized_full_name":"루마니아 레우","name":"New Lei","symbol":"lei","unicode_symbol":"lei","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MYR","id":"MYR","localized_full_name":"말레이시아 링깃","name":"Ringgits","symbol":"&amp;#82;&amp;#77;","unicode_symbol":"RM","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MXN","id":"MXN","localized_full_name":"멕시코 페소","name":"Mexican Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MAD","id":"MAD","localized_full_name":"모로코 디르함","name":"Moroccan Dirham","symbol":"MAD","unicode_symbol":"MAD","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"USD","id":"USD","localized_full_name":"미국 달러","name":"United States Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"VND","id":"VND","localized_full_name":"베트남 동","name":"Vietnamese Dong","symbol":"&amp;#8363;","unicode_symbol":"₫","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BGN","id":"BGN","localized_full_name":"불가리아 레프","name":"Bulgarian Leva","symbol":"&amp;#1083;&amp;#1074;","unicode_symbol":"лв","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BRL","id":"BRL","localized_full_name":"브라질 레알","name":"Brazilian Reais","symbol":"R$","unicode_symbol":"R$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SAR","id":"SAR","localized_full_name":"사우스아라비아 리얄","name":"Saudi Riyal","symbol":"SR","unicode_symbol":"SR","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SEK","id":"SEK","localized_full_name":"스웨덴 크로나","name":"Sweden, Kronor","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CHF","id":"CHF","localized_full_name":"스위스 프랑","name":"Swiss Francs","symbol":"CHF","unicode_symbol":"CHF","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":true,"position":"after","space_between_price_and_symbol":true},{"code":"TWD","id":"TWD","localized_full_name":"신 타이완 달러","name":"Taiwan Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SGD","id":"SGD","localized_full_name":"싱가포르 달러","name":"Singapore, Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AED","id":"AED","localized_full_name":"아랍에미리트 디르함","name":"United Arab Emirates Dirham","symbol":"&amp;#1583;.&amp;#1573;","unicode_symbol":"ﺩ.ﺇ","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"ARS","id":"ARS","localized_full_name":"아르헨티나 페소","name":"Argentinian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"GBP","id":"GBP","localized_full_name":"영국 파운드","name":"Pounds Sterling","symbol":"&amp;pound;","unicode_symbol":"£","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UYU","id":"UYU","localized_full_name":"우루과이 페소","name":"Uruguayan Pesos","symbol":"&amp;#36;&amp;#85;","unicode_symbol":"$U","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UAH","id":"UAH","localized_full_name":"우크라이나 그리브나","name":"Ukrainian hryvnia","symbol":"&amp;#8372;","unicode_symbol":"₴","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"EUR","id":"EUR","localized_full_name":"유로","name":"Euro","symbol":"&amp;euro;","unicode_symbol":"€","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"special","space_between_price_and_symbol":false},{"code":"ILS","id":"ILS","localized_full_name":"이스라엘 신 셰켈","name":"New Shekels","symbol":"&amp;#8362;","unicode_symbol":"₪","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"INR","id":"INR","localized_full_name":"인도 루피","name":"Indian Rupee","symbol":"&amp;#8377;","unicode_symbol":"₹","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"IDR","id":"IDR","localized_full_name":"인도네시아 루피아","name":"Indonesian Rupiah","symbol":"Rp","unicode_symbol":"Rp","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"JPY","id":"JPY","localized_full_name":"일본 엔","name":"Yen","symbol":"&amp;yen;","unicode_symbol":"¥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":true},{"code":"CNY","id":"CNY","localized_full_name":"중국 위안","name":"Chinese Yuan","symbol":"&amp;#65509;","unicode_symbol":"￥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CZK","id":"CZK","localized_full_name":"체코 코루나","name":"Czech Koruny","symbol":"&amp;#75;&amp;#269;","unicode_symbol":"Kč","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CLP","id":"CLP","localized_full_name":"칠레 페소","name":"Chilean Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CAD","id":"CAD","localized_full_name":"캐나다 달러","name":"Canadian Dollar","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CRC","id":"CRC","localized_full_name":"코스타리카 콜론","name":"Colon","symbol":"&amp;#8353;","unicode_symbol":"₡","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"COP","id":"COP","localized_full_name":"콜롬비아 페소","name":"Columbian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HRK","id":"HRK","localized_full_name":"크로아티아 쿠나","name":"Croatian Kuna","symbol":"kn","unicode_symbol":"kn","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"THB","id":"THB","localized_full_name":"태국 바트","name":"Baht","symbol":"&amp;#3647;","unicode_symbol":"฿","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"TRY","id":"TRY","localized_full_name":"터키 리라","name":"Turkish Lira","symbol":"&amp;#84;&amp;#76;","unicode_symbol":"₺","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PEN","id":"PEN","localized_full_name":"페루 솔","name":"Nuevos Soles","symbol":"&amp;#83;&amp;#47;","unicode_symbol":"S/","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"PLN","id":"PLN","localized_full_name":"폴란드 즐로티","name":"Zlotych","symbol":"z&amp;#22;&amp;#322;","unicode_symbol":"zł","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PHP","id":"PHP","localized_full_name":"필리핀 페소","name":"Philippines Peso","symbol":"&amp;#8369;","unicode_symbol":"₱","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"KRW","id":"KRW","localized_full_name":"한국 원","name":"South Korean Won","symbol":"&amp;#8361;","unicode_symbol":"₩","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HUF","id":"HUF","localized_full_name":"헝가리 포린트","name":"Forint","symbol":"Ft","unicode_symbol":"Ft","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AUD","id":"AUD","localized_full_name":"호주 달러","name":"Australian Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HKD","id":"HKD","localized_full_name":"홍콩 달러","name":"Hong Kong Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false}],"current_locale_name":"한국어","languages":[{"locale_name":"Bahasa Indonesia","locale":"id"},{"locale_name":"Bahasa Melayu","locale":"ms"},{"locale_name":"Català","locale":"ca"},{"locale_name":"Dansk","locale":"da"},{"locale_name":"Deutsch","locale":"de"},{"locale_name":"English","locale":"en"},{"locale_name":"Español","locale":"es"},{"locale_name":"Eλληνικά","locale":"el"},{"locale_name":"Français","locale":"fr"},{"locale_name":"Hrvatski","locale":"hr"},{"locale_name":"Italiano","locale":"it"},{"locale_name":"Magyar","locale":"hu"},{"locale_name":"Nederlands","locale":"nl"},{"locale_name":"Norsk","locale":"no"},{"locale_name":"Polski","locale":"pl"},{"locale_name":"Português","locale":"pt"},{"locale_name":"Suomi","locale":"fi"},{"locale_name":"Svenska","locale":"sv"},{"locale_name":"Türkçe","locale":"tr"},{"locale_name":"Íslenska","locale":"is"},{"locale_name":"Čeština","locale":"cs"},{"locale_name":"Русский","locale":"ru"},{"locale_name":"ภาษาไทย","locale":"th"},{"locale_name":"中文 (简体)","locale":"zh"},{"locale_name":"中文 (繁體)","locale":"zh-TW"},{"locale_name":"日本語","locale":"ja"},{"locale_name":"한국어","locale":"ko"}],"base_direction":"ltr","request_host":"www.airbnb.co.kr"}}--></script>
<script type="application/json" data-aphrodite-css="edit_profile/phone_numbers.bundle.js"><!--["_1k01n3v1"]--></script>
        </div>
      </div>


          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_profile_info_preferred_language">
          선호하는 언어 
        </label>
        <div class="col-sm-9">
          
      <div class="select">
        <select id="user_profile_info_preferred_language" name="user[preferred_locale]"><option value="id">Bahasa Indonesia</option>
<option value="ms">Bahasa Melayu</option>
<option value="ca">Català</option>
<option value="da">Dansk</option>
<option value="de">Deutsch</option>
<option value="en">English</option>
<option value="es">Español</option>
<option value="el">Eλληνικά</option>
<option value="fr">Français</option>
<option value="hr">Hrvatski</option>
<option value="it">Italiano</option>
<option value="hu">Magyar</option>
<option value="nl">Nederlands</option>
<option value="no">Norsk</option>
<option value="pl">Polski</option>
<option value="pt">Português</option>
<option value="fi">Suomi</option>
<option value="sv">Svenska</option>
<option value="tr">Türkçe</option>
<option value="is">Íslenska</option>
<option value="cs">Čeština</option>
<option value="ru">Русский</option>
<option value="th">ภาษาไทย</option>
<option value="zh">中文 (简体)</option>
<option value="zh-TW">中文 (繁體)</option>
<option value="ja">日本語</option>
<option value="ko" selected="selected">한국어</option></select>
      </div>

          <div class="text-muted space-top-1">이 언어로 메시지를 보내겠습니다.</div>
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_profile_info_preferred_currency">
          선호하는 통화 단위 
        </label>
        <div class="col-sm-9">
          
      <div class="select">
        <select id="user_profile_info_preferred_currency" name="user[native_currency]"><option value="ZAR">남아프리카공화국 란드</option>
<option value="NOK">노르웨이 크로네</option>
<option value="NZD">뉴질랜드 달러</option>
<option value="DKK">덴마크 크로네</option>
<option value="RUB">러시아 루블</option>
<option value="RON">루마니아 레우</option>
<option value="MYR">말레이시아 링깃</option>
<option value="MXN">멕시코 페소</option>
<option value="MAD">모로코 디르함</option>
<option value="USD">미국 달러</option>
<option value="BGN">불가리아 레프</option>
<option value="BRL">브라질 레알</option>
<option value="SAR">사우스아라비아 리얄</option>
<option value="SEK">스웨덴 크로나</option>
<option value="CHF">스위스 프랑</option>
<option value="TWD">신 타이완 달러</option>
<option value="SGD">싱가포르 달러</option>
<option value="AED">아랍에미리트 디르함</option>
<option value="GBP">영국 파운드</option>
<option value="UYU">우루과이 페소</option>
<option value="EUR">유로</option>
<option value="ILS">이스라엘 신 셰켈</option>
<option value="INR">인도 루피</option>
<option value="JPY">일본 엔</option>
<option value="CNY">중국 위안</option>
<option value="CZK">체코 코루나</option>
<option value="CLP">칠레 페소</option>
<option value="CAD">캐나다 달러</option>
<option value="CRC">코스타리카 콜론</option>
<option value="COP">콜롬비아 페소</option>
<option value="HRK">크로아티아 쿠나</option>
<option value="THB">태국 바트</option>
<option value="TRY">터키 리라</option>
<option value="PEN">페루 솔</option>
<option value="PLN">폴란드 즐로티</option>
<option value="PHP">필리핀 페소</option>
<option value="KRW" selected="selected">한국 원</option>
<option value="HUF">헝가리 포린트</option>
<option value="AUD">호주 달러</option>
<option value="HKD">홍콩 달러</option></select>
      </div>

          <div class="text-muted space-top-1">이 통화 단위로 요금이 표시됩니다.</div>
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_profile_info_current_city">
          거주 도시 
        </label>
        <div class="col-sm-9">
          
      <input id="user_profile_info_current_city" name="user_profile_info[current_city]" placeholder="예: 프랑스 파리, 뉴욕 브루클린, 일리노이주 시카고" size="30" type="text" value="">

          
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_profile_info_about">
          자기소개 
        </label>
        <div class="col-sm-9">
          
      <textarea cols="40" id="user_profile_info_about" name="user_profile_info[about]" rows="5"></textarea>

          <div class="text-muted space-top-1">에어비앤비는 사람들 간의 관계를 기반으로 만들어졌습니다. 회원님이 어떤 사람인지 알려주세요. <br><br> 어떤 것들을 좋아하는지 알려주세요. 가장 좋아하는 여행지, 책, 영화, TV 프로그램, 음악, 음식 등 뭐든지 좋습니다.<br><br> 회원님은 어떤 스타일의 게스트 또는 호스트인가요? <br><br> 인생의 좌우명은 무엇인가요?</div>
        </div>
      </div>
  </div>
</div>


<div class="panel space-4">
  <div class="panel-header">
    <h2 class="edit-profile-section-heading">
      선택사항
    </h2>
  </div>
  <div class="panel-body">
          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_profile_info_university">
          학교 
        </label>
        <div class="col-sm-9">
          
      <input id="user_profile_info_university" name="user_profile_info[university]" size="30" type="text" value="">

          
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_profile_info_employer">
          직업 
        </label>
        <div class="col-sm-9">
          
      <input id="user_profile_info_employer" name="user_profile_info[employer]" placeholder="회사 이름 또는 직함" size="30" type="text" value="">

          
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_preference_time_zone">
          시간대 
        </label>
        <div class="col-sm-9">
          
      <div class="select">
        <select id="user_preference_time_zone" name="user_preference[time_zone]"><option value=""></option>
<option value="International Date Line West">(GMT-11:00) International Date Line West</option>
<option value="Midway Island">(GMT-11:00) Midway Island</option>
<option value="Samoa">(GMT-11:00) Samoa</option>
<option value="Hawaii">(GMT-10:00) Hawaii</option>
<option value="Alaska">(GMT-09:00) Alaska</option>
<option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
<option value="Tijuana">(GMT-08:00) Tijuana</option>
<option value="Arizona">(GMT-07:00) Arizona</option>
<option value="Chihuahua">(GMT-07:00) Chihuahua</option>
<option value="Mazatlan">(GMT-07:00) Mazatlan</option>
<option value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
<option value="Central America">(GMT-06:00) Central America</option>
<option value="Central Time (US &amp; Canada)">(GMT-06:00) Central Time (US &amp; Canada)</option>
<option value="Guadalajara">(GMT-06:00) Guadalajara</option>
<option value="Mexico City">(GMT-06:00) Mexico City</option>
<option value="Monterrey">(GMT-06:00) Monterrey</option>
<option value="Saskatchewan">(GMT-06:00) Saskatchewan</option>
<option value="Bogota">(GMT-05:00) Bogota</option>
<option value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
<option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
<option value="Lima">(GMT-05:00) Lima</option>
<option value="Quito">(GMT-05:00) Quito</option>
<option value="Atlantic Time (Canada)">(GMT-04:00) Atlantic Time (Canada)</option>
<option value="Caracas">(GMT-04:00) Caracas</option>
<option value="Georgetown">(GMT-04:00) Georgetown</option>
<option value="La Paz">(GMT-04:00) La Paz</option>
<option value="Santiago">(GMT-04:00) Santiago</option>
<option value="Newfoundland">(GMT-03:30) Newfoundland</option>
<option value="Brasilia">(GMT-03:00) Brasilia</option>
<option value="Buenos Aires">(GMT-03:00) Buenos Aires</option>
<option value="Greenland">(GMT-03:00) Greenland</option>
<option value="Mid-Atlantic">(GMT-02:00) Mid-Atlantic</option>
<option value="Azores">(GMT-01:00) Azores</option>
<option value="Cape Verde Is.">(GMT-01:00) Cape Verde Is.</option>
<option value="Edinburgh">(GMT+00:00) Edinburgh</option>
<option value="Lisbon">(GMT+00:00) Lisbon</option>
<option value="London">(GMT+00:00) London</option>
<option value="Monrovia">(GMT+00:00) Monrovia</option>
<option value="UTC">(GMT+00:00) UTC</option>
<option value="Amsterdam">(GMT+01:00) Amsterdam</option>
<option value="Belgrade">(GMT+01:00) Belgrade</option>
<option value="Berlin">(GMT+01:00) Berlin</option>
<option value="Bern">(GMT+01:00) Bern</option>
<option value="Bratislava">(GMT+01:00) Bratislava</option>
<option value="Brussels">(GMT+01:00) Brussels</option>
<option value="Budapest">(GMT+01:00) Budapest</option>
<option value="Casablanca">(GMT+01:00) Casablanca</option>
<option value="Copenhagen">(GMT+01:00) Copenhagen</option>
<option value="Dublin">(GMT+01:00) Dublin</option>
<option value="Ljubljana">(GMT+01:00) Ljubljana</option>
<option value="Madrid">(GMT+01:00) Madrid</option>
<option value="Paris">(GMT+01:00) Paris</option>
<option value="Prague">(GMT+01:00) Prague</option>
<option value="Rome">(GMT+01:00) Rome</option>
<option value="Sarajevo">(GMT+01:00) Sarajevo</option>
<option value="Skopje">(GMT+01:00) Skopje</option>
<option value="Stockholm">(GMT+01:00) Stockholm</option>
<option value="Vienna">(GMT+01:00) Vienna</option>
<option value="Warsaw">(GMT+01:00) Warsaw</option>
<option value="West Central Africa">(GMT+01:00) West Central Africa</option>
<option value="Zagreb">(GMT+01:00) Zagreb</option>
<option value="Athens">(GMT+02:00) Athens</option>
<option value="Bucharest">(GMT+02:00) Bucharest</option>
<option value="Cairo">(GMT+02:00) Cairo</option>
<option value="Harare">(GMT+02:00) Harare</option>
<option value="Helsinki">(GMT+02:00) Helsinki</option>
<option value="Jerusalem">(GMT+02:00) Jerusalem</option>
<option value="Kyiv">(GMT+02:00) Kyiv</option>
<option value="Pretoria">(GMT+02:00) Pretoria</option>
<option value="Riga">(GMT+02:00) Riga</option>
<option value="Sofia">(GMT+02:00) Sofia</option>
<option value="Tallinn">(GMT+02:00) Tallinn</option>
<option value="Vilnius">(GMT+02:00) Vilnius</option>
<option value="Baghdad">(GMT+03:00) Baghdad</option>
<option value="Istanbul">(GMT+03:00) Istanbul</option>
<option value="Kuwait">(GMT+03:00) Kuwait</option>
<option value="Minsk">(GMT+03:00) Minsk</option>
<option value="Moscow">(GMT+03:00) Moscow</option>
<option value="Nairobi">(GMT+03:00) Nairobi</option>
<option value="Riyadh">(GMT+03:00) Riyadh</option>
<option value="St. Petersburg">(GMT+03:00) St. Petersburg</option>
<option value="Volgograd">(GMT+03:00) Volgograd</option>
<option value="Tehran">(GMT+03:30) Tehran</option>
<option value="Abu Dhabi">(GMT+04:00) Abu Dhabi</option>
<option value="Baku">(GMT+04:00) Baku</option>
<option value="Muscat">(GMT+04:00) Muscat</option>
<option value="Tbilisi">(GMT+04:00) Tbilisi</option>
<option value="Yerevan">(GMT+04:00) Yerevan</option>
<option value="Kabul">(GMT+04:30) Kabul</option>
<option value="Ekaterinburg">(GMT+05:00) Ekaterinburg</option>
<option value="Islamabad">(GMT+05:00) Islamabad</option>
<option value="Karachi">(GMT+05:00) Karachi</option>
<option value="Tashkent">(GMT+05:00) Tashkent</option>
<option value="Chennai">(GMT+05:30) Chennai</option>
<option value="Kolkata">(GMT+05:30) Kolkata</option>
<option value="Mumbai">(GMT+05:30) Mumbai</option>
<option value="New Delhi">(GMT+05:30) New Delhi</option>
<option value="Sri Jayawardenepura">(GMT+05:30) Sri Jayawardenepura</option>
<option value="Kathmandu">(GMT+05:45) Kathmandu</option>
<option value="Almaty">(GMT+06:00) Almaty</option>
<option value="Astana">(GMT+06:00) Astana</option>
<option value="Dhaka">(GMT+06:00) Dhaka</option>
<option value="Urumqi">(GMT+06:00) Urumqi</option>
<option value="Rangoon">(GMT+06:30) Rangoon</option>
<option value="Asia/Saigon">(GMT+07:00) Asia/Saigon</option>
<option value="Bangkok">(GMT+07:00) Bangkok</option>
<option value="Hanoi">(GMT+07:00) Hanoi</option>
<option value="Jakarta">(GMT+07:00) Jakarta</option>
<option value="Krasnoyarsk">(GMT+07:00) Krasnoyarsk</option>
<option value="Novosibirsk">(GMT+07:00) Novosibirsk</option>
<option value="Asia/Kuala_Lumpur">(GMT+08:00) Asia/Kuala_Lumpur</option>
<option value="Asia/Makassar">(GMT+08:00) Asia/Makassar</option>
<option value="Asia/Shanghai">(GMT+08:00) Asia/Shanghai</option>
<option value="Beijing">(GMT+08:00) Beijing</option>
<option value="Chongqing">(GMT+08:00) Chongqing</option>
<option value="Hong Kong">(GMT+08:00) Hong Kong</option>
<option value="Irkutsk">(GMT+08:00) Irkutsk</option>
<option value="Kuala Lumpur">(GMT+08:00) Kuala Lumpur</option>
<option value="Perth">(GMT+08:00) Perth</option>
<option value="Singapore">(GMT+08:00) Singapore</option>
<option value="Taipei">(GMT+08:00) Taipei</option>
<option value="Ulaan Bataar">(GMT+08:00) Ulaan Bataar</option>
<option value="Osaka">(GMT+09:00) Osaka</option>
<option value="Sapporo">(GMT+09:00) Sapporo</option>
<option value="Seoul" selected="selected">(GMT+09:00) Seoul</option>
<option value="Tokyo">(GMT+09:00) Tokyo</option>
<option value="Yakutsk">(GMT+09:00) Yakutsk</option>
<option value="Adelaide">(GMT+09:30) Adelaide</option>
<option value="Darwin">(GMT+09:30) Darwin</option>
<option value="Brisbane">(GMT+10:00) Brisbane</option>
<option value="Canberra">(GMT+10:00) Canberra</option>
<option value="Guam">(GMT+10:00) Guam</option>
<option value="Hobart">(GMT+10:00) Hobart</option>
<option value="Melbourne">(GMT+10:00) Melbourne</option>
<option value="Port Moresby">(GMT+10:00) Port Moresby</option>
<option value="Sydney">(GMT+10:00) Sydney</option>
<option value="Vladivostok">(GMT+10:00) Vladivostok</option>
<option value="Magadan">(GMT+11:00) Magadan</option>
<option value="New Caledonia">(GMT+11:00) New Caledonia</option>
<option value="Solomon Is.">(GMT+11:00) Solomon Is.</option>
<option value="Auckland">(GMT+12:00) Auckland</option>
<option value="Fiji">(GMT+12:00) Fiji</option>
<option value="Kamchatka">(GMT+12:00) Kamchatka</option>
<option value="Marshall Is.">(GMT+12:00) Marshall Is.</option>
<option value="Wellington">(GMT+12:00) Wellington</option>
<option value="Nuku'alofa">(GMT+13:00) Nuku'alofa</option></select>
      </div>

          <div class="text-muted space-top-1">거주지 시간대</div>
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_languages">
          언어 
        </label>
        <div class="col-sm-9">
          

      <div class="space-top-1"></div>
        <div class="multiselect languages" data-select_dialog_url="https://www.airbnb.co.kr/users/languages_multiselect" data-update_url="https://www.airbnb.co.kr/users/languages_update/231754930">
    <div class="space-1">
      
    </div>
    <div class="none text-muted space-1">
      없음
    </div>
    <a class="multiselect-add-more" href="#">
      <i class="icon icon-add"></i>
      <span class="link-icon__text">
        추가하기
      </span>
    </a>
    <input id="user_languages" name="user[languages]" type="hidden" value="">
    <span class="template hide multiselect-option" data-key="%KEY%">
  <span class="btn btn-small space-1">
    %VALUE%
    &nbsp;
    <small>
      <a href="#" class="text-normal" aria-label="선택 취소하기">
        <i class="x icon icon-remove"></i>
      </a>
    </small>
  </span>&nbsp;
</span>

  </div>


          <div class="text-muted space-top-1">에어비앤비 회원과 소통이 가능한 언어를 모두 추가해 주세요.</div>
        </div>
      </div>

          <div class="row row-condensed space-4">
        <label class="text-right col-sm-3" for="user_vat_id">
          VAT 번호 
        </label>
        <div class="col-sm-9">
          
      <div class="vat-number-section space-top-1">
          <a href="#" class="add-vat-link">
            <i class="icon icon-add"></i>
            VAT 번호 추가
          </a>
      </div>

          <div class="text-muted space-top-1">EU 지역 또는 VAT가 적용되는 국가의 회원에게는 에어비앤비 서비스 수수료에 VAT가 부과됩니다. VAT 부과 국가에 거주하는 회원의 경우, 유효한 VAT 등록 번호를 입력하면 VAT가 부과되지 않습니다. <a href="https://www.airbnb.co.kr/help/topic/249">VAT 도움말 보기 »</a></div>
        </div>
      </div>

      <style data-aphrodite="data-aphrodite"></style>
<div data-hypernova-key="edit_profileemergency_contactsbundlejs" data-hypernova-id="647625ea-e9c1-494a-961b-8aa903ca4486"><div class="row row-condensed space-4" data-reactroot=""><div class="col-sm-3"><div class="text-right space-2">긴급 연락처<!-- -->&nbsp;<span tabindex="0"><i class="icon icon-lock icon-ebisu" role="img" aria-label="사생활 보장"></i></span></div></div><div class="col-sm-9"><div class=""></div><div class="row row-condensed space-1"><div class="col-sm-12"><button class="btn btn-link" type="button"><i class="icon icon-add"></i>&nbsp;<!-- -->연락처 추가하기</button></div></div><div class="row row-condensed"><div class="col-sm-12"><span class="text-muted">고객지원 팀에서 긴급 상황시 연락할 수 있도록 신뢰하는 사람의 연락처를 제공하여 주세요.</span></div></div></div></div></div>
<script type="application/json" data-hypernova-key="edit_profileemergency_contactsbundlejs" data-hypernova-id="647625ea-e9c1-494a-961b-8aa903ca4486"><!--{"emergencyContacts":[],"languages":[{"name":"Bahasa Indonesia","locale":"id"},{"name":"Bahasa Melayu","locale":"ms"},{"name":"Català","locale":"ca"},{"name":"Dansk","locale":"da"},{"name":"Deutsch","locale":"de"},{"name":"English","locale":"en"},{"name":"Español","locale":"es"},{"name":"Eλληνικά","locale":"el"},{"name":"Français","locale":"fr"},{"name":"Hrvatski","locale":"hr"},{"name":"Italiano","locale":"it"},{"name":"Magyar","locale":"hu"},{"name":"Nederlands","locale":"nl"},{"name":"Norsk","locale":"no"},{"name":"Polski","locale":"pl"},{"name":"Português","locale":"pt"},{"name":"Suomi","locale":"fi"},{"name":"Svenska","locale":"sv"},{"name":"Türkçe","locale":"tr"},{"name":"Íslenska","locale":"is"},{"name":"Čeština","locale":"cs"},{"name":"Русский","locale":"ru"},{"name":"ภาษาไทย","locale":"th"},{"name":"中文 (简体)","locale":"zh"},{"name":"中文 (繁體)","locale":"zh-TW"},{"name":"日本語","locale":"ja"},{"name":"한국어","locale":"ko"}],"phraseBundles":{"shared.government_id":"정부 발행 신분증","shared.confirmed":"확인됨","shared.remove":"삭제","shared.removed":"삭제됨","shared.cancel":"취소","shared.identification":"신분증","shared.private":"사생활 보장","shared.OK":"확인","shared.Learn_more":"더 알아보기","edit_profile.verifications.footnote":"신분증 정보 제공을 완료하셨습니다. %{link_start}자세히 알아보기%{link_end}","edit_profile.verifications.footnote.removed":"예약을 하려면 필수적으로 신분증을 제공해야 합니다. 여권이나 사진을 삭제하여 예정된 예약이 모두 취소되었으며, 다음 예약을 할 때 다시 제출해야 합니다. %{link_start}자세히 알아보세요.%{link_end}","identity_verified.modal.title.remove_id":"신분증 삭제","identity_verified.modal.body.are_you_sure":"정말 삭제하시겠어요?","identity_verified.modal.body.if_you_remove":"이 신분증을 삭제하면 예정된 예약이 모두 삭제됩니다. 또한 다음 예약 전에 신분증을 다시 스캔하여 제출해야 합니다.","identity_verified.modal.body.you_can_remove":"가장 최근 예약이 완료되고 90일이 지난 후 신분증을 삭제할 수 있습니다.","edit_profile.emergency_contact.edit":"수정","shared.Emergency Contact":"긴급 연락처","edit_profile.emergency_contact.intro_text":"고객지원 팀에서 긴급 상황시 연락할 수 있도록 신뢰하는 사람의 연락처를 제공하여 주세요.","edit_profile.emergency_contact.add_contact":"연락처 추가하기","shared.Emergency Contact Phone":"전화","shared.Emergency Contact Name":"이름","shared.Emergency Contact Relationship":"관계","shared.Emergency Contact Email":"이메일","edit_profile.label next to choice of preferred language of Airbnb communications":"선호하는 언어","edit_profile.guest_identifications.privacy_explanation":"이 정보는 중국으로 여행할 시에만 필요하며 호스트 및 다른 게스트와는 공유되지 않습니다.","edit_profile.guest_identifications.guest_profiles":"게스트 프로필","edit_profile.guest_identifications.remove":"삭제","edit_profile.guest_identifications.add_new_profile":"새로운 게스트 프로필 추가하기","user_profile.china_transparency.header":"거주 국가 확인","user_profile.china_transparency.p1":"에어비앤비의 기록에 따르면 현재 회원님의 거주 국가는 중국입니다. 회원님의 정보는 Airbnb China에 전송, 저장 및 처리됩니다. 에어비앤비는 중국에서 운영되는 다른 모든 기업과 마찬가지로 개인정보 및 정보 공개 법을 포함한 현지 법규를 준수해야 합니다.","user_profile.china_transparency.p2":"중국에 거주하지 않으면 프로필의 \"거주 국가\" 섹션을 업데이트하세요.","edit_profile.code_input_screen.title":"보안 코드를 입력하세요","edit_profile.code_input_screen.try_again":"다시 시도하기","edit_profile.code_input_screen.verify":"인증","edit_profile.code_input_screen.phone_call.subtitle":"전화(%{phone_number})로 코드를 안내해드리겠습니다.","edit_profile.code_input_screen.phone_call.retry_label":"전화를 못 받으셨나요?","edit_profile.code_input_screen.phone_call.other_option_label":"문자 메시지 받기","edit_profile.code_input_screen.text.subtitle":"전화(%{phone_number})로 코드가 전송되었습니다. 몇 분 정도 걸릴 수 있어요.","edit_profile.code_input_screen.text.retry_label":"코드를 못 받으셨나요?","edit_profile.code_input_screen.text.other_option_label":"전화 받기","edit_profile.contact_phone_introduction.title":"게스트가 이 전화(%{phone_number})로 연락해도 되나요?","edit_profile.contact_phone_introduction.subtitle":"이 번호는 예약한 게스트에게만 공개됩니다.","edit_profile.contact_phone_introduction.yes_button":"예, 게스트가 전화해도 됩니다","edit_profile.contact_phone_introduction.no_button":"아니요, 게스트에게 공개될 전화번호를 입력하세요","edit_profile.phone_number_input.contact.title":"게스트가 연락할 수 있는 번호를 알려주세요.","edit_profile.phone_number_input.contact.subtitle":"이 전화번호의 인증도 필요합니다.","edit_profile.phone_number_input.verification.title":"전화번호 추가하기","edit_profile.phone_number_input.verification.subtitle":"이 전화번호로 알림을 보내드립니다.","edit_profile.phone_number_input.verify_via_sms":"문자로 인증하기","edit_profile.phone_number_input.verify_via_phone_button":"전화로 인증","edit_profile.phone_number_input.why_verify":"인증이 왜 필요한가요?","edit_profile.phone_number_row.verify_now":"지금 인증","edit_profile.phone_number_row.not_verified":"인증되지 않음","edit_profile.phone_number_row.remove":"삭제하기","edit_profile.phone_numbers_section.no_phone_number.title":"입력된 전화번호가 없습니다.","edit_profile.phone_numbers_section.no_phone_number.subtitle":"예약 요청, 미리 알림 및 기타 알림을 보내드립니다.","edit_profile.phone_numbers_section.verification_and_contact.subtitle":"게스트 연락처, 예약 요청, 미리 알림 및 기타 알림.","edit_profile.phone_numbers_section.verification_only.subtitle":"이 번호로 예약 요청, 미리 알림 및 기타 알림을 보내드립니다.","edit_profile.phone_numbers_section.contact_only.subtitle":"예약한 게스트가 호스트님에게 직접 연락하려면 이 번호를 사용하게 됩니다.","edit_profile.phone_numbers_section.add new number":"전화번호 입력","edit_profile.phone_numbers.generic_error_message":"죄송합니다. 오류가 발생했습니다. 다시 시도해 주세요."},"phrases":{},"trebuchets":{},"breakpointCookie":"4","themeId":1,"i18nInit":{"locale":"ko","language":"ko","moment_locale":"ko","country":"KR","tld_country":"KR","currencies":[{"code":"ZAR","id":"ZAR","localized_full_name":"남아프리카공화국 란드","name":"Rand","symbol":"R","unicode_symbol":"R","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"NOK","id":"NOK","localized_full_name":"노르웨이 크로네","name":"Krone","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"NZD","id":"NZD","localized_full_name":"뉴질랜드 달러","name":"New Zealand Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"DKK","id":"DKK","localized_full_name":"덴마크 크로네","name":"Danish Kroner","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"RUB","id":"RUB","localized_full_name":"러시아 루블","name":"Rubles","symbol":"&amp;#1088;","unicode_symbol":"₽","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":false},{"code":"RON","id":"RON","localized_full_name":"루마니아 레우","name":"New Lei","symbol":"lei","unicode_symbol":"lei","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MYR","id":"MYR","localized_full_name":"말레이시아 링깃","name":"Ringgits","symbol":"&amp;#82;&amp;#77;","unicode_symbol":"RM","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MXN","id":"MXN","localized_full_name":"멕시코 페소","name":"Mexican Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MAD","id":"MAD","localized_full_name":"모로코 디르함","name":"Moroccan Dirham","symbol":"MAD","unicode_symbol":"MAD","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"USD","id":"USD","localized_full_name":"미국 달러","name":"United States Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"VND","id":"VND","localized_full_name":"베트남 동","name":"Vietnamese Dong","symbol":"&amp;#8363;","unicode_symbol":"₫","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BGN","id":"BGN","localized_full_name":"불가리아 레프","name":"Bulgarian Leva","symbol":"&amp;#1083;&amp;#1074;","unicode_symbol":"лв","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BRL","id":"BRL","localized_full_name":"브라질 레알","name":"Brazilian Reais","symbol":"R$","unicode_symbol":"R$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SAR","id":"SAR","localized_full_name":"사우스아라비아 리얄","name":"Saudi Riyal","symbol":"SR","unicode_symbol":"SR","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SEK","id":"SEK","localized_full_name":"스웨덴 크로나","name":"Sweden, Kronor","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CHF","id":"CHF","localized_full_name":"스위스 프랑","name":"Swiss Francs","symbol":"CHF","unicode_symbol":"CHF","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":true,"position":"after","space_between_price_and_symbol":true},{"code":"TWD","id":"TWD","localized_full_name":"신 타이완 달러","name":"Taiwan Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SGD","id":"SGD","localized_full_name":"싱가포르 달러","name":"Singapore, Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AED","id":"AED","localized_full_name":"아랍에미리트 디르함","name":"United Arab Emirates Dirham","symbol":"&amp;#1583;.&amp;#1573;","unicode_symbol":"ﺩ.ﺇ","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"ARS","id":"ARS","localized_full_name":"아르헨티나 페소","name":"Argentinian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"GBP","id":"GBP","localized_full_name":"영국 파운드","name":"Pounds Sterling","symbol":"&amp;pound;","unicode_symbol":"£","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UYU","id":"UYU","localized_full_name":"우루과이 페소","name":"Uruguayan Pesos","symbol":"&amp;#36;&amp;#85;","unicode_symbol":"$U","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UAH","id":"UAH","localized_full_name":"우크라이나 그리브나","name":"Ukrainian hryvnia","symbol":"&amp;#8372;","unicode_symbol":"₴","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"EUR","id":"EUR","localized_full_name":"유로","name":"Euro","symbol":"&amp;euro;","unicode_symbol":"€","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"special","space_between_price_and_symbol":false},{"code":"ILS","id":"ILS","localized_full_name":"이스라엘 신 셰켈","name":"New Shekels","symbol":"&amp;#8362;","unicode_symbol":"₪","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"INR","id":"INR","localized_full_name":"인도 루피","name":"Indian Rupee","symbol":"&amp;#8377;","unicode_symbol":"₹","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"IDR","id":"IDR","localized_full_name":"인도네시아 루피아","name":"Indonesian Rupiah","symbol":"Rp","unicode_symbol":"Rp","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"JPY","id":"JPY","localized_full_name":"일본 엔","name":"Yen","symbol":"&amp;yen;","unicode_symbol":"¥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":true},{"code":"CNY","id":"CNY","localized_full_name":"중국 위안","name":"Chinese Yuan","symbol":"&amp;#65509;","unicode_symbol":"￥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CZK","id":"CZK","localized_full_name":"체코 코루나","name":"Czech Koruny","symbol":"&amp;#75;&amp;#269;","unicode_symbol":"Kč","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CLP","id":"CLP","localized_full_name":"칠레 페소","name":"Chilean Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CAD","id":"CAD","localized_full_name":"캐나다 달러","name":"Canadian Dollar","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CRC","id":"CRC","localized_full_name":"코스타리카 콜론","name":"Colon","symbol":"&amp;#8353;","unicode_symbol":"₡","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"COP","id":"COP","localized_full_name":"콜롬비아 페소","name":"Columbian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HRK","id":"HRK","localized_full_name":"크로아티아 쿠나","name":"Croatian Kuna","symbol":"kn","unicode_symbol":"kn","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"THB","id":"THB","localized_full_name":"태국 바트","name":"Baht","symbol":"&amp;#3647;","unicode_symbol":"฿","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"TRY","id":"TRY","localized_full_name":"터키 리라","name":"Turkish Lira","symbol":"&amp;#84;&amp;#76;","unicode_symbol":"₺","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PEN","id":"PEN","localized_full_name":"페루 솔","name":"Nuevos Soles","symbol":"&amp;#83;&amp;#47;","unicode_symbol":"S/","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"PLN","id":"PLN","localized_full_name":"폴란드 즐로티","name":"Zlotych","symbol":"z&amp;#22;&amp;#322;","unicode_symbol":"zł","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PHP","id":"PHP","localized_full_name":"필리핀 페소","name":"Philippines Peso","symbol":"&amp;#8369;","unicode_symbol":"₱","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"KRW","id":"KRW","localized_full_name":"한국 원","name":"South Korean Won","symbol":"&amp;#8361;","unicode_symbol":"₩","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HUF","id":"HUF","localized_full_name":"헝가리 포린트","name":"Forint","symbol":"Ft","unicode_symbol":"Ft","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AUD","id":"AUD","localized_full_name":"호주 달러","name":"Australian Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HKD","id":"HKD","localized_full_name":"홍콩 달러","name":"Hong Kong Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false}],"current_locale_name":"한국어","languages":[{"locale_name":"Bahasa Indonesia","locale":"id"},{"locale_name":"Bahasa Melayu","locale":"ms"},{"locale_name":"Català","locale":"ca"},{"locale_name":"Dansk","locale":"da"},{"locale_name":"Deutsch","locale":"de"},{"locale_name":"English","locale":"en"},{"locale_name":"Español","locale":"es"},{"locale_name":"Eλληνικά","locale":"el"},{"locale_name":"Français","locale":"fr"},{"locale_name":"Hrvatski","locale":"hr"},{"locale_name":"Italiano","locale":"it"},{"locale_name":"Magyar","locale":"hu"},{"locale_name":"Nederlands","locale":"nl"},{"locale_name":"Norsk","locale":"no"},{"locale_name":"Polski","locale":"pl"},{"locale_name":"Português","locale":"pt"},{"locale_name":"Suomi","locale":"fi"},{"locale_name":"Svenska","locale":"sv"},{"locale_name":"Türkçe","locale":"tr"},{"locale_name":"Íslenska","locale":"is"},{"locale_name":"Čeština","locale":"cs"},{"locale_name":"Русский","locale":"ru"},{"locale_name":"ภาษาไทย","locale":"th"},{"locale_name":"中文 (简体)","locale":"zh"},{"locale_name":"中文 (繁體)","locale":"zh-TW"},{"locale_name":"日本語","locale":"ja"},{"locale_name":"한국어","locale":"ko"}],"base_direction":"ltr","request_host":"www.airbnb.co.kr"}}--></script>
<script type="application/json" data-aphrodite-css="edit_profile/emergency_contacts.bundle.js"><!--[]--></script>

      <div id="host-shipping-address"><div style="margin-bottom: 16px;"><div class="row row-condensed space-4"><div class="text-right col-sm-3 space-2">배송지&nbsp;<i class="icon icon-lock icon-ebisu" data-behavior="tooltip" role="img" aria-label="사생활 보장" tabindex="0"></i></div><div class="col-sm-9"><div class="space-sm-1"><a id="address_add" href="#" aria-expanded="false" role="button" data-prevent-default="true"><i class="icon icon-add"></i><span> 배송지 주소 추가</span></a></div></div></div></div></div>
      <style data-aphrodite="data-aphrodite"></style>
<div data-hypernova-key="edit_profileguest_identificationsbundlejs" data-hypernova-id="8930417f-a1bc-4ff7-aeee-45384e533f91"><div class="row row-condensed space-4" data-reactroot=""><div class="col-sm-3"><div class="text-right space-2">게스트 프로필<!-- -->&nbsp;<span tabindex="0"><i class="icon icon-lock icon-ebisu" role="img" aria-label="사생활 보장"></i></span></div></div><div class="col-sm-9"><div class=""></div><div class="row row-condensed space-1"><div class="col-sm-12"><button class="btn-link pull-left" type="button"><i class="icon icon-add"></i>&nbsp;<!-- -->새로운 게스트 프로필 추가하기</button></div></div><div class="row row-condensed"><div class="col-sm-12"><span class="text-muted">이 정보는 중국으로 여행할 시에만 필요하며 호스트 및 다른 게스트와는 공유되지 않습니다.</span></div></div></div></div></div>
<script type="application/json" data-hypernova-key="edit_profileguest_identificationsbundlejs" data-hypernova-id="8930417f-a1bc-4ff7-aeee-45384e533f91"><!--{"countries":[["Congo","CG"],["Democratic Republic of the Congo","CD"],["Kosovo","XK"],["Macedonia","MK"],["가나","GH"],["가봉","GA"],["가이아나","GY"],["감비아","GM"],["건지","GG"],["과들루프","GP"],["과테말라","GT"],["괌","GU"],["그레나다","GD"],["그루지야","GE"],["그리스","GR"],["그린란드","GL"],["기네비쏘","GW"],["기니","GN"],["까뽀베르데","CV"],["나미비아","NA"],["나우루","NR"],["나이지리아","NG"],["남극 대륙","AQ"],["남수단","SS"],["남아프리카","ZA"],["네덜란드","NL"],["네덜란드령 카리브","BQ"],["네팔","NP"],["노르웨이","NO"],["노퍽섬","NF"],["뉴 칼레도니아","NC"],["뉴질랜드","NZ"],["니우에","NU"],["니제르","NE"],["니카라과","NI"],["대만","TW"],["덴마크","DK"],["도미니카","DM"],["도미니카 공화국","DO"],["독일","DE"],["동티모르","TL"],["라오스","LA"],["라이베리아","LR"],["라트비아","LV"],["러시아","RU"],["레바논","LB"],["레소토","LS"],["루마니아","RO"],["룩셈부르크","LU"],["르완다","RW"],["리비아","LY"],["리유니온","RE"],["리투아니아","LT"],["리히텐슈타인","LI"],["마다가스카르","MG"],["마샬 군도","MH"],["마요티","YT"],["마카오","MO"],["말라위","MW"],["말레이시아","MY"],["말리","ML"],["말티니크","MQ"],["맨 섬","IM"],["멕시코","MX"],["모나코","MC"],["모로코","MA"],["모리셔스","MU"],["모리타니","MR"],["모잠비크","MZ"],["몬테네그로","ME"],["몬트세라트","MS"],["몰도바","MD"],["몰디브","MV"],["몰타","MT"],["몽골","MN"],["미국","US"],["미국령 버진 아일랜드","VI"],["미국령 해외 제도","UM"],["미얀마","MM"],["미크로네시아","FM"],["바누아투","VU"],["바레인","BH"],["바베이도스","BB"],["바티칸","VA"],["바하마","BS"],["방글라데시","BD"],["버뮤다","BM"],["베냉","BJ"],["베네수엘라","VE"],["베트남","VN"],["벨기에","BE"],["벨라루스","BY"],["벨리즈","BZ"],["보스니아 헤르체고비나","BA"],["보츠와나","BW"],["볼리비아","BO"],["부룬디","BI"],["부르키나파소","BF"],["부베","BV"],["부탄","BT"],["북마리아나제도","MP"],["불가리아","BG"],["브라질","BR"],["브루나이","BN"],["사모아","WS"],["사우디아라비아","SA"],["사우스조지아 사우스샌드위치 제도","GS"],["사이프러스","CY"],["산마리노","SM"],["상투메 프린시페","ST"],["생 마르탱","MF"],["생 바르텔르미","BL"],["서사하라","EH"],["세네갈","SN"],["세르비아","RS"],["세인트루시아","LC"],["세인트빈센트그레나딘","VC"],["세인트크리스토퍼 네비스","KN"],["세인트피에르-미케롱","PM"],["세인트헬레나","SH"],["소말리아","SO"],["솔로몬 제도","SB"],["수리남","SR"],["쉐이쉘","SC"],["스리랑카","LK"],["스발바르제도-얀마웬섬","SJ"],["스와질랜드","SZ"],["스웨덴","SE"],["스위스","CH"],["스페인","ES"],["슬로바키아","SK"],["슬로베니아","SI"],["시에라리온","SL"],["신트마르턴","SX"],["싱가포르","SG"],["아랍에미리트 연합","AE"],["아루바","AW"],["아르메니아","AM"],["아르헨티나","AR"],["아메리칸 사모아","AS"],["아이슬란드","IS"],["아이티","HT"],["아일랜드","IE"],["아제르바이잔","AZ"],["아프가니스탄","AF"],["안길라","AI"],["안도라","AD"],["알바니아","AL"],["알제리","DZ"],["앙골라","AO"],["앤티가 바부다","AG"],["에리트리아","ER"],["에스토니아","EE"],["에콰도르","EC"],["엘살바도르","SV"],["영국","GB"],["영국령 버진 아일랜드","VG"],["영국령인도양식민지","IO"],["예멘","YE"],["오만","OM"],["오스트레일리아","AU"],["오스트리아","AT"],["온두라스","HN"],["올란드 제도","AX"],["왈리스-푸투나 제도","WF"],["요르단","JO"],["우간다","UG"],["우루과이","UY"],["우즈베키스탄","UZ"],["우크라이나","UA"],["이디오피아","ET"],["이라크","IQ"],["이스라엘","IL"],["이집트","EG"],["이탈리아","IT"],["인도","IN"],["인도네시아","ID"],["일본","JP"],["자메이카","JM"],["잠비아","ZM"],["저지","JE"],["적도 기니","GQ"],["중국","CN"],["중앙 아프리카 공화국","CF"],["지부티","DJ"],["지브롤터","GI"],["짐바브웨","ZW"],["차드","TD"],["체코","CZ"],["칠레","CL"],["카메룬","CM"],["카자흐스탄","KZ"],["카타르","QA"],["캄보디아","KH"],["캐나다","CA"],["케냐","KE"],["케이맨제도","KY"],["코모로스","KM"],["코스타리카","CR"],["코코스제도","CC"],["코트디부아르","CI"],["콜롬비아","CO"],["쿠웨이트","KW"],["쿡제도","CK"],["퀴라소","CW"],["크로아티아","HR"],["크리스마스섬","CX"],["키르기스스탄","KG"],["키리바시","KI"],["타지키스탄","TJ"],["탄자니아","TZ"],["태국","TH"],["터크스케이커스제도","TC"],["터키","TR"],["토고","TG"],["토켈라우","TK"],["통가","TO"],["투르크메니스탄","TM"],["투발루","TV"],["튀니지","TN"],["트리니다드 토바고","TT"],["파나마","PA"],["파라과이","PY"],["파키스탄","PK"],["파푸아뉴기니","PG"],["팔라우","PW"],["팔레스타인 지구","PS"],["페로제도","FO"],["페루","PE"],["포르투갈","PT"],["포클랜드 제도[말비나스 군도]","FK"],["폴란드","PL"],["푸에르토리코","PR"],["프랑스","FR"],["프랑스 남부 지방","TF"],["프랑스령 기아나","GF"],["프랑스령 폴리네시아","PF"],["피지","FJ"],["핀란드","FI"],["필리핀","PH"],["핏케언섬","PN"],["한국","KR"],["허드섬-맥도널드제도","HM"],["헝가리","HU"],["홍콩","HK"]],"guestIdentifications":{"chinaResidentIdentityCards":[],"passports":[]},"phraseBundles":{"guest_identifications.select_guest_profile":"게스트 프로필 선택","guest_identifications.add_new_guest_profile":"새로운 게스트 프로필 추가하기","guest_identifications.national_id":"국가 공인 신분증","guest_identifications.passport":"여권","guest_identifications.passport_number":"여권번호","guest_identifications.given_names":"이름(예: 길동)","guest_identifications.surname":"성(예: 홍)","guest_identifications.full_name_display_string_for_residence_card_form":"이름(중국어)","guest_identifications.nationality":"국적","guest_identifications.select_nationality":"국적 선택","guest_identifications.expires_on":"만기일:","guest_identifications.id_type":"신분증 종류","guest_identifications.id_number":"신분증 번호","guest_identifications.validation.primary_guest":"첫 번째 게스트에 대한 신분증 정보를 입력해 주세요.","guest_identifications.validation.double_check_information":"각 게스트에 대한 신분증 정보를 올바르게 입력해 주세요.","guest_identifications.add_id_info":"신분증 정보 추가","guest_identifications.add":"추가","guest_identifications.error.check_id_number":"신분증 번호를 확인하세요.","guest_identifications.error.check_date_of_expiry":"만료일을 확인하세요.","p4.china_transparency.collecting_identifications_chinese_guest":"중국 여행객은 다음 정보를 작성해야 합니다. 중국 거주자로서 회원님의 정보는 Airbnb China에서 저장 및 처리됩니다. 이 예약을 확정함으로써 회원님은 Airbnb China가 추가 통지 없이 회원님의 정보를 중국 정부 기관에 제공하는 것에 동의합니다.","p4.china_transparency.collecting_identifications_foreign_guest":"모든 중국 여행객은 특정 정보를 제공해야 합니다. 이 예약을 확정함으로써 회원님은 Airbnb China가 추가 통지 없이 중국 정부 기관에 회원님의 정보를 제공하는 것에 동의하는 것입니다. 회원님의 이름, 전화번호, 이메일 주소, 신분증/여권 정보, 예약 정보, 호스트와 주고받은 메시지도 Airbnb China에 전달되어 저장 및 처리됩니다.","p4.china_transparency.identifications_privacy":"제공하신 정보는 호스트와 공유되지 않습니다. 게스트 프로필은 나중에 다시 사용하실 수 있도록 저장됩니다.","guest_identifications.main_profile_form_title":"회원 정보","guest_identifications.additional_profile_form_title":"게스트 %{guest_number}(선택사항)","guest_identifications.additional_profile_form_title_with_link":"게스트 %{guest_number}명(선택사항) %{link_start}숨기기%{link_end}","p4.china_guest_information":"중국의 숙소 예약","guest_identifications.link_to_show_optional_guest_profile_form":"추가 게스트 정보(선택사항)","guest_identifications.profile_options_selector_header_text":"게스트 프로필을 선택하세요","guest_identifications.china_passport_first_name_label":"이름 병음(이름)","guest_identifications.china_passport_first_name_placeholder":"이름이 'Li Xiaoming'인 경우 'Xiaoming'를 입력하세요","guest_identifications.china_passport_last_name_label":"성 병음(성)","guest_identifications.china_passport_last_name_placeholder":"이름이 'Li Xiaoming'인 경우 'Li'를 입력하세요","guest_identifications.error_messages.empty_passport_error":"여권 번호를 입력해 주세요.","guest_identifications.error_messages.passport_not_valid_error":"여권 번호가 올바르지 않습니다.","guest_identifications.error_messages.empty_china_identity_card_error":"중국 신분증 번호를 입력해 주세요.","guest_identifications.error_messages.china_identity_card_not_valid_error":"중국 신분증 번호가 유효하지 않습니다.","guest_identifications.error_messages.empty_name_error":"이름을 입력해 주세요.","guest_identifications.error_messages.empty_first_name_error":"이름을 입력해 주세요.","guest_identifications.error_messages.empty_last_name_error":"성을 입력해 주세요.","guest_identifications.error_messages.passport_invalid_expire_date_error":"여권 만료일이 올바르지 않습니다. 다시 입력하세요.","guest_identifications.error_messages.passport_incomplete_expire_date_error":"여권 만료일을 입력해 주세요.","shared.government_id":"정부 발행 신분증","shared.confirmed":"확인됨","shared.remove":"삭제","shared.removed":"삭제됨","shared.cancel":"취소","shared.identification":"신분증","shared.private":"사생활 보장","shared.OK":"확인","shared.Learn_more":"더 알아보기","edit_profile.verifications.footnote":"신분증 정보 제공을 완료하셨습니다. %{link_start}자세히 알아보기%{link_end}","edit_profile.verifications.footnote.removed":"예약을 하려면 필수적으로 신분증을 제공해야 합니다. 여권이나 사진을 삭제하여 예정된 예약이 모두 취소되었으며, 다음 예약을 할 때 다시 제출해야 합니다. %{link_start}자세히 알아보세요.%{link_end}","identity_verified.modal.title.remove_id":"신분증 삭제","identity_verified.modal.body.are_you_sure":"정말 삭제하시겠어요?","identity_verified.modal.body.if_you_remove":"이 신분증을 삭제하면 예정된 예약이 모두 삭제됩니다. 또한 다음 예약 전에 신분증을 다시 스캔하여 제출해야 합니다.","identity_verified.modal.body.you_can_remove":"가장 최근 예약이 완료되고 90일이 지난 후 신분증을 삭제할 수 있습니다.","edit_profile.emergency_contact.edit":"수정","shared.Emergency Contact":"긴급 연락처","edit_profile.emergency_contact.intro_text":"고객지원 팀에서 긴급 상황시 연락할 수 있도록 신뢰하는 사람의 연락처를 제공하여 주세요.","edit_profile.emergency_contact.add_contact":"연락처 추가하기","shared.Emergency Contact Phone":"전화","shared.Emergency Contact Name":"이름","shared.Emergency Contact Relationship":"관계","shared.Emergency Contact Email":"이메일","edit_profile.label next to choice of preferred language of Airbnb communications":"선호하는 언어","edit_profile.guest_identifications.privacy_explanation":"이 정보는 중국으로 여행할 시에만 필요하며 호스트 및 다른 게스트와는 공유되지 않습니다.","edit_profile.guest_identifications.guest_profiles":"게스트 프로필","edit_profile.guest_identifications.remove":"삭제","edit_profile.guest_identifications.add_new_profile":"새로운 게스트 프로필 추가하기","user_profile.china_transparency.header":"거주 국가 확인","user_profile.china_transparency.p1":"에어비앤비의 기록에 따르면 현재 회원님의 거주 국가는 중국입니다. 회원님의 정보는 Airbnb China에 전송, 저장 및 처리됩니다. 에어비앤비는 중국에서 운영되는 다른 모든 기업과 마찬가지로 개인정보 및 정보 공개 법을 포함한 현지 법규를 준수해야 합니다.","user_profile.china_transparency.p2":"중국에 거주하지 않으면 프로필의 \"거주 국가\" 섹션을 업데이트하세요.","edit_profile.code_input_screen.title":"보안 코드를 입력하세요","edit_profile.code_input_screen.try_again":"다시 시도하기","edit_profile.code_input_screen.verify":"인증","edit_profile.code_input_screen.phone_call.subtitle":"전화(%{phone_number})로 코드를 안내해드리겠습니다.","edit_profile.code_input_screen.phone_call.retry_label":"전화를 못 받으셨나요?","edit_profile.code_input_screen.phone_call.other_option_label":"문자 메시지 받기","edit_profile.code_input_screen.text.subtitle":"전화(%{phone_number})로 코드가 전송되었습니다. 몇 분 정도 걸릴 수 있어요.","edit_profile.code_input_screen.text.retry_label":"코드를 못 받으셨나요?","edit_profile.code_input_screen.text.other_option_label":"전화 받기","edit_profile.contact_phone_introduction.title":"게스트가 이 전화(%{phone_number})로 연락해도 되나요?","edit_profile.contact_phone_introduction.subtitle":"이 번호는 예약한 게스트에게만 공개됩니다.","edit_profile.contact_phone_introduction.yes_button":"예, 게스트가 전화해도 됩니다","edit_profile.contact_phone_introduction.no_button":"아니요, 게스트에게 공개될 전화번호를 입력하세요","edit_profile.phone_number_input.contact.title":"게스트가 연락할 수 있는 번호를 알려주세요.","edit_profile.phone_number_input.contact.subtitle":"이 전화번호의 인증도 필요합니다.","edit_profile.phone_number_input.verification.title":"전화번호 추가하기","edit_profile.phone_number_input.verification.subtitle":"이 전화번호로 알림을 보내드립니다.","edit_profile.phone_number_input.verify_via_sms":"문자로 인증하기","edit_profile.phone_number_input.verify_via_phone_button":"전화로 인증","edit_profile.phone_number_input.why_verify":"인증이 왜 필요한가요?","edit_profile.phone_number_row.verify_now":"지금 인증","edit_profile.phone_number_row.not_verified":"인증되지 않음","edit_profile.phone_number_row.remove":"삭제하기","edit_profile.phone_numbers_section.no_phone_number.title":"입력된 전화번호가 없습니다.","edit_profile.phone_numbers_section.no_phone_number.subtitle":"예약 요청, 미리 알림 및 기타 알림을 보내드립니다.","edit_profile.phone_numbers_section.verification_and_contact.subtitle":"게스트 연락처, 예약 요청, 미리 알림 및 기타 알림.","edit_profile.phone_numbers_section.verification_only.subtitle":"이 번호로 예약 요청, 미리 알림 및 기타 알림을 보내드립니다.","edit_profile.phone_numbers_section.contact_only.subtitle":"예약한 게스트가 호스트님에게 직접 연락하려면 이 번호를 사용하게 됩니다.","edit_profile.phone_numbers_section.add new number":"전화번호 입력","edit_profile.phone_numbers.generic_error_message":"죄송합니다. 오류가 발생했습니다. 다시 시도해 주세요."},"phrases":{},"trebuchets":{},"breakpointCookie":"4","themeId":1,"i18nInit":{"locale":"ko","language":"ko","moment_locale":"ko","country":"KR","tld_country":"KR","currencies":[{"code":"ZAR","id":"ZAR","localized_full_name":"남아프리카공화국 란드","name":"Rand","symbol":"R","unicode_symbol":"R","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"NOK","id":"NOK","localized_full_name":"노르웨이 크로네","name":"Krone","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"NZD","id":"NZD","localized_full_name":"뉴질랜드 달러","name":"New Zealand Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"DKK","id":"DKK","localized_full_name":"덴마크 크로네","name":"Danish Kroner","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"RUB","id":"RUB","localized_full_name":"러시아 루블","name":"Rubles","symbol":"&amp;#1088;","unicode_symbol":"₽","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":false},{"code":"RON","id":"RON","localized_full_name":"루마니아 레우","name":"New Lei","symbol":"lei","unicode_symbol":"lei","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MYR","id":"MYR","localized_full_name":"말레이시아 링깃","name":"Ringgits","symbol":"&amp;#82;&amp;#77;","unicode_symbol":"RM","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MXN","id":"MXN","localized_full_name":"멕시코 페소","name":"Mexican Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MAD","id":"MAD","localized_full_name":"모로코 디르함","name":"Moroccan Dirham","symbol":"MAD","unicode_symbol":"MAD","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"USD","id":"USD","localized_full_name":"미국 달러","name":"United States Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"VND","id":"VND","localized_full_name":"베트남 동","name":"Vietnamese Dong","symbol":"&amp;#8363;","unicode_symbol":"₫","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BGN","id":"BGN","localized_full_name":"불가리아 레프","name":"Bulgarian Leva","symbol":"&amp;#1083;&amp;#1074;","unicode_symbol":"лв","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BRL","id":"BRL","localized_full_name":"브라질 레알","name":"Brazilian Reais","symbol":"R$","unicode_symbol":"R$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SAR","id":"SAR","localized_full_name":"사우스아라비아 리얄","name":"Saudi Riyal","symbol":"SR","unicode_symbol":"SR","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SEK","id":"SEK","localized_full_name":"스웨덴 크로나","name":"Sweden, Kronor","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CHF","id":"CHF","localized_full_name":"스위스 프랑","name":"Swiss Francs","symbol":"CHF","unicode_symbol":"CHF","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":true,"position":"after","space_between_price_and_symbol":true},{"code":"TWD","id":"TWD","localized_full_name":"신 타이완 달러","name":"Taiwan Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SGD","id":"SGD","localized_full_name":"싱가포르 달러","name":"Singapore, Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AED","id":"AED","localized_full_name":"아랍에미리트 디르함","name":"United Arab Emirates Dirham","symbol":"&amp;#1583;.&amp;#1573;","unicode_symbol":"ﺩ.ﺇ","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"ARS","id":"ARS","localized_full_name":"아르헨티나 페소","name":"Argentinian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"GBP","id":"GBP","localized_full_name":"영국 파운드","name":"Pounds Sterling","symbol":"&amp;pound;","unicode_symbol":"£","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UYU","id":"UYU","localized_full_name":"우루과이 페소","name":"Uruguayan Pesos","symbol":"&amp;#36;&amp;#85;","unicode_symbol":"$U","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UAH","id":"UAH","localized_full_name":"우크라이나 그리브나","name":"Ukrainian hryvnia","symbol":"&amp;#8372;","unicode_symbol":"₴","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"EUR","id":"EUR","localized_full_name":"유로","name":"Euro","symbol":"&amp;euro;","unicode_symbol":"€","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"special","space_between_price_and_symbol":false},{"code":"ILS","id":"ILS","localized_full_name":"이스라엘 신 셰켈","name":"New Shekels","symbol":"&amp;#8362;","unicode_symbol":"₪","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"INR","id":"INR","localized_full_name":"인도 루피","name":"Indian Rupee","symbol":"&amp;#8377;","unicode_symbol":"₹","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"IDR","id":"IDR","localized_full_name":"인도네시아 루피아","name":"Indonesian Rupiah","symbol":"Rp","unicode_symbol":"Rp","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"JPY","id":"JPY","localized_full_name":"일본 엔","name":"Yen","symbol":"&amp;yen;","unicode_symbol":"¥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":true},{"code":"CNY","id":"CNY","localized_full_name":"중국 위안","name":"Chinese Yuan","symbol":"&amp;#65509;","unicode_symbol":"￥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CZK","id":"CZK","localized_full_name":"체코 코루나","name":"Czech Koruny","symbol":"&amp;#75;&amp;#269;","unicode_symbol":"Kč","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CLP","id":"CLP","localized_full_name":"칠레 페소","name":"Chilean Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CAD","id":"CAD","localized_full_name":"캐나다 달러","name":"Canadian Dollar","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CRC","id":"CRC","localized_full_name":"코스타리카 콜론","name":"Colon","symbol":"&amp;#8353;","unicode_symbol":"₡","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"COP","id":"COP","localized_full_name":"콜롬비아 페소","name":"Columbian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HRK","id":"HRK","localized_full_name":"크로아티아 쿠나","name":"Croatian Kuna","symbol":"kn","unicode_symbol":"kn","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"THB","id":"THB","localized_full_name":"태국 바트","name":"Baht","symbol":"&amp;#3647;","unicode_symbol":"฿","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"TRY","id":"TRY","localized_full_name":"터키 리라","name":"Turkish Lira","symbol":"&amp;#84;&amp;#76;","unicode_symbol":"₺","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PEN","id":"PEN","localized_full_name":"페루 솔","name":"Nuevos Soles","symbol":"&amp;#83;&amp;#47;","unicode_symbol":"S/","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"PLN","id":"PLN","localized_full_name":"폴란드 즐로티","name":"Zlotych","symbol":"z&amp;#22;&amp;#322;","unicode_symbol":"zł","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PHP","id":"PHP","localized_full_name":"필리핀 페소","name":"Philippines Peso","symbol":"&amp;#8369;","unicode_symbol":"₱","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"KRW","id":"KRW","localized_full_name":"한국 원","name":"South Korean Won","symbol":"&amp;#8361;","unicode_symbol":"₩","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HUF","id":"HUF","localized_full_name":"헝가리 포린트","name":"Forint","symbol":"Ft","unicode_symbol":"Ft","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AUD","id":"AUD","localized_full_name":"호주 달러","name":"Australian Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HKD","id":"HKD","localized_full_name":"홍콩 달러","name":"Hong Kong Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false}],"current_locale_name":"한국어","languages":[{"locale_name":"Bahasa Indonesia","locale":"id"},{"locale_name":"Bahasa Melayu","locale":"ms"},{"locale_name":"Català","locale":"ca"},{"locale_name":"Dansk","locale":"da"},{"locale_name":"Deutsch","locale":"de"},{"locale_name":"English","locale":"en"},{"locale_name":"Español","locale":"es"},{"locale_name":"Eλληνικά","locale":"el"},{"locale_name":"Français","locale":"fr"},{"locale_name":"Hrvatski","locale":"hr"},{"locale_name":"Italiano","locale":"it"},{"locale_name":"Magyar","locale":"hu"},{"locale_name":"Nederlands","locale":"nl"},{"locale_name":"Norsk","locale":"no"},{"locale_name":"Polski","locale":"pl"},{"locale_name":"Português","locale":"pt"},{"locale_name":"Suomi","locale":"fi"},{"locale_name":"Svenska","locale":"sv"},{"locale_name":"Türkçe","locale":"tr"},{"locale_name":"Íslenska","locale":"is"},{"locale_name":"Čeština","locale":"cs"},{"locale_name":"Русский","locale":"ru"},{"locale_name":"ภาษาไทย","locale":"th"},{"locale_name":"中文 (简体)","locale":"zh"},{"locale_name":"中文 (繁體)","locale":"zh-TW"},{"locale_name":"日本語","locale":"ja"},{"locale_name":"한국어","locale":"ko"}],"base_direction":"ltr","request_host":"www.airbnb.co.kr"}}--></script>
<script type="application/json" data-aphrodite-css="edit_profile/guest_identifications.bundle.js"><!--[]--></script>
  </div>
</div>


<div id="business-travel" class="panel space-4">
  <div class="panel-header">
    <a id="business_travel"></a> 
    <h2 class="edit-profile-section-heading">
      출장
    </h2>
  </div>

  <div class="panel-body">
    <style data-aphrodite="data-aphrodite">._1k01n3v1{color:#008489 !important;font:inherit !important;font-family:Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;text-decoration:none !important;-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;cursor:pointer !important;margin:0px !important;padding:0px !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;text-align:left !important;}._1k01n3v1:hover{text-decoration:underline !important;color:#008489 !important;}._1k01n3v1:focus{text-decoration:underline !important;}@supports(--custom: properties){._1k01n3v1{color:var(--color-text-link, #008489) !important;font-family:var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;}._1k01n3v1:hover{color:var(--color-text-link-hover, #008489) !important;}._1k01n3v1:active{color:var(--color-text-link-active, #006C70) !important;}}._1k01n3v1:active{color:#006C70 !important;outline:0px !important;}</style>
<div data-hypernova-key="business_travelquick_enrollbundlejs" data-hypernova-id="7e0f8b6e-64a6-42bf-9f5d-5511f434d039"><div class="bt-quick-enroll" data-reactroot=""><div class="row row-condensed space-1"><span style="font-size:0"></span><label class="text-right col-sm-3" for="new-entry-field">업무용 이메일<!-- --> <span tabindex="0"><i class="icon icon-lock icon-ebisu" role="img" aria-label="사생활 보장"></i></span></label><div class="col-sm-9"><div class="space-1"><div class="input-addon hide-btn"><input type="text" class="" id="new-entry-field" value=""><span class="input-suffix with-btn" type="text"><button type="button" class="btn btn-primary">추가</button></span></div><div class="text-muted space-top-1">다음번 검색 시 <strong>여행 유형</strong> 필터를 선택해 출장에 적합한 숙소를 찾아보세요. <button type="button" class="_1k01n3v1" aria-busy="false">자세히 알아보기</button></div></div></div></div></div></div>
<script type="application/json" data-hypernova-key="business_travelquick_enrollbundlejs" data-hypernova-id="7e0f8b6e-64a6-42bf-9f5d-5511f434d039"><!--{"business_travel_employees":[],"i18n_init":{"locale":"ko","language":"ko","moment_locale":"ko","country":"KR","tld_country":"KR","currencies":[{"code":"ZAR","id":"ZAR","localized_full_name":"남아프리카공화국 란드","name":"Rand","symbol":"R","unicode_symbol":"R","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"NOK","id":"NOK","localized_full_name":"노르웨이 크로네","name":"Krone","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"NZD","id":"NZD","localized_full_name":"뉴질랜드 달러","name":"New Zealand Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"DKK","id":"DKK","localized_full_name":"덴마크 크로네","name":"Danish Kroner","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"RUB","id":"RUB","localized_full_name":"러시아 루블","name":"Rubles","symbol":"&amp;#1088;","unicode_symbol":"₽","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":false},{"code":"RON","id":"RON","localized_full_name":"루마니아 레우","name":"New Lei","symbol":"lei","unicode_symbol":"lei","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MYR","id":"MYR","localized_full_name":"말레이시아 링깃","name":"Ringgits","symbol":"&amp;#82;&amp;#77;","unicode_symbol":"RM","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MXN","id":"MXN","localized_full_name":"멕시코 페소","name":"Mexican Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MAD","id":"MAD","localized_full_name":"모로코 디르함","name":"Moroccan Dirham","symbol":"MAD","unicode_symbol":"MAD","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"USD","id":"USD","localized_full_name":"미국 달러","name":"United States Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"VND","id":"VND","localized_full_name":"베트남 동","name":"Vietnamese Dong","symbol":"&amp;#8363;","unicode_symbol":"₫","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BGN","id":"BGN","localized_full_name":"불가리아 레프","name":"Bulgarian Leva","symbol":"&amp;#1083;&amp;#1074;","unicode_symbol":"лв","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BRL","id":"BRL","localized_full_name":"브라질 레알","name":"Brazilian Reais","symbol":"R$","unicode_symbol":"R$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SAR","id":"SAR","localized_full_name":"사우스아라비아 리얄","name":"Saudi Riyal","symbol":"SR","unicode_symbol":"SR","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SEK","id":"SEK","localized_full_name":"스웨덴 크로나","name":"Sweden, Kronor","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CHF","id":"CHF","localized_full_name":"스위스 프랑","name":"Swiss Francs","symbol":"CHF","unicode_symbol":"CHF","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":true,"position":"after","space_between_price_and_symbol":true},{"code":"TWD","id":"TWD","localized_full_name":"신 타이완 달러","name":"Taiwan Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SGD","id":"SGD","localized_full_name":"싱가포르 달러","name":"Singapore, Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AED","id":"AED","localized_full_name":"아랍에미리트 디르함","name":"United Arab Emirates Dirham","symbol":"&amp;#1583;.&amp;#1573;","unicode_symbol":"ﺩ.ﺇ","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"ARS","id":"ARS","localized_full_name":"아르헨티나 페소","name":"Argentinian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"GBP","id":"GBP","localized_full_name":"영국 파운드","name":"Pounds Sterling","symbol":"&amp;pound;","unicode_symbol":"£","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UYU","id":"UYU","localized_full_name":"우루과이 페소","name":"Uruguayan Pesos","symbol":"&amp;#36;&amp;#85;","unicode_symbol":"$U","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UAH","id":"UAH","localized_full_name":"우크라이나 그리브나","name":"Ukrainian hryvnia","symbol":"&amp;#8372;","unicode_symbol":"₴","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"EUR","id":"EUR","localized_full_name":"유로","name":"Euro","symbol":"&amp;euro;","unicode_symbol":"€","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"special","space_between_price_and_symbol":false},{"code":"ILS","id":"ILS","localized_full_name":"이스라엘 신 셰켈","name":"New Shekels","symbol":"&amp;#8362;","unicode_symbol":"₪","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"INR","id":"INR","localized_full_name":"인도 루피","name":"Indian Rupee","symbol":"&amp;#8377;","unicode_symbol":"₹","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"IDR","id":"IDR","localized_full_name":"인도네시아 루피아","name":"Indonesian Rupiah","symbol":"Rp","unicode_symbol":"Rp","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"JPY","id":"JPY","localized_full_name":"일본 엔","name":"Yen","symbol":"&amp;yen;","unicode_symbol":"¥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":true},{"code":"CNY","id":"CNY","localized_full_name":"중국 위안","name":"Chinese Yuan","symbol":"&amp;#65509;","unicode_symbol":"￥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CZK","id":"CZK","localized_full_name":"체코 코루나","name":"Czech Koruny","symbol":"&amp;#75;&amp;#269;","unicode_symbol":"Kč","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CLP","id":"CLP","localized_full_name":"칠레 페소","name":"Chilean Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CAD","id":"CAD","localized_full_name":"캐나다 달러","name":"Canadian Dollar","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CRC","id":"CRC","localized_full_name":"코스타리카 콜론","name":"Colon","symbol":"&amp;#8353;","unicode_symbol":"₡","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"COP","id":"COP","localized_full_name":"콜롬비아 페소","name":"Columbian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HRK","id":"HRK","localized_full_name":"크로아티아 쿠나","name":"Croatian Kuna","symbol":"kn","unicode_symbol":"kn","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"THB","id":"THB","localized_full_name":"태국 바트","name":"Baht","symbol":"&amp;#3647;","unicode_symbol":"฿","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"TRY","id":"TRY","localized_full_name":"터키 리라","name":"Turkish Lira","symbol":"&amp;#84;&amp;#76;","unicode_symbol":"₺","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PEN","id":"PEN","localized_full_name":"페루 솔","name":"Nuevos Soles","symbol":"&amp;#83;&amp;#47;","unicode_symbol":"S/","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"PLN","id":"PLN","localized_full_name":"폴란드 즐로티","name":"Zlotych","symbol":"z&amp;#22;&amp;#322;","unicode_symbol":"zł","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PHP","id":"PHP","localized_full_name":"필리핀 페소","name":"Philippines Peso","symbol":"&amp;#8369;","unicode_symbol":"₱","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"KRW","id":"KRW","localized_full_name":"한국 원","name":"South Korean Won","symbol":"&amp;#8361;","unicode_symbol":"₩","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HUF","id":"HUF","localized_full_name":"헝가리 포린트","name":"Forint","symbol":"Ft","unicode_symbol":"Ft","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AUD","id":"AUD","localized_full_name":"호주 달러","name":"Australian Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HKD","id":"HKD","localized_full_name":"홍콩 달러","name":"Hong Kong Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false}],"current_locale_name":"한국어","languages":[{"locale_name":"Bahasa Indonesia","locale":"id"},{"locale_name":"Bahasa Melayu","locale":"ms"},{"locale_name":"Català","locale":"ca"},{"locale_name":"Dansk","locale":"da"},{"locale_name":"Deutsch","locale":"de"},{"locale_name":"English","locale":"en"},{"locale_name":"Español","locale":"es"},{"locale_name":"Eλληνικά","locale":"el"},{"locale_name":"Français","locale":"fr"},{"locale_name":"Hrvatski","locale":"hr"},{"locale_name":"Italiano","locale":"it"},{"locale_name":"Magyar","locale":"hu"},{"locale_name":"Nederlands","locale":"nl"},{"locale_name":"Norsk","locale":"no"},{"locale_name":"Polski","locale":"pl"},{"locale_name":"Português","locale":"pt"},{"locale_name":"Suomi","locale":"fi"},{"locale_name":"Svenska","locale":"sv"},{"locale_name":"Türkçe","locale":"tr"},{"locale_name":"Íslenska","locale":"is"},{"locale_name":"Čeština","locale":"cs"},{"locale_name":"Русский","locale":"ru"},{"locale_name":"ภาษาไทย","locale":"th"},{"locale_name":"中文 (简体)","locale":"zh"},{"locale_name":"中文 (繁體)","locale":"zh-TW"},{"locale_name":"日本語","locale":"ja"},{"locale_name":"한국어","locale":"ko"}],"base_direction":"ltr","request_host":"www.airbnb.co.kr"},"tracking_defaults":{"page":"user_profile_edit"},"phrases":{"shared.Add":"추가","shared.Cancel":"취소","shared.Verified":"인증 완료","shared.Learn More":"더 보기","shared.private":"사생활 보장","shared.Remove":"삭제하기","business_travel.work_email_address":"업무용 이메일","business_travel.quick_enroll.state.pending_verification":"인증 대기 중","business_travel.quick_enroll.help.new_entry.default":"다음번 검색 시 %{bold_start}여행 유형%{bold_end} 필터를 선택해 출장에 적합한 숙소를 찾아보세요. %{anchor_start}자세히 알아보기%{anchor_end}","business_travel.quick_enroll.help.new_entry.checking_with_dots":"확인 중...","business_travel.quick_enroll.help.verified.default":"출장을 위해 예약할 때는 출장 여행임을 표시하세요. %{anchor_start}자세히 알아보기%{anchor_end}","business_travel.quick_enroll.help.pending.default":"이메일 인증을 위해 받은 편지함을 확인해 주세요.","business_travel.quick_enroll.help.pending.resend_link":"%{anchor_start}인증 메일 재전송하기%{anchor_end}.","business_travel.quick_enroll.help.pending.sent":"인증 메일이 다음 이메일 주소로 재전송되었습니다. 편지함을 확인하세요.","business_travel.quick_enroll.help.pending.still_no_receive":"문제가 해결되지 않았나요? %{anchor_start}에어비앤비에 문의%{anchor_end}하세요.","business_travel.quick_enroll.help.pending.please_wait_with_dots":"잠시만 기다려 주세요...","business_travel.quick_enroll.removal_modal.header":"회사 이메일 삭제","business_travel.quick_enroll.removal_modal.title":"정말로 이 이메일 주소를 삭제하시겠어요?","business_travel.quick_enroll.removal_modal.text":"이 이메일 주소를 삭제한 후에 나중에 언제든 다른 주소를 추가할 수 있습니다.","business_travel.quick_enroll.removal_modal.btn.yes_remove":"네, 이메일을 삭제해 주세요","business_travel.quick_enroll.learn_more.header":"출장 숙소 예약하는 방법","business_travel.quick_enroll.learn_more.s1.title":"여행 목적으로 '출장'을 선택하세요","business_travel.quick_enroll.learn_more.s1.text":"마음에 드는 숙소를 예약할 때 여행 목적으로 '출장'을 선택해 회사에 이 예약에 대한 메모를 보내세요.","business_travel.quick_enroll.learn_more.s2.title":"편리한 비용 처리","business_travel.quick_enroll.learn_more.s2.text":"여행 영수증이 발급됩니다. 회사에서 아직 자동 청구 또는 신용카드를 결제 옵션으로 설정하지 않은 경우 경비 처리에 이 영수증을 사용하세요.","business_travel.quick_enroll.learn_more.footer":"궁금한 점이 있으시면 %{bt_link_start}비즈니스 프로그램%{bt_link_end}을 방문하시거나 %{faq_link_start}도움말%{faq_link_end}을 읽어 보세요.","business_travel.quick_enroll.error.delete.unfinished_business":"진행 중이거나 예정된 예약과 연관된 메일이 한 개 이상 있기 때문에 삭제할 수 없습니다.","business_travel.quick_enroll.first_trip_promo.text":"%{min_spend_amount} 이상의 첫 출장을 완료하고 %{credit}의 크레딧을 적립하세요. %{link_start}자세히 알아보기%{link_end}"},"trebuchets":{},"breakpointCookie":"4","themeId":1,"i18nInit":{"locale":"ko","language":"ko","moment_locale":"ko","country":"KR","tld_country":"KR","currencies":[{"code":"ZAR","id":"ZAR","localized_full_name":"남아프리카공화국 란드","name":"Rand","symbol":"R","unicode_symbol":"R","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"NOK","id":"NOK","localized_full_name":"노르웨이 크로네","name":"Krone","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"NZD","id":"NZD","localized_full_name":"뉴질랜드 달러","name":"New Zealand Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"DKK","id":"DKK","localized_full_name":"덴마크 크로네","name":"Danish Kroner","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"RUB","id":"RUB","localized_full_name":"러시아 루블","name":"Rubles","symbol":"&amp;#1088;","unicode_symbol":"₽","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":false},{"code":"RON","id":"RON","localized_full_name":"루마니아 레우","name":"New Lei","symbol":"lei","unicode_symbol":"lei","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MYR","id":"MYR","localized_full_name":"말레이시아 링깃","name":"Ringgits","symbol":"&amp;#82;&amp;#77;","unicode_symbol":"RM","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MXN","id":"MXN","localized_full_name":"멕시코 페소","name":"Mexican Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"MAD","id":"MAD","localized_full_name":"모로코 디르함","name":"Moroccan Dirham","symbol":"MAD","unicode_symbol":"MAD","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"USD","id":"USD","localized_full_name":"미국 달러","name":"United States Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"VND","id":"VND","localized_full_name":"베트남 동","name":"Vietnamese Dong","symbol":"&amp;#8363;","unicode_symbol":"₫","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BGN","id":"BGN","localized_full_name":"불가리아 레프","name":"Bulgarian Leva","symbol":"&amp;#1083;&amp;#1074;","unicode_symbol":"лв","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"BRL","id":"BRL","localized_full_name":"브라질 레알","name":"Brazilian Reais","symbol":"R$","unicode_symbol":"R$","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SAR","id":"SAR","localized_full_name":"사우스아라비아 리얄","name":"Saudi Riyal","symbol":"SR","unicode_symbol":"SR","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SEK","id":"SEK","localized_full_name":"스웨덴 크로나","name":"Sweden, Kronor","symbol":"kr","unicode_symbol":"kr","show_currency_explicitly":true,"explicit_currency_not_aesthetic":true,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CHF","id":"CHF","localized_full_name":"스위스 프랑","name":"Swiss Francs","symbol":"CHF","unicode_symbol":"CHF","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":true,"position":"after","space_between_price_and_symbol":true},{"code":"TWD","id":"TWD","localized_full_name":"신 타이완 달러","name":"Taiwan Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"SGD","id":"SGD","localized_full_name":"싱가포르 달러","name":"Singapore, Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AED","id":"AED","localized_full_name":"아랍에미리트 디르함","name":"United Arab Emirates Dirham","symbol":"&amp;#1583;.&amp;#1573;","unicode_symbol":"ﺩ.ﺇ","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"ARS","id":"ARS","localized_full_name":"아르헨티나 페소","name":"Argentinian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"GBP","id":"GBP","localized_full_name":"영국 파운드","name":"Pounds Sterling","symbol":"&amp;pound;","unicode_symbol":"£","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UYU","id":"UYU","localized_full_name":"우루과이 페소","name":"Uruguayan Pesos","symbol":"&amp;#36;&amp;#85;","unicode_symbol":"$U","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"UAH","id":"UAH","localized_full_name":"우크라이나 그리브나","name":"Ukrainian hryvnia","symbol":"&amp;#8372;","unicode_symbol":"₴","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"EUR","id":"EUR","localized_full_name":"유로","name":"Euro","symbol":"&amp;euro;","unicode_symbol":"€","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"special","space_between_price_and_symbol":false},{"code":"ILS","id":"ILS","localized_full_name":"이스라엘 신 셰켈","name":"New Shekels","symbol":"&amp;#8362;","unicode_symbol":"₪","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"INR","id":"INR","localized_full_name":"인도 루피","name":"Indian Rupee","symbol":"&amp;#8377;","unicode_symbol":"₹","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"IDR","id":"IDR","localized_full_name":"인도네시아 루피아","name":"Indonesian Rupiah","symbol":"Rp","unicode_symbol":"Rp","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"JPY","id":"JPY","localized_full_name":"일본 엔","name":"Yen","symbol":"&amp;yen;","unicode_symbol":"¥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":true},{"code":"CNY","id":"CNY","localized_full_name":"중국 위안","name":"Chinese Yuan","symbol":"&amp;#65509;","unicode_symbol":"￥","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CZK","id":"CZK","localized_full_name":"체코 코루나","name":"Czech Koruny","symbol":"&amp;#75;&amp;#269;","unicode_symbol":"Kč","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"CLP","id":"CLP","localized_full_name":"칠레 페소","name":"Chilean Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CAD","id":"CAD","localized_full_name":"캐나다 달러","name":"Canadian Dollar","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"CRC","id":"CRC","localized_full_name":"코스타리카 콜론","name":"Colon","symbol":"&amp;#8353;","unicode_symbol":"₡","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"COP","id":"COP","localized_full_name":"콜롬비아 페소","name":"Columbian Pesos","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HRK","id":"HRK","localized_full_name":"크로아티아 쿠나","name":"Croatian Kuna","symbol":"kn","unicode_symbol":"kn","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"THB","id":"THB","localized_full_name":"태국 바트","name":"Baht","symbol":"&amp;#3647;","unicode_symbol":"฿","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"TRY","id":"TRY","localized_full_name":"터키 리라","name":"Turkish Lira","symbol":"&amp;#84;&amp;#76;","unicode_symbol":"₺","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PEN","id":"PEN","localized_full_name":"페루 솔","name":"Nuevos Soles","symbol":"&amp;#83;&amp;#47;","unicode_symbol":"S/","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"PLN","id":"PLN","localized_full_name":"폴란드 즐로티","name":"Zlotych","symbol":"z&amp;#22;&amp;#322;","unicode_symbol":"zł","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"after","space_between_price_and_symbol":true},{"code":"PHP","id":"PHP","localized_full_name":"필리핀 페소","name":"Philippines Peso","symbol":"&amp;#8369;","unicode_symbol":"₱","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"KRW","id":"KRW","localized_full_name":"한국 원","name":"South Korean Won","symbol":"&amp;#8361;","unicode_symbol":"₩","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HUF","id":"HUF","localized_full_name":"헝가리 포린트","name":"Forint","symbol":"Ft","unicode_symbol":"Ft","show_currency_explicitly":false,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"AUD","id":"AUD","localized_full_name":"호주 달러","name":"Australian Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false},{"code":"HKD","id":"HKD","localized_full_name":"홍콩 달러","name":"Hong Kong Dollars","symbol":"$","unicode_symbol":"$","show_currency_explicitly":true,"explicit_currency_not_aesthetic":false,"hide_code_if_symbol_shown":false,"position":"before","space_between_price_and_symbol":false}],"current_locale_name":"한국어","languages":[{"locale_name":"Bahasa Indonesia","locale":"id"},{"locale_name":"Bahasa Melayu","locale":"ms"},{"locale_name":"Català","locale":"ca"},{"locale_name":"Dansk","locale":"da"},{"locale_name":"Deutsch","locale":"de"},{"locale_name":"English","locale":"en"},{"locale_name":"Español","locale":"es"},{"locale_name":"Eλληνικά","locale":"el"},{"locale_name":"Français","locale":"fr"},{"locale_name":"Hrvatski","locale":"hr"},{"locale_name":"Italiano","locale":"it"},{"locale_name":"Magyar","locale":"hu"},{"locale_name":"Nederlands","locale":"nl"},{"locale_name":"Norsk","locale":"no"},{"locale_name":"Polski","locale":"pl"},{"locale_name":"Português","locale":"pt"},{"locale_name":"Suomi","locale":"fi"},{"locale_name":"Svenska","locale":"sv"},{"locale_name":"Türkçe","locale":"tr"},{"locale_name":"Íslenska","locale":"is"},{"locale_name":"Čeština","locale":"cs"},{"locale_name":"Русский","locale":"ru"},{"locale_name":"ภาษาไทย","locale":"th"},{"locale_name":"中文 (简体)","locale":"zh"},{"locale_name":"中文 (繁體)","locale":"zh-TW"},{"locale_name":"日本語","locale":"ja"},{"locale_name":"한국어","locale":"ko"}],"base_direction":"ltr","request_host":"www.airbnb.co.kr"}}--></script>
<script type="application/json" data-aphrodite-css="business_travel/quick_enroll.bundle.js"><!--["_1k01n3v1"]--></script>
  </div>
</div>



<button type="submit" class="btn btn-primary btn-large">
  저장하기
</button>
</form>




<div class="modal reauth-modal" role="dialog" aria-hidden="true" style="">
  <div class="modal-table">
    <div class="modal-cell">
      <div class="modal-content signup">
        
<div id="reauthenticate_container">
  <form accept-charset="UTF-8" action="?" id="reauth_form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="V4$.airbnb.co.kr$jk61MSGPzxc$rxUh2p_3LTE_mWMb45e7Pp8TnvNAKTVWzbBgKAtL2tI="></div>
    <h3 class="panel-header panel-header-gray">
      <a href="#" data-behavior="modal-close" class="modal-close"></a>
      계속하려면 비밀번호를 확인해 주세요.
    </h3>
    <div class="panel-header alert alert-header alert-with-icon alert-danger" hidden="">
       <i class="icon icon-alert-alt alert-icon"></i>
       <span class="reauth-error"></span>
    </div>
    <div class="panel-padding panel-body">
      <div class="textInput text-input-container" id="inputEmail">
        
          <input class="decorative-input" id="confirm_password" name="password" placeholder="비밀번호" type="password">
          <div class="clearfix control-group space-top-2 text-right">
          <a href="/forgot_password?email=fine2656%40gmail.com" class="forgot-password">비밀번호가 생각나지 않으세요?</a>
          </div>
      </div>
    </div>
      <div class="panel-footer">
        <button type="submit" class="btn btn-primary">
          비밀번호 확인
        </button>
      </div>
</form></div>

      </div>
    </div>
  </div>
</div>




      </div>
    </div>
  </div>

</body>
</html>
