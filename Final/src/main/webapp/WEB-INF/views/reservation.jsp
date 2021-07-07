<%@page import="com.ptsd.mvc.product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PSTD / 상품 예매 페이지</title>
</head>
<body>
<%@include file="./common.jsp" %>

	<div class="row">
	<div class="col-sm-8">
	공연정보
	</div>
	<div class="col-sm-4 border border-primary text-center rounded">
		<div class="font-weight-bold m-2">예약날짜 선택</div>
        <div id="datetimepicker"></div>
        <div class=""></div>
	</div>
	</div>
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
	
	<br><br><br>
	<!-- 댓글 후기 -->
	
	<script type="text/javascript">
	// 좋아요
	$(document).ready(function () {
		var likeseq = ${likeseq};
		var productseq = $('input[name=inputName]').val();
		
		if (likeseq > 0) {
			console.log(likeseq);
			$(".likeseq").prop("value", "♥")
			$(".like").prop('name', likeseq);
		} else {
			console.log(likeseq);
			$(".likeseq").prop("value", "♡")
			$(".like").prop('name', likeseq);
		}
		
		$(".like").on("click", function () {
			
			var that = $(".like");
			
			var sendData = {'productseq' : productseq, 'like' : that.prop('name')};
			
			$.ajax({
				url : 'reservation.do',
				type : 'POST',
				data : sendData,
				success: function () {
					that.prop('name', data);
					if (data == 1) {
						$(".likeseq").prop("value", "https://e7.pngegg.com/pngimages/22/527/png-clipart-heart-open-free-content-heart.png");
					} else {
						$(".likeseq").prop("value", "https://w7.pngwing.com/pngs/518/473/png-transparent-heart-symbol-heart-line-love-text-heart.png")
					}
				}
			});
			
		});
		
	});
	</script>
	
	<input type="button" value="댓글 작성" class ="reviewinsert"
		onclick="location.href='reviewinsert.do'">
		<c:choose>
			<c:when test="${empty reviewlist }">
----------작성된 글이 존재하지 않습니다---------
			</c:when>
			<c:otherwise>
				<c:forEach items="${reviewlist }" var="reviewdto">
				<div style="border: 1px">
					${reviewdto.reviewname }<br>
					${reviewdto.reviewcontent }
					<div class="review-btn">
					<button onclick="location.href='reviewupdate.do?reviewseq=${reviewdto.reviewseq}'">수정</button>
					<button onclick="location.href='reviewdel.do?reviewseq=${reviewdto.reviewseq}'">삭제</button>
					</div><br>
					<span>${reviewdto.reviewdate }</span><br>
					<div style="text-align: right;">
						<a class="like">
							<input class="likeseq" type="text" value="" readonly="readonly">
						</a>
					</div>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		
</div>	
</body>
<script type="text/javascript" src="resources/js/datepicker.js"></script>
</html>