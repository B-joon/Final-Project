<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<%@include file="./common.jsp" %>

	<h1>ADMIN</h1>

	<a href="coupon.do">쿠폰관리</a>
	<a href="mailform.do">email..</a>
	<a href="chart.do">차트</a>
	<!-- 상품 등록 페이지 (어드민 권한이 있는 경우에만 나타나게 해야함) -->
	<a href="productinsert.do">상품등록</a>
	<a href="userlist.do">회원전체목록조회 </a>
	<a href="usersearchpage.do">회원정보검색</a>
	<h3>상품리스트</h3>
	<select name="productareaCode"  onchange="chkProductAreaCode();">
	<!-- 축제 정보를 ajax로 받기 -->
		<option value="0" selected>전체</option>
		<option value="1">서울</option>
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