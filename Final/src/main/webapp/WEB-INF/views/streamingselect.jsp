<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 방송 중</title>
<link rel="stylesheet" type="text/css" href="resources/css/chat.css">
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
</head>
<body>
<%@include file="./common.jsp" %>
	<h1 id="selectRoom">${dto.streamingname }</h1>
	
	<div>webRTC 화면 송출 부분 입니다.</div>
	
	<div>
		<ul id="messages" type="none">
	        <li id="usercount"></li>
	    </ul>
	
	    <form id="msgform">
	        <input id="msginput" autocomplete="off" type="text">
	        <button type="submit">전송</button>
	    </form>
	    <input id="dtn" type="button" value="방송 종료" onclick="location.href='streamingdel.do?streamingseq=${dto.streamingseq}'">
	</div>
	<input type="hidden" value="${login.name }" id="username">
	<input type="hidden" value="${login.userrole }" id="userrole">
	<script type="text/javascript" src="resources/js/chat.js"></script>
</body>

</html>