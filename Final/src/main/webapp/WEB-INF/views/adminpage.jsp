<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 관리자 페이지</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
<%@include file="./common.jsp" %>

	<h1>ADMIN</h1>
	
	<div class="border border-danger rounded">
		<a class="btn btn-danger m-3" href="coupon.do">쿠폰관리</a>
		<a class="btn btn-danger m-3" href="mailform.do">email</a>
		<a class="btn btn-danger m-3" href="productinsert.do">상품등록</a>
		<a class="btn btn-danger m-3" href="userlist.do">회원전체목록조회 </a>
		<a class="btn btn-danger m-3" href="usersearchpage.do">회원정보검색</a>
	</div>
	<div class="border border-danger rounded m-3">
	<h3 class="m-3">상품리스트</h3>
	<div class="row m-3">
	<select class="form-control col-sm-3" name="productareaCode"  onchange="chkProductAreaCode();">
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
	</div>
	<div class="m-3" id="partylist">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">상품번호</th>
		      <th scope="col">카테고리</th>
		      <th scope="col">상품명</th>
		      <th scope="col">주소</th>
		      <th scope="col">전화번호</th>
		      <th scope="col">관람등급</th>
		      <th scope="col">관객수</th>
		      <th scope="col">티켓가격</th>
		      <th scope="col">관리</th>
		    </tr>
		  </thead>
		</table>
	
	</div>
	</div>
</body>
<script type="text/javascript" src="resources/js/adminpage.js"></script>
</html>