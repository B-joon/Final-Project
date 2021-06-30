<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
		<fieldset>
			<legend>쿠폰생성</legend>
			<p>
				금액선택 
				<select name="discount">
					<option value="10000">10000원</option>
					<option value="5000">5000원</option>
					<option value="2000">2000원</option>
				</select>

			</p>
			<input type="button" value="생성하기" onclick="createCoupon();">
		</fieldset>
	


</body>
</html>