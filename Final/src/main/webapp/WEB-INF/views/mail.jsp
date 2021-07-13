<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / Mail</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>

<body>
<%@include file="./common.jsp" %>
	<h1>메일 보내기</h1>
	
	<form action="mailSending.do" method="post">
		<div class="form-group">
			<input class="form-control" type="text" name="tomail" size="120"
				placeholder="이메일 주소를 입력하세요." />
		</div>
		<div class="form-group">
			<!-- 제목 -->
			<input class="form-control" type="text" name="subject" size="120" placeholder="제목을 입력해 주세요." />
		</div>
		<div class="form-group">
			<div align="center">
				<!-- 내용 -->
				<textarea name="content" class="form-control" rows="12" cols="120"
					placeholder="내용을 입력해 주세요."></textarea>
			</div>
			<div class="m-3" align="center">
				<input type="submit" class="btn btn-danger"  value="메일 보내기" />
				<button type="button" class="btn btn-dark"  onclick="location.href='admin.do'">돌아가기</button>
			</div>
		</div>
	</form>

</body>
</html>