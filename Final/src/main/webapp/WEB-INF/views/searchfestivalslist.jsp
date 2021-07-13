<%@ page import="com.ptsd.mvc.festivals.FestivalsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Festivals List</title>

<script type="text/javascript">

window.onload = function() {
	
}

	function showList() {

		$.ajax({
			url : "search.do?keyword=",
			data: keyword,
			type: "post",
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				console.log("data")
				console.log(data)
				console.log(data.fesitvalslist)

				const list = data.festivalslist;

				$.each(list, function(index, festivals) {
					console.log(index + " : " + festivals.title);

					$(".imgs").prepend(
							"<div class='imgbox'>"
							+ "<a href='detailfestivals.do?title='"+ festivals.title + "'><img src='"+festivals.firstimage+"' class='img' alt='"+festivals.title+"사진'/></a>"
							+ "<div class='content'>"
							+ "<div class='title'>" 
							+ "<p>" + festivals.title + "</p>"
							+ "</div>" 
							+ "<div class='addr'>"
							+ "<p>" + festivals.addr1 + "</p>"
							+ "</div>"
							+ "<div class='tel'>" 
							+ "<p>" + festivals.tel + "</p>"
							+ "</div>" 
							+ "</div>" 
							+ "</div>"
							);
				});
			},

			error : function() {
				alert("통신에러");
			}
		});
	};
</script>

</head>

<body>
<%@include file="./common.jsp" %>	

	<div class="list">
		<div class="imgs">
			<c:choose>
				<c:when test="${empty list}">
					검색 결과가 없습니다. 
				</c:when>
				<c:otherwise>	
					<c:forEach items="${list}" var="list">
						<div class="imgbox">
								<a href="detailfestivals.do?title=${list.title}"><img src="${list.firstimage }" class="img" alt="${list.title } 사진"/></a>

								<div class="content">
								<div class="title">
									<p>${list.title }</p>
								</div>
								<div class="addr">
									<p>${list.addr1}</p>
								</div>
								<div class="tel">
									<p>${festivalsDto.tel}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
<link rel="stylesheet" type="text/css" href="resources/css/festivals.css">
</html>