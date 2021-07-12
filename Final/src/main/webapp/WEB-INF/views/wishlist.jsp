<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.ptsd.mvc.product.ProductDto"%>
<%@page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜하기 목록</title>
</head>
<body>
	<%@include file="./common.jsp"%>
	<h1>${login.getName() } 님의 찜하기</h1><br/>
	<table border="1" style="text-align:center;">
		<col width="150">
		<col width="520">
		<col width="200">
		<col width="170">
		<col width="40">

		<tr>
			<th>제목</th>
			<th>주소</th>
			<th>사진</th>
			<th>전화번호</th>
			<th>삭제</th>
		</tr>

		<c:choose>
			<c:when test="${map.list == null }">
				<tr>
					<td colspan="6" align="center">----------찜한 공연이 없습니다----------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${map.list }" var="dto" varStatus="status">
					<c:if test="${dto.userseq == login.userseq }">
						<tr>
							<td><a href="reservation.do?productseq=${dto.productseq }">${dto.productname }</a></td>
							<td>${dto.address }</td>
							<td><img src="${dto.thumbimg }">
							<td>${dto.tellnumber}</td>
							<td><input type="button" value="삭제"
								onclick="location.href='wishDelete.do?wishseq=${dto.wishseq}'" /></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>