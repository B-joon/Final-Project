<%@ page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDto login = (UserDto)session.getAttribute("login");
%> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
<script type="text/javascript" src="resources/js/gotop.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/gotop.css">


	<%-- 상단으로 이동하기 버튼 시작 --%>
	<div class="top">
		<button id="btn" onClick="GoTop()">▲</button>
	</div>
	<%-- 상단으로 이동하기 버튼 끝 --%>

	<input type="hidden" id="sessionLogin" value="${login }">
	<a href="main.do">메인</a>
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
    

<h1>COMMON 파일</h1>