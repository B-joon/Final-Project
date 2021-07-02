<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send a Mail</title>
</head>
<body>
<%@include file="./common.jsp" %>
	<h1>메일 보내기</h1>
	
	<form action="mailSending.do" method="post">
		<div>
			<input type="text" name="tomail" size="120"
				placeholder="이메일 주소를 입력하세요." />
		</div>
		<div align="center">
			<!-- 제목 -->
			<input type="text" name="subject" size="120" placeholder="제목을 입력해 주세요." />
		</div>
		<div>
			<div align="center">
				<!-- 내용 -->
				<textarea name="content" rows="12" cols="120"
					placeholder="내용을 입력해 주세요."></textarea>
			</div>
			<div align="center">
				<input type="submit" value="메일 보내기" />
			</div>
		</div>
	</form>

</body>
</html>