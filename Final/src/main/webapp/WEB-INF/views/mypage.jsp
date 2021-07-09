<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 마이페이지</title>
</head>
<body>
<%@include file="./common.jsp" %>
<h1>MYPAGE</h1>



<p>${login.getName() }님의 마이페이지 입니다.</p>

	<table align="center">
<%
	String userid = login.getUserid();
	String temp = userid.substring(userid.length()-2, userid.length());
	if(temp.equals("@n") || temp.equals("@k") || temp.equals("@g")){
%>		

<%
	} else {
%>	
		<tr>
			<th>아이디</th>
			<td>${dto.userid }</td>
		</tr>
<%
	}
%>
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
			
			<td colspan="2" align="center">
				<input type="button" value="내 정보 수정" onclick="location.href='mypageupdate.do?userseq=${dto.userseq }'">
				<input type="button" value="내 쿠폰함" onclick="location.href='mycoupon.do'">
				<input type="button" value="회원 탈퇴" id="delete1" onclick="userDelete();">
				<input type="button" value="회원 탈퇴" id="delete2" onclick="location.href='userdelete.do?userseq=${dto.userseq }'">
			</td>
		</tr>
	</table>

</body>
<script type="text/javascript">
$(function() {
	$("#delete2").hide();
});

function userDelete(){
	alert("회원 탈퇴하시면 복구가 불가능 합니다. 탈퇴하시려면 다시 회원 탈퇴 버튼을 클릭해주세요");
	$("#delete1").hide();
	$("#delete2").show();
}

</script>
</html>