<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="insertres.do" method="post">
	<input type="hidden" value="NOTICE" name="boardkind">
		<table border="1">
			
			<tr>
				<th>제목</th>
				<td><input type="text" name="boardtitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="boardcontent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="글작성">
					<input type="button" value="취소" onclick="location.href='noticelist.do'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>