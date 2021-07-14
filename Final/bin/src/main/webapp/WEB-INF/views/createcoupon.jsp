<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 쿠폰생성</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
<%@include file="./common.jsp" %>


<form action="createcoupon.do">
	<input type="hidden" name="userseq" value="${login.userseq }">
		<h2>쿠폰생성</h2>
		<input type="text" name="coupontitle" placeholder="쿠폰명을 입력하세요">
		<p>
			금액선택 <select name="discount" id="discount">
				<option value="10000">10000원</option>
				<option value="5000">5000원</option>
				<option value="2000">2000원</option>
			</select>

		</p>
		쿠폰 만료일 : <br>
		<input type="date" name="endday"><br>
		<input type="submit" value="생성하기">

	</form>

</body>
</html>