<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.ptsd.mvc.user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="./common.jsp" %>
<h1>MYPAGE</h1>



<p>${login.getUserid() }</p>

<a href="mycoupon.do">내 쿠폰함</a>

</body>
</html>