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

	<a href="noticelist.do">공지</a>
	<a href="reservation.do">티켓예매</a>
	<a href="loginform.do">login...</a>
	<!-- 축제 정보를 ajax로 받기 -->
	<select class="areaCode" name="areaCode"  onchange="getPartyList();">
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
	
	<input type="button" value="callList" onclick="getPartyList();">
	<div id="partylist">
	</div>

</body>
<script type="text/javascript" src="resources/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/css/index.css">
</html>

