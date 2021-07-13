<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PTSD / 회원 목록</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
<%@include file="./common.jsp" %>	

	<h1>가입 유저 리스트</h1>
	
	<table class="table table-dark tbl-ex">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>유저등급</th>
			<th>탈퇴시키기</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="4">--------가입된 회원이 없습니다.-----------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.userseq }</td>
						<td>${dto.name }</td>
						<td>${dto.userid }</td>
						<td>${dto.email }</td>
						<td>${dto.address }</td>
						<td>${dto.phone }</td>
						<td>${dto.userrole }</td>
						<td><input type="button" class="btn btn-danger" value="유저 탈퇴" onclick="location.href='userdelete.do?userseq=${dto.userseq }'"></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="8" align="right">
				<input type="button" class="btn btn-danger" value="관리자페이지" onclick="location.href='admin.do'">
				<input type="button" class="btn btn-info" value="회원 정보 검색" onclick="location.href='usersearchpage.do'">
			</td>
		</tr>
	</table>
	
</body>
</html>