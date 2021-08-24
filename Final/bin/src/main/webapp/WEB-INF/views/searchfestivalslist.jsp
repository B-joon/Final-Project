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
<link href="resources/img/favicon.png" rel="shortcut icon">

<script type="text/javascript">
	window.onload = function() {

	}

	function showList() {

		$.ajax({
					url : "search.do?keyword=",
					data : keyword,
					type : "post",
					dataType : "json",
					contentType : "application/json",
					success : function(data) {
						console.log("data")
						console.log(data)
						console.log(data.fesitvalslist)

						const list = data.festivalslist;

						$.each(list,function(index, festivals) {
											console.log(index + " : "
													+ festivals.title);

											$(".card border-warning")
													.prepend(
															"<h5 class='card-header bg-warning mb-3>'"
																	+ festivals.title
																	+ "</h5>"
																	+ "<img class='card-img-top' alt='Card image cap' src=" + festivals.firstimage + "style='height: 10em;'>"
																	+ "<div class='card-body'>"
																	+ "<div>"
																	+ festivals.addr1
																	+ "</div>"
																	+ "<div>"
																	+ festivals.tel
																	+ "</div>"
																	+ "<button onclick='getAddress("
																	+ festivals.addr1+'","'+festivals.title
																	+ ");' type='button' class='btn btn-warning' data-toggle='modal' data-target='#addrModal'>지도보기</button></div>");

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
	<%@include file="./common.jsp"%>
		<form action="search.do" class="form-inline my-2 my-lg-0">
				<div class="m-3">
					<input class="form-control mr-sm-2" type="search" name="keyword"
						placeholder="지역명, 제목명" aria-label="Search" id="speech_result">
						<span class="ml-1">
		    			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    			<span id="speecharea">
							<button type="button" class="btn btn-primary btn-sm" onclick="startSpeechRecognition();"><i class="fas fa-microphone"></i></button>
						</span>
		    			</span>
						
		    	</div>
		</form>
	<div class="list row">
		<c:choose>
			<c:when test="${empty list}">
					검색 결과가 없습니다. 
				</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="list">
					<div class="col-sm-3 mb-3">
						<div class="card border-warning">
							<h5 class="card-header bg-warning mb-3">${list.title}</h5>
							<img class="card-img-top" alt="Card image cap"
								src="${list.firstimage }" style="height: 10em;">

							<div class="card-body">
								<div>${list.addr1}</div>
								<div>${list.tel}</div>
								<button onclick="getAddress('${list.addr1}','${list.title }');" type="button"
									class="btn btn-warning" data-toggle="modal"
									data-target="#addrModal">지도보기</button>
							</div>

						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="modal fade" id="addrModal" tabindex="-1" role="dialog"
		aria-labelledby="addrModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addrModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col" id="map"
								style="width: 400px; height: 400px; display: none;"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


</body>
<link rel="stylesheet" type="text/css"
	href="resources/css/festivals.css">
	<script type="text/javascript" src="resources/js/map.js"></script>
</html>