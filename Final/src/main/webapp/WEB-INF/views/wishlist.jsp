<%@page import="com.ptsd.mvc.product.ProductDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜하기 목록</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>제목</th>
			<th>주소</th>
			<th>사진</th>
			<th>전화번호</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4">----------찜한 축제가 없습니다----------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<c:if test="${dto.postDelflag eq 'N'}">
						<tr>
							<td>${dto.productName }</td>
							<td>${dto.address }</td>
							<td>${dto.thumbing }</td>
							<td>${dto.address }</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>