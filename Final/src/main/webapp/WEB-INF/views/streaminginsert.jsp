<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 방송 생성</title>
</head>
<body>
<%@include file="./common.jsp" %>
	<form action="streamingres.do" method="get">
		<div class="border border-danger rounded p-3">
			<h5 class="font-weight-bold mb-3"> 방송 생성하기 </h5>
			<div class="form-group col-md-12">
		      <label for="inputStreamingname">채널명</label>
		      <input name="streamingname" type="text" class="form-control" id="inputStreamingname" placeholder="ex) 월드뮤직페스티벌 2021 LIVE">
		    </div>	
		 <button type="submit" class="btn btn-danger">방송생성</button>
		<button type="button" class="btn btn-dark"onclick="location.href='streaming.do'">취소</button>
		</div>
	</form>


</body>
</html>