<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 이벤트</title>
<link href="resources/img/favicon.png" rel="shortcut icon">
</head>

<body>

	<%@include file="./common.jsp"%>
	<h4 class="display-4">Event & Coupon</h4>

	<input type="hidden" value="${login.userseq }" id="loginseq">
	<input type="hidden" value="${login.userrole }" id="loginrole">
	<div class="container-lg">
		<table class="table table-bordered">


			<col width="50">
			<col width="100">
			<col width="500">
			<col width="100">



			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="4" align="center">----------작성된 글이 존재하지
							않습니다---------</td>
					</tr>

				</c:when>
				<c:otherwise>

					<c:forEach items="${list }" var="dto">
						<c:if test="${dto.boardkind == 'EVENT'}">
							<tr>
								<td>${dto.boardseq }</td>
								<td>${dto.boardname }</td>
								<td><a href="${dto.boardseq}">${dto.boardtitle }</a></td>
								<td>${dto.boarddate }</td>
							</tr>
						</c:if>
					</c:forEach>

				</c:otherwise>
			</c:choose>


			<tr>
				<td colspan="4" align="right"><input type="button" value="글작성"
					class="btn btn-danger notice-admin-btn" id="insertControl"
					onclick="location.href='eventinsertform.do'"></td>
			</tr>

		</table>
	</div>

	<!-- 페이지 앞으로 이동 -->
	<div id="pagingDiv">
		<c:if test="${paging.prev}">
			<a id="prev" href="${paging.startPage - 1 }">◀</a>
		</c:if>
		<c:forEach var="num" begin="${paging.startPage}"
			end="${paging.endPage }">
				&nbsp;<a href="${num }">${num }</a>&nbsp;
			</c:forEach>
		<!-- 페이지 뒤로 이동 -->
		<c:if test="${paging.next}">
			<a id="next" href="${paging.endPage + 1 }">▶</a>
		</c:if>
	</div>

	<form id="pagingFrm" name="pagingForm" action="eventlist.do"
		method="get">
		<input type="hidden" id="pageNum" name="pageNum"
			value="${paging.cri.pageNum }"> <input type="hidden"
			id="amount" name="amount" value="${paging.cri.amount }">
	</form>



	<c:choose>
		<c:when test="${empty couponlist }">
			<div>
				<span>----------작성된 글이 존재하지 않습니다---------</span>
			</div>

		</c:when>
		<c:otherwise>
			<div class="row">
				<c:forEach items="${couponlist }" var="dto">

					<c:choose>
						<c:when test="${dto.discount == 10000 }">

							<div class="col-sm-6 col-md-4">
								<div class="thumbnail" align="center">
									<img alt="10000원 쿠폰" class="coupon"
										src="resources/img/10000.png">
									<div class="caption">
										<h3>${dto.coupontitle}</h3>
										<p>사용기간 : ${dto.endday }</p>
										<p>
									
											<a
												href="downloadcoupon.do?makeseq=${dto.makeseq }&coupontitle=${dto.coupontitle}&endday=${dto.endday}&discount=${dto.discount}&userseq=${login.userseq}"
												class="btn btn-danger downControl" id="downControl" role="button">다운로드</a>
									
										
									</div>
								</div>
							</div>

						</c:when>
						<c:when test="${dto.discount == 5000 }">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail" align="center">
									<img alt="5000원 쿠폰" class="coupon" src="resources/img/5000.png">
									<div class="caption">
										<h3>${dto.coupontitle}</h3>
										<p>사용기간 : ${dto.endday }</p>
										<p>
											<a
												href="downloadcoupon.do?makeseq=${dto.makeseq }&coupontitle=${dto.coupontitle}&endday=${dto.endday}&discount=${dto.discount}&userseq=${login.userseq}"
												class="btn btn-danger downControl" id="downControl" role="button">다운로드</a>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail" align="center">
									<img alt="2000원 쿠폰" class="coupon" src="resources/img/2000.png">
									<div class="caption">
										<h3>${dto.coupontitle}</h3>
										<p>사용기간 : ${dto.endday }</p>
										<p>
											<a 
												href="downloadcoupon.do?makeseq=${dto.makeseq }&coupontitle=${dto.coupontitle}&endday=${dto.endday}&discount=${dto.discount}&userseq=${login.userseq}"
												class="btn btn-danger downControl" id="downControl" role="button">다운로드</a>
									</div>
								</div>
							</div>
						</c:otherwise>

					</c:choose>
				</c:forEach>
			</div>
		</c:otherwise>

	</c:choose>



</body>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						//페이지 번호 이동
						$('#pagingDiv a').click(function(e) {
							e.preventDefault();
							$('#pageNum').val($(this).attr("href"));
							pagingForm.submit();

						});

						//게시글에 pageNum넘기기
						$('table a')
								.click(
										function(e) {
											e.preventDefault();
											var html = "<input type='hidden' name='boardseq' value='"
													+ $(this).attr("href")
													+ "'>";
											$('#pagingFrm').append(html);
											$('#pagingFrm').attr("action",
													"eventone.do");
											$('#pagingFrm').submit();
										});
					});
</script>



</body>
<link href="./resources/css/paging.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="resources/css/coupon.css">
<link rel="stylesheet" type="text/css" href="resources/css/notice.css">
<script type="text/javascript" src="resources/js/notice.js"></script>

</html>