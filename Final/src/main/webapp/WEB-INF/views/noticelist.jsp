<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="./resources/css/paging.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resources/js/notice.js"></script>
</head>
<body>


	<input type="hidden" value="${login.userseq }" id="loginseq">
	<input type="hidden" value="${login.userrole }" id="loginrole">

	<table border="1">
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
					<c:if test="${dto.boardkind == 'NOTICE'}">
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
			<td colspan="4" align="right">
			<input type="button" value="글작성" class ="insertControl"
				onclick="location.href='insertform.do'"></td>
		</tr>

	</table>
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

	<form id="pagingFrm" name="pagingForm" action="noticelist.do"
		method="get">
		<input type="hidden" id="pageNum" name="pageNum"
			value="${paging.cri.pageNum }"> <input type="hidden"
			id="amount" name="amount" value="${paging.cri.amount }">
	</form>
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
													"noticeone.do");
											$('#pagingFrm').submit();
										});
					});

</script>

</body>
</html>