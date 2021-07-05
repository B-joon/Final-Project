<%@ page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDto login = (UserDto)session.getAttribute("login");
%> 
<!-- include libraries(bootstrap) -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

<!-- include summernote css/js -->

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
 
<script type="text/javascript" src="resources/js/gotop.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/gotop.css">

<script type="text/javascript" src="resources/js/weather.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/weather.css">

<nav class="navbar navbar-expand-lg bg-light navbar-light fixed-top">
	<a class="navbar-brand" href="#">Logo</a>
	 <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="main.do"><i class="fas fa-home"></i>&nbsp;&nbsp;메인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="noticelist.do"><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;공지</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="eventlist.do"><i class="fas fa-gift"></i>&nbsp;&nbsp;이벤트</a>	
    </li>
    <li class="nav-item">
      <a class="nav-link" href="streaming.do"><i class="fas fa-tv"></i>&nbsp;&nbsp;Live방송</a>	
    </li>
    <li class="nav-item">
      <a class="nav-link" href="chatbot.do"><i class="fas fa-robot"></i>&nbsp;&nbsp;챗봇대화</a>
    </li>

	<%
	
	if(login != null){
		
	%>
    <li class="nav-item">
      <a class="nav-link" href="logout.do"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;logout</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="mypage.do"><i class="fas fa-user"></i>&nbsp;&nbsp;mypage</a>
    </li>

	<% 
		if(login.getUserrole().equals("admin")){
	%>
	
	<li class="nav-item">
		<a class="nav-link" href="admin.do"><i class="fas fa-user-cog"></i>&nbsp;&nbsp;adminpage</a>
	</li>
	<%
		}
	}else{
	%>
	<li class="nav-item">
		<a class="nav-link" href="loginform.do"><i class="fas fa-sign-in-alt"></i>&nbsp;&nbsp;login</a>
	</li>
	<%
	}
	%>   
	<li class="nav-item">
		<a class="nav-link" href="pay.do"><i class="fas fa-money-check"></i>&nbsp;&nbsp;결제테스트</a>
	</li>


    
     <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        드롭다운 임시
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
    <li class="nav-item">
	  <form class="form-inline" action="/action_page.php">
	    <input class="form-control mr-sm-2" type="text" placeholder="검색창임시">
	    <button class="btn btn-success" type="submit">Search</button>
	  </form>
    </li>
  </ul>
	<div id="weatherarea">
        

    </div>
</nav>

	<%-- 상단으로 이동하기 버튼 시작 --%>
	<div class="top">
		<button id="btn" onClick="GoTop()">▲</button>
	</div>
	<%-- 상단으로 이동하기 버튼 끝 --%>

	<input type="hidden" id="sessionLogin" value="${login }">
	

	

	



