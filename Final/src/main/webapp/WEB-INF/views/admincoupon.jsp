<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function createCoupon() {
		var selected = $("#discount option:selected").val();
		alert(selected);
		
	}
</script>


<body>


	<form action="createcoupon.do">
		<h2>쿠폰생성</h2>
		<input type="text" name="coupontitle">
		<p>
			금액선택 <select name="discount" id="discount">
				<option value="10000">10000원</option>
				<option value="5000">5000원</option>
				<option value="2000">2000원</option>
			</select>

		</p>
		<input type="submit" value="생성하기">

	</form>


</body>
</html>