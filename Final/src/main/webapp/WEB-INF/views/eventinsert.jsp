<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 이벤트생성</title>
</head>
<body>
<%@include file="./common.jsp" %>


	<form action="eventinsertres.do" method="post">
	<input type="hidden" value="EVENT" name="boardkind">
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
					<input type="button" value="취소" onclick="location.href='eventlist.do'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>