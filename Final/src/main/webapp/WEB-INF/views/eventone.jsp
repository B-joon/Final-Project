<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
		<tr>
			<th>작성자</th>
			<td>${dto.boardname }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.boardtitle }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.boardcontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='eventupdateform.do?boardseq=${dto.boardseq}'">
				<input type="button" value="삭제" onclick="location.href='eventdelete.do?boardseq=${dto.boardseq}'">
				<input type="button" value="목록" onclick="location.href='eventlist.do'">
			</td>
		</tr>
	</table>

</body>
</html>