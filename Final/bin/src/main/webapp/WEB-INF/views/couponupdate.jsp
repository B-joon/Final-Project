<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 쿠폰수정</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
	<%@include file="./common.jsp"%>

	<form action="couponupdateres.do">
		<input type="hidden" name="userseq" value="${login.userseq }">
		<input type="hidden" name="makeseq" value="${dto.makeseq}">
		<table>

			<tr>
				<th>제목</th>
				<td><input type="text" name="coupontitle"
					value="${dto.coupontitle }"></td>

			</tr>

			<tr>
				<th>금액</th>
				<td><select name="discount" id="discount">
						<option value="10000">10000원</option>
						<option value="5000">5000원</option>
						<option value="2000">2000원</option>
				</select></td>
			</tr>

			<tr>
				<th>쿠폰 만료일</th>
				<td><input type="date" name="endday" value="${dto.endday }"></td>
			</tr>
			<tr>
			<td colspan="3" align="right">
			<input type="submit" value="수정하기">
			</td>
			</tr>
		</table>
	</form>

</body>
</html>