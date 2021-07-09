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
	
	<input type="hidden" value="${login.name }" id="loginname">
	<input type="hidden" value="${dto.productname }" id="productname">
	
	<div class="row">
		<div class="col-sm-9">			
			<div class="card border border-danger">
				<div class="card-body text-center">
					<h5 class="card-title font-weight-bold">${dto.productname }</h5>
				</div>
				<div class="card-body m-3">
					<div class="row">
						<div class="col-sm-4">
							<img src="${dto.thumbimg }" class="card-img-top border border-danger m-2" onerror="this.src='resources/img/noimage.png'" width="300" alt="${dto.productname }">
							<p class="card-text m-2"><i class="far fa-heart"></i> 찜하기 / <b>${dto.wishcount }</b></p>
						</div>
						<div class="col-sm-8">
							<div class="row mb-3">
								<div class="col-sm-3">
									<p class="card-text">장소</p>
								</div>
								<div class="col-sm-9">
									<p class="card-text"><a href="#" class="text-reset">${dto.address }</a></p>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<p class="card-text">공연기간</p>
								</div>
								<div class="col-sm-9">
									<p class="card-text">${dto.startdate } ~ ${dto.enddate }</p>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<p class="card-text">공연시간</p>
								</div>
								<div class="col-sm-9">
									<p class="card-text">${dto.runtime }</p>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<p class="card-text">관람등급</p>
								</div>
								<div class="col-sm-9">
									<p class="card-text">${dto.rating }</p>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<p class="card-text">가격</p>
								</div>
								<div class="col-sm-9">
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
				<div class="card m-3">
				<div class="card-body">
					<form action="reviewinsert.do">
						<input type="hidden" name="productseq" value="${dto.productseq }">
						<input type="hidden" name="userseq" value="${login.userseq }">
						<input type="hidden" name="reviewname" value="${login.name }">
						<div class="form-group">
							<label for="commentarea"><i class="fas fa-user">  ${login.name }</i>
							</label>
							  <div class="col-sm-10">
							   <textarea class="form-control" name="reviewcontent" id="commentarea" rows="3" placeholder="댓글을 입력하세요."></textarea>
							  </div>
						</div>
						<button type="submit" class="btn btn-danger btn-sm">댓글 작성</button> 
					</form>
				</div>
				</div>
				<div class="card-body m-3">
					<h3 class="text-center font-weight-bold">댓글 확인</h3>
					<c:choose>
						<c:when test="${empty reviewlist }">
							리뷰가 없습니다.
						</c:when>
						<c:otherwise>
							<c:forEach items="${reviewlist }" var="reviewdto">
								<div class="card m-3">
									  <div class="card-body">
									    <h5 class="card-title"><i class="fas fa-user">  ${reviewdto.reviewname }</i></h5>
									    <p class="card-text">${reviewdto.reviewcontent }</p><small class="text-muted">${reviewdto.reviewdate }</small>

									  </div>
									<div class="card-body">
										<span class="list${reviewdto.reviewseq }">
											<span class="button" tabindex="0" onclick="like(${reviewdto.reviewseq }, ${login.userseq });">
												<span onclick="likeEvent(${reviewdto.reviewseq });">
													<input name="like${reviewdto.reviewseq }" value="like${reviewdto.reviewseq }" type="hidden">
													<input class="like${reviewdto.reviewseq }" type="hidden">
													<span class="badge badge-pill badge-light">${reviewdto.reviewlikecnt }</span>
													<span class="likeseq${reviewdto.reviewseq } btn"></span>
												</span>
											</span>
										</span>
								    	<button class="btn btn-danger btn-sm ml-3" onclick="Update(${reviewdto.reviewseq });">수정</button>
										<button class="btn btn-dark btn-sm" onclick="location.href='reviewdel.do?reviewseq=${reviewdto.reviewseq}&productseq=${dto.productseq }'">삭제</button>
								    </div>
							    </div>
								<div class="update${reviewdto.reviewseq }" style="display: none">
								<div class="card">
									<div class="card-body">
									
									<form action="reviewupdate.do">
										<input type="hidden" name="reviewseq" value="${reviewdto.reviewseq}">
										<input type="hidden" name="productseq" value="${reviewdto.productseq }">
										<div class="form-group">
											<label for="reviewarea"><i class="fas fa-user">  ${login.name }</i></label>
									  	<div class="col-sm-10">
									   		<textarea class="form-control" name="reviewcontent" id="reviewarea" rows="3" >${reviewdto.reviewcontent }</textarea>
									  	</div>
										</div>
										<button type="submit" class="btn btn-danger btn-sm">수정하기</button> 
										<button type="button" onclick="NoUpdate(${reviewdto.reviewseq });" class="btn btn-dark btn-sm">취소</button> 							
									</form>
									</div>
								</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>					
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
						<button type="button" class="btn btn-danger" onclick="requestPay();">예매하기</button>
					</div>
			</div>
		</div>
	</div>

	<!-- 댓글 후기 -->

	<script type="text/javascript" src="resources/js/reviewandlike.js"></script>




</div>
</body>
<script type="text/javascript" src="resources/js/datepicker.js"></script>
<script type="text/javascript" src="resources/js/reservation.js"></script>
</html>