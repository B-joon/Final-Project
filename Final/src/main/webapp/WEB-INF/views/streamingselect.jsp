<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/css/chat.css">
    <script src="http://localhost:3000/socket.io/socket.io.js"></script>
</head>
<body>

	<h1 id="selectRoom">${dto.streamingname }</h1>
	
	<ul id="messages" type="none">
        <li id="usercount"></li>
    </ul>

    <form id="msgform">
        <input id="msginput" autocomplete="off" type="text">
        <button type="submit">전송</button>
    </form>
    <input type="button" value="방송 종료" onclick="location.href='streamingdel.do?streamingseq=${dto.streamingseq}'">
	
	<script type="text/javascript" src="resources/js/chat.js"></script>
</body>
</html>