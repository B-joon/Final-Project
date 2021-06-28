<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/index.js" charset="UTF-8"></script>
</head>
<body>

	<a href="noticelist.do">공지</a>
	<a href="reservation.do">티켓예매</a>
	<a href="loginform.do">login...</a>
	<!-- 상품 등록 페이지 (어드민 권한이 있는 경우에만 나타나게 해야함) -->
	<a href="product.do">상품등록</a>
	<!-- 축제 정보를 ajax로 받기 + 직접 상품 등록으로 등록한 공연도 보이게끔 해야함 + 위치기반 조회도??? -->
	<br/>
	<hr/>
	<button>축제</button> <button>공연</button>
	<br/>
	<select name="partyareaCode"  onchange="getPartyList();">
		<option value="1" selected>서울</option>
		<option value="31">경기</option>
		<option value="2">인천</option>
		<option value="34">충남</option>
		<option value="33">충북</option>
		<option value="3">대전</option>
		<option value="8">세종</option>
		<option value="32">강원</option>
		<option value="38">전남</option>
		<option value="37">전북</option>
		<option value="5">광주</option>
		<option value="7">울산</option>
		<option value="4">대구</option>
		<option value="36">경남</option>
		<option value="35">경북</option>
		<option value="6">부산</option>
		<option value="39">제주</option>
	</select>
		<select name="productareaCode"  onchange="getProductList();">
		<option value="1" selected>서울</option>
		<option value="31">경기</option>
		<option value="2">인천</option>
		<option value="34">충남</option>
		<option value="33">충북</option>
		<option value="3">대전</option>
		<option value="8">세종</option>
		<option value="32">강원</option>
		<option value="38">전남</option>
		<option value="37">전북</option>
		<option value="5">광주</option>
		<option value="7">울산</option>
		<option value="4">대구</option>
		<option value="36">경남</option>
		<option value="35">경북</option>
		<option value="6">부산</option>
		<option value="39">제주</option>
	</select>
	
	<select name="category">
		<option value="" disabled selected>카테고리 선택</option>
		<option value="0">전체</option>
		<option value="1">뮤지컬</option>
		<option value="2">콘서트</option>
		<option value="3">연극</option>
		<option value="4">클래식/무용</option>
		<option value="5">스포츠</option>
		<option value="6">레저</option>
		<option value="7">전시/행사</option>
		<option value="8">아동/가족</option>
	</select>
	
	
	<hr/>
	<div id="partylist">
	</div>

</body>
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
</html>

