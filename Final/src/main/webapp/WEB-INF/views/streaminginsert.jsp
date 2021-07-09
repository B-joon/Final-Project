<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 방송 생성</title>
</head>
<body>
<%@include file="./common.jsp" %>
	<form action="streamingres.do" method="get">
		<input type="text" name="streamingname">
		<input type="submit" value="생성">
	</form>


</body>
</html>