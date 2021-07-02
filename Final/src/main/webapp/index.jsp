<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if((UserDto)session.getAttribute("login") != null){
		UserDto login = (UserDto)session.getAttribute("login");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<%
	UserDto login = (UserDto)session.getAttribute("login"); 
%>
<body>
	<input type="hidden" id="sessionLogin" value="${login }">
	<a href="noticelist.do">공지</a>
	<a href="eventlist.do">이벤트</a>
	<a href="chatbot.do">챗봇대화</a>
	
	<a href="streaming.do">streaming</a>
	<%
	
	if(login != null){
		
	%>
	<a href="logout.do">logout</a>
	<a href="mypage.do">mypage</a>
	<% 
		if(login.getUserrole().equals("admin")){
			
	%>
	<a href="admin.do">adminpage</a>
	
	<%
		}
	}else{
	%>
		<a href="loginform.do">login...</a>
	<%
	}
	%>

	<!-- 축제 정보를 ajax로 받기 + 직접 상품 등록으로 등록한 공연도 보이게끔 해야함 + 위치기반 조회도??? -->
	<br/>
	<hr/>
	<button>축제</button><button>공연</button>
	<br/>
	<select name="partyareaCode"  onchange="chkPartyAreaCode();">
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
	
	<hr/>
	<div id="partylist">
	</div>

	<%-- 상단으로 이동하기 버튼 시작 --%>
	<div class="top">
		<button id="btn" onClick="GoTop()">▲</button>
	</div>
	<%-- 상단으로 이동하기 버튼 끝 --%>

</body>
<script type="text/javascript" src="resources/js/party.js"></script>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<script type="text/javascript" src="resources/js/gotop.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/gotop.css">
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
</html>
