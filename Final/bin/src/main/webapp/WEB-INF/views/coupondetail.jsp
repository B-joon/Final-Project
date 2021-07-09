<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="./common.jsp" %>


<table border="1">

		
		<tr>
			<th>쿠폰 제목</th>
			<td>${dto.coupontitle }</td>
		</tr>
		<tr>
			<th>금액</th>
			<td>${dto.discount }</td>
		</tr>
		<tr>
			<th>유효기간</th>
			<td><input type="date" value="${dto.endday }" readonly="readonly"></td>
		</tr>


		<tr>
			<td colspan="4" align="right">
				<input type="button" value="수정" onclick="location.href='couponupdateform.do?makeseq=${dto.makeseq}'">
				<input type="button" value="삭제" onclick="location.href='coupondelete.do?makeseq=${dto.makeseq}'">
				<input type="button" value="목록" onclick="location.href='coupon.do'">
			</td>
		</tr>

	</table>

</body>
</html>