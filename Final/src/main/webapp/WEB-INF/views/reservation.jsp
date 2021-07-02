<%@page import="com.ptsd.mvc.product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PSTD / 상품 예매 페이지</title>
</head>
<body>

<h1>예매하기</h1>
	
<input type="text" name="productseq" value="${dto.productseq }" />
<input type="text" name="category" value="${dto.category }" />
<input type="text" name="productname" value="${dto.productname }" />
<input type="text" name="startdate" value="${dto.startdate }" />
<input type="text" name="enddate" value="${dto.enddate }" />
<input type="text" name="thumbimg" value="${dto.thumbimg }" />
<input type="text" name="productcontent" value="${dto.productcontent }" />
<input type="text" name="areacode" value="${dto.areacode }" />
<input type="text" name="address" value="${dto.address }" />
<input type="text" name="tellnumber" value="${dto.tellnumber }" />
<input type="text" name="runtime" value="${dto.runtime }" />
<input type="text" name="rating" value="${dto.rating }" />
<input type="text" name="seatcount" value="${dto.seatcount }" />
<input type="text" name="price" value="${dto.price }" />
<input type="text" name="likecount" value="${dto.likecount }" />
<input type="text" name="wishcount" value="${dto.wishcount }" />
<input type="text" name="productcount" value="${dto.productcount }" />

<p>인터파크 같은 사이트와 비슷하게 만들기
남은 관객수 보여주고 티켓 수 선택하게 하여 결제로 넘기기</p>
	<form action="payment.do" method="post">
	
	<span>성인</span>
	<select name="ticketcount">
		<option value="" disabled selected>인원수 선택</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
	</select>

<%
	ProductDto dto = (ProductDto) request.getAttribute("dto");
	if(dto.getRating().equals("ALL")) {
		
	

%>
	<span>어린이</span>
	<select name="ticketcountKids">
		<option value="" disabled selected>인원수 선택</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
	</select>

<%

	}
	
%>

	<input type="submit" value="결제하기">
	<input type="button" value="돌아가기" onclick="location.href='main.do'">
	</form>
</body>
</html>