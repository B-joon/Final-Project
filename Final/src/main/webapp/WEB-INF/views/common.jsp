<%@ page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserDto login = (UserDto) session.getAttribute("login");
%>
<!-- include libraries(bootstrap) -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- common.js  -->
<script type="text/javascript" src="resources/js/common.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment-with-locales.min.js"
	integrity="sha512-EATaemfsDRVs6gs1pHbvhc6+rKFGv8+w4Wnxk4LmkC0fzdVoyWb+Xtexfrszd1YuUMBEhucNuorkf8LpFBhj6w=="
	crossorigin="anonymous"></script>
<!-- include summernote css/js -->

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<!-- 최상단으로 가기 -->
<script type="text/javascript" src="resources/js/gotop.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/gotop.css">

<!-- datepicker -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

<!-- 날씨 -->
<script type="text/javascript" src="resources/js/weather.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/weather.css">

<!-- 다크모드 -->
<script type="text/javascript" src="resources/js/darkmode.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/darkmode.css">

<!-- 차트 -->
<script type="text/javascript" src="https://d3js.org/d3.v7.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/chart.css">

<!-- 결제 -->
<!--iamport-->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 검색바 -->
<link rel="stylesheet" type="text/css" href="resources/css/searchbar.css">

<!-- 지도정보 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfb6f83c1347ebbcf6cbda00be7c7b6f&libraries=services,clusterer,drawing"></script>
<div class="container-lg">

	<nav
		class="navbar navbar-expand-lg navbar-dark bg-danger justify-content-between sticky-top font-weight-bold">
		<a class="navbar-brand" href="main.do"> <img
			src="resources/img/logo.png" width="100"
			class="d-inline-block align-top"></img>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="noticelist.do"><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;공지</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="eventlist.do"><i
						class="fas fa-gift"></i>&nbsp;&nbsp;이벤트</a></li>
				<li class="nav-item"><a class="nav-link" href="streaming.do"><i
						class="fas fa-tv"></i>&nbsp;&nbsp;Live방송</a></li>
				<li class="nav-item"><a class="nav-link" href="chatbot.do"><i
						class="fas fa-robot"></i>&nbsp;&nbsp;챗봇대화</a></li>
			</ul>
			<ul class="navbar-nav">
				<%
					if (login != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="logout.do"><i
						class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;logout</a></li>

				<li class="nav-item"><a class="nav-link"
					href="mypage.do?userseq=${login.getUserseq()}"><i
						class="fas fa-user"></i>&nbsp;&nbsp;mypage</a></li>

				<%
					if (login.getUserrole().equals("admin")) {
				%>

				<li class="nav-item"><a class="nav-link" href="admin.do"><i
						class="fas fa-user-cog"></i>&nbsp;&nbsp;adminpage</a></li>
				<%
					}
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="loginform.do"><i
						class="fas fa-sign-in-alt"></i>&nbsp;&nbsp;login</a></li>
				<%
					}
				%>
			</ul>

		</div>
	</nav>
	<div class="container mt-3 mb-3">
		<div id="weatherarea" class=""></div>
	</div>
	<form action="search.do" class="searchform">
		<fieldset>
			<input type="text" class="searchtext" name="keyword"
				placeholder="지역명, 제목명" />
			<button type="submit" class="submitbtn">
				<i class="fa fa-search"></i>
			</button>
		</fieldset>
	</form>


	<%-- 상단으로 이동하기 버튼 시작 --%>
	<div class="top">
		<button type="button" id="btn" onClick="GoTop()"
			class="btn btn-outline-secondary">
			<i class="fas fa-arrow-alt-circle-up"></i>
		</button>

	</div>
	<%-- 상단으로 이동하기 버튼 끝 --%>

	<div>
		<button type="button" id="darkbtn" onclick="dayAndNight(this);"
			class="btn btn-outline-secondary">다크모드</button>

	</div>

	<input type="hidden" id="sessionLogin" value="${login }">