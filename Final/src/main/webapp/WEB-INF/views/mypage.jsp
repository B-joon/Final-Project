<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 마이페이지</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
	<%@include file="./common.jsp"%>
	<h3 class="display-4">MYPAGE</h3>
	<p>${login.getName() }님의 마이페이지입니다.</p>

	<div class="container border border-danger rounded">
	<table class="table">
		<tr id="idframe">
			<th scope="col">아이디</th>
			<td>${dto.userid }<input type="hidden" id="userid"
				value="${dto.userid }">
			</td>
		</tr>

		<tr>
			<th scope="col">이름</th>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<th scope="col">이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<th scope="col">주소</th>
			<td>${dto.address }</td>
		</tr>
		<tr>
			<th scope="col">전화번호</th>
			<td>${dto.phone }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" class="btn btn-danger"	value="내 정보 수정" onclick="location.href='mypageupdate.do?userseq=${dto.userseq }'">
			<input type="button" value="내 쿠폰함" class="btn btn-success"	onclick="location.href='mycoupon.do'"> 
      <input type="button" value="찜한 공연" class="btn btn-primary" onclick="location.href='wishList.do'">
			<input type="button"value="회원 탈퇴" id="delete1" class="btn btn-light" onclick="userDelete();"> 
			<input type="button" value="회원 탈퇴" id="delete2" class="btn btn-dark" onclick="location.href='userdelete.do?userseq=${dto.userseq }'">
			</td>
		</tr>
	</table>
	</div>




	<table class="table table-bordered">
	
	
				<tr>
				
					<th class="divTableHead">주문번호</th>
					<th class="divTableHead">상품명</th>
					<th class="divTableHead">관람일자</th>
					<th class="divTableHead">인원</th>
					<th class="divTableHead">가격</th>
					
				
				</tr>
	
	
	<c:choose>
		<c:when test="${empty reservationlist }">
			
				예매내역이 존재하지 않습니다. 
			
			</c:when>
		<c:otherwise>

				
			
			<c:forEach items="${reservationlist }" var="reservationdto">
				
					

						
							<tr class="divTableRow">
								<td id="${reservationdto.reservationseq}">${reservationdto.reservationseq}</td>
								<td>${reservationdto.productname}</td>
								<td>${reservationdto.playdate}</td>
								<td>${reservationdto.people}</td>
								<td>${reservationdto.price}</td>
								<td align="right"><input type="button" class="btn btn-danger" value="환불신청" onclick="refund(${reservationdto.reservationseq})"></td>
							</tr>
						
						
					
				
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>

</body>
<script type="text/javascript">
	$(function() {
		$("#delete2").hide();
		var userid = $("#userid").val().trim();
		var temp = userid.substring(userid.length - 2, userid.length);
		if (temp == "@n" || temp == "@k" || temp== "@g") {
			$("#idframe").hide();
		}

	});

	function userDelete() {
		alert("회원 탈퇴하시면 복구가 불가능 합니다. 탈퇴하시려면 다시 회원 탈퇴 버튼을 클릭해주세요");
		$("#delete1").hide();
		$("#delete2").show();
	}
	
	function refund(reservationseq){
		
		var reseq = $("#"+reservationseq).text();
		console.log(reseq);
		var userseq = ${login.userseq};
		if(reservationseq == reseq) {
				alert('결제 취소를 요청하시겠습니까? ');
				alert('환불요청이 완료되었습니다. 실제 환불은 시간이 소요 될 수 있습니다.');
				location.href="refund.do?reservationseq="+reseq+"&userseq="+userseq;
				}
		
	}

	
</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/reservation.css">

</html>