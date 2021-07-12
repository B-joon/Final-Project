<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 이벤트수정</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
<%@include file="./common.jsp" %>
<form action="eventupdateres.do" method="post">
		<input type="hidden" name="boardseq" value="${dto.boardseq }">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="boardname" readonly="readonly" value="${dto.boardname }"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="boardtitle" value="${dto.boardtitle }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="boardcontent">${dto.boardcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location.href='eventone.do?boardseq=${dto.boardseq}'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>