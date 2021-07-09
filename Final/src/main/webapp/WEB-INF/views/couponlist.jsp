<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 쿠폰</title>
</head>




<body>
<%@include file="./common.jsp" %>

	<a href="makecoupon.do">쿠폰생성</a>
	
	<h1>발급 된 쿠폰 내역</h1>
	<table border="1">


		<col width="50">
		<col width="500">
		<col width="100">
		<col width="100">


		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>할인금액</th>
			<th>쿠폰만료일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" align="center">----------작성된 글이 존재하지
						않습니다---------</td>
				</tr>

			</c:when>
			<c:otherwise>

				<c:forEach items="${list }" var="dto">
					
						<tr>
							<td>${dto.makeseq }</td>
							<td><a href="couponselect.do?makeseq=${dto.makeseq }">${dto.coupontitle}</a></td>
							<td>${dto.discount }</td>
							<td>${dto.endday }</td>
						</tr>
					
				</c:forEach>

			</c:otherwise>
		</c:choose>


		<tr>
			<td colspan="4" align="right"><input type="button" value="글작성"
				class="insertControl" onclick="location.href='eventinsertform.do'">
			</td>
		</tr>

	</table>


	


</body>
</html>