<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<h1>ADMIN</h1>
	<!-- 상품 등록 페이지 (어드민 권한이 있는 경우에만 나타나게 해야함) -->
	<a href="productinsert.do">상품등록</a>
	
	<h3>상품리스트</h3>
	<select name="productareaCode"  onchange="getProductList();">
	<!-- 축제 정보를 ajax로 받기 -->
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
	
	<div id="partylist">
	
	
	
	</div>
	

</body>
<script type="text/javascript" src="resources/js/adminpage.js"></script>
</html>