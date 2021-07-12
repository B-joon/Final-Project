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
</head>
<body>
	<%@include file="./common.jsp"%>
	<h1>MYPAGE</h1>



	<p>${login.getName() }님의마이페이지입니다.</p>

	<table align="center">


		<tr id="idframe">
			<th>아이디</th>
			<td>${dto.userid }<input type="hidden" id="userid"
				value="${dto.userid }">
			</td>
		</tr>

		<tr>
			<th>이름</th>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dto.address }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dto.phone }</td>
		</tr>
		<tr>

			<td colspan="2" align="center"><input type="button"
				value="내 정보 수정"
				onclick="location.href='mypageupdate.do?userseq=${dto.userseq }'">
				<input type="button" value="내 쿠폰함"
				onclick="location.href='mycoupon.do'"> <input type="button"
				value="회원 탈퇴" id="delete1" onclick="userDelete();"> <input
				type="button" value="회원 탈퇴" id="delete2"
				onclick="location.href='userdelete.do?userseq=${dto.userseq }'">
			</td>
		</tr>
	</table>





	
	<c:choose>
		<c:when test="${empty reservationlist }">
			
				예매내역이 존재하지 않습니다. 
			
			</c:when>
		<c:otherwise>

			<div class="divTableHeading">
				<div class="divTableRow">
					<div class="divTableHead">주문번호</div>
					<div class="divTableHead">상품명</div>
					<div class="divTableHead">관람일자</div>
					<div class="divTableHead">인원</div>
					<div class="divTableHead">가격</div>
					<div class="divTableHead">결제일자</div>
				</div>
			</div>
			
			<c:forEach items="${reservationlist }" var="reservationdto">
				
					<div class="container" id="divtable">

						<div class="divTableBody">
							<div class="divTableRow">
								<div class="divTableCell" id="${reservationdto.reservationseq}">${reservationdto.reservationseq}</div>
								<div class="divTableCell">${reservationdto.productname}</div>
								<div class="divTableCell">${reservationdto.playdate}</div>
								<div class="divTableCell">${reservationdto.people}</div>
								<div class="divTableCell">${reservationdto.price}</div>
								<div class="divTableCell">${reservationdto.paydate}</div>
								<p align="right"><input type="button" value="환불신청" onclick="refund(${reservationdto.reservationseq})"></p>
							</div>
						</div>
						
					</div>
				
			</c:forEach>
		</c:otherwise>
	</c:choose>
	

</body>
<script type="text/javascript">
	$(function() {
		$("#delete2").hide();
		var userid = $("#userid").val().trim();
		var temp = userid.substring(userid.length() - 2, userid.length());
		if (temp.equals("@n") || temp.equals("@k") || temp.equals("@g")) {
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
				location.href="refund.do?reservationseq="+reseq+"&userseq="+userseq;
				}
		
	}

	
</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/reservation.css">

</html>