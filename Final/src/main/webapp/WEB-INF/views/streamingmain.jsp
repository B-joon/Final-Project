<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 방송</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
<%@include file="./common.jsp" %>
	
	<div class="row">
		<c:choose>
            <c:when test="${empty list }">
            	<h2>현제 방송중인 공연 및 축제가 없습니다.</h2>
            </c:when>
            <c:otherwise>
                <c:forEach items="${list }" var="dto">
                	<c:choose>
                	<c:when test="${login.userrole eq 'admin' }">
						<div class="col-sm-3 mb-3">
							<div class="card border-danger">
								<div class="card-body">
									<h5 class="card-title">${dto.streamingname }</h5>
									<a href="https://b-joon.github.io/Final-Project/livestreaming/livestreaming.html?streamingseq=${dto.streamingseq }&streamingname=${dto.streamingname }&userid=${login.userid }&name=${login.name }" class="btn btn-danger">방송하기</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="streamingdel.do?streamingseq=${dto.streamingseq }" class="btn btn-info">방송삭제</a>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${login.userrole eq 'user' }">
						<div class="col-sm-3 mb-3">
							<div class="card border-danger">
								<div class="card-body">
									<h5 class="card-title text-center">${dto.streamingname }</h5>
									<a href="https://b-joon.github.io/Final-Project/livestreaming/livewatch.html?streamingseq=${dto.streamingseq }&streamingname=${dto.streamingname }&userid=${login.userid }&name=${login.name }" class="btn btn-danger">시청하기</a>
								</div>
							</div>
						</div>	
					</c:when>
					<c:otherwise>
						<div class="col-sm-3 mb-3">
							<div class="card border-danger">
								<div class="card-body">
									<h5 class="card-title">${dto.streamingname }</h5>
									<p class="card-text">방송에 접속할 수 없습니다. 로그인을 해주세요.</p>
									<button class="btn btn-danger" disabled>시청불가</button>
								</div>
							</div>
						</div>
					</c:otherwise>
					</c:choose>
                </c:forEach>
            </c:otherwise>
        </c:choose>
	</div>
	<c:choose>
		<c:when test="${login.userrole eq 'admin' }">
			<input class="btn btn-danger" type="button" value="방송 생성" onclick="location.href='streaminginsert.do'">
		</c:when>
	</c:choose>

</body>
</html>