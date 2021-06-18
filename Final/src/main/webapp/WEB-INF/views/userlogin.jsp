<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		$("#loginChk").hide();
	});
	
	function login(){
		var userid = $("#userid").val().trim();
		var userpw = $("#userpw").val().trim();
		var loginVal = {
				"userid" : userid,
				"userpw" : userpw
		}
		
		if(userid == null || userid == "" || userpw == null || userpw == ""){
			alert("ID 및 PW를 다시 확인해 주세요!!");
		} else{
			$.ajax({
				type:"post",
				url:"ajaxlogin.do",
				data:JSON.stringify(loginVal),
				contentType:"application/json",
				dataType:"json",
				success:function(msg){
					if (msg.check == true){
						location.href="main.do";
					} else{
						$("#loginChk").show();
						$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
					}
				},
				error:function(){
					alert("통신 실패");
				}
			});
		}
		
	}
	
</script>

</head>
<body>
	
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="userid" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" id="userpw"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="로그인" onclick="login();"></td>
			<td><input type="button" value="회원가입" onclick="location.href='userInsert.do'"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="loginChk"></td>
		</tr>
		
	</table>
	
</body>
</html>