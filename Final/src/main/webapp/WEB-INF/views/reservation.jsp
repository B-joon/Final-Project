<%@page import="com.ptsd.mvc.product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PSTD / 상품 예매 페이지</title>
</head>
<body>
	<%@include file="./common.jsp"%>

	<div class="row">
		<div class="col-sm-9 overflow-auto">			
			<div class="card border border-danger">
				<div class="card-body text-center">
					<h5 class="card-title font-weight-bold">${dto.productname }</h5>
				</div>
				<div class="card-body m-3">
					<div class="row">
						<div class="col-sm-5">
							<img src="${dto.thumbimg }" class="card-img-top border border-danger m-2" onerror="this.src='resources/img/noimage.png'" width="300" alt="${dto.productname }">
							<p class="card-text m-2"><i class="far fa-heart"></i> 찜하기 / <b>${dto.wishcount }</b></p>
						</div>
						<div class="col-sm-7">
							<div class="row">
								<div class="col-sm-3">
									<p class="card-text">장소</p>
									<p class="card-text">공연기간</p>
									<p class="card-text">공연시간</p>
									<p class="card-text">관람등급</p>
									<p class="card-text">가격</p>
								</div>
								<div class="col-sm-9">
									<p class="card-text"><a href="#" class="text-reset">${dto.address }</a></p>
									<p class="card-text">${dto.startdate } ~ ${dto.enddate }</p>
									<p class="card-text">${dto.runtime }</p>
									<p class="card-text">${dto.rating }</p>
									<p class="card-text">${dto.price } 원</p>
									<input type="hidden" id="ticketprice" value="${dto.price }">
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<div class="card-body border-top m-3">
					${dto.productcontent }
				</div>
			</div>
		</div>
		<div class="col-sm-3 border border-danger text-center rounded float-right">
			<div class="font-weight-bold m-2">예약날짜 선택</div>
			<div id="datetimepicker"></div>
			<div class="m-3 border-top">
				<div class="font-weight-bold m-2">예매인원 선택</div>
				<div class="m-2">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">성인기준</label>
						</div>
						<select class="custom-select" id="inputGroupSelect01"
							name="ticketcount">
							<option value="" disabled selected>인원선택</option>
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
					</div>
				</div>
					<div class="m-2 border-bottom">
						<p class="font-weight-bold">남은좌석수</p><p class="font-weight-normal">0 / ${dto.seatcount }</p>
						
					</div>
					<div class="m-2">
						<button type="button" class="btn btn-danger" onclick="goPayment();">예매하기</button>
					</div>
					<div class="m-2">
					<form name="form1" id="form1" method="post" action="wishInsert.do">
						<input type="hidden" name="productseq" value="${dto.productseq }">
						<button type="button" class="btn btn-danger" onclick="document.getElementById('form1').submit();" value="찜하기">👍 찜하기</button>
					</form>
					</div>
			</div>
		</div>
	</div>

	<!-- 댓글 후기 -->

	<script type="text/javascript" src="resources/js/reviewandlike.js"></script>
	<form action="reviewinsert.do">
		<input type="hidden" name="productseq" value="${dto.productseq }">
		<input type="hidden" name="userseq" value="${login.userseq }">
		<input type="text" name="reviewname" value="${login.name }"
			readonly="readonly"><br>
		<textarea rows="2" cols="80" name="reviewcontent"></textarea>
		<br> <input type="submit" value="댓글 작성">
	</form>
	<c:choose>
		<c:when test="${empty reviewlist }">
----------작성된 글이 존재하지 않습니다---------
			</c:when>
		<c:otherwise>
			<c:forEach items="${reviewlist }" var="reviewdto">
				<div class="list${reviewdto.reviewseq }" style="display: block">
					<div onclick="like(${reviewdto.reviewseq }, ${login.userseq });">
						<div style="text-align: right;" onclick="likeEvent(${reviewdto.reviewseq });">
							<input name="like${reviewdto.reviewseq }" value="like${reviewdto.reviewseq }" type="hidden">
							<input class="like${reviewdto.reviewseq }" name="" type="hidden">
							<div class="likeseq${reviewdto.reviewseq }">${reviewdto.reviewlikecnt } </div>
						</div>
					</div>
					${reviewdto.reviewname }<br> ${reviewdto.reviewcontent }
					<div class="review-btn">
					<button onclick="Update(${reviewdto.reviewseq });">수정</button>
					<button onclick="location.href='reviewdel.do?reviewseq=${reviewdto.reviewseq}&productseq=${dto.productseq }'">삭제</button>
					</div>
					<span>${reviewdto.reviewdate }</span><br>
				</div>
				<div class="update${reviewdto.reviewseq }" style="display: none">
				<form action="reviewupdate.do">
					<input type="hidden" name="reviewseq" value="${reviewdto.reviewseq}">
					<input type="hidden" name="productseq" value="${reviewdto.productseq }">
					<input type="text" name="reviewname" value="${reviewdto.reviewname }" readonly="readonly"><br>
					<textarea rows="2" cols="80" name="reviewcontent"></textarea><br>
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="NoUpdate(${reviewdto.reviewseq });">
					
				</form>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>


</div>
</body>
<script type="text/javascript" src="resources/js/datepicker.js"></script>
<script type="text/javascript" src="resources/js/reservation.js"></script>
</html>