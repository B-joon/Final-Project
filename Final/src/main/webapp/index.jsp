<%@page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>

<body>
<%@include file="WEB-INF/views/common.jsp" %>	
	<!-- 축제 정보를 ajax로 받기 + 직접 상품 등록으로 등록한 공연도 보이게끔 해야함 + 위치기반 조회도??? -->
	<div class="container-lg">
	<div id="weatherarea"></div>
	<div class="row">
		<div class="col-sm-2">
		<div class="btn-group dropright mr-3">
	  	<button type="button" class="btn btn-outline-warning btn-lg dropdown-toggle" data-toggle="dropdown">축제정보</button>
	  	<div class="dropdown-menu">
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(0);">전체</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(1);">서울</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(31);">경기</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(2);">인천</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(34);">충남</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(33);">충북</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(3);">대전</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(8);">세종</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(32);">강원</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(38);">전남</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(37);">전북</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(5);">광주</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(7);">울산</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(4);">대구</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(36);">경남</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(35);">경북</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(6);">부산</a>
	  		<a class="dropdown-item" href="#" onclick="chkPartyAreaCode(39);">제주</a>
	    </div>
	    </div>
	    </div>
	    <div class="col-sm-2">
	  	<div class="btn-group dropright">
	    <button type="button" class="btn btn-outline-danger btn-lg dropdown-toggle" data-toggle="dropdown">공연정보</button>
	    <div class="dropdown-menu">
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(0);">전체</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(1);">서울</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(31);">경기</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(2);">인천</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(34);">충남</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(33);">충북</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(3);">대전</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(8);">세종</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(32);">강원</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(38);">전남</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(37);">전북</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(5);">광주</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(7);">울산</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(4);">대구</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(36);">경남</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(35);">경북</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(6);">부산</a>
	  		<a class="dropdown-item" href="#" onclick="chkProductAreaCode(39);">제주</a>
	    </div>
	  	</div>
	  	</div>
  </div>

	
	<hr/>
		<div id="partylist" class="row">
	</div>
	
<div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="addrModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addrModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <div class="container-fluid">
	      	<div class="row">
	      		<div class="col" id="map" style="width: 400px; height: 400px; display:none;"></div>
	      	</div>
	      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</div>
</body>
<script type="text/javascript" src="resources/js/party.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
<script type="text/javascript" src="resources/js/map.js"></script>

</html>
