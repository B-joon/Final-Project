<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 내 쿠폰함</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
<%@include file="./common.jsp" %>

<h1>${login.getName() } 님의 쿠폰함입니다.</h1>


<table>

	<tr>
		<th>쿠폰이름</th>
		<th>할인금액</th>
		<th>유효기간</th>
	</tr>
	
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="3" align="center">====쿠폰함이 비었습니다====</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
			
			<c:if test="${dto.userseq == login.userseq }">
			
				<tr>
					<td>${dto.coupontitle }</td>
					<td>${dto.discount }</td>
					<td>${dto.endday }</td>
				</tr>
			</c:if>
			</c:forEach>	
			
		</c:otherwise>
		
		
	
	</c:choose>
	
</table>


</body>
</html>