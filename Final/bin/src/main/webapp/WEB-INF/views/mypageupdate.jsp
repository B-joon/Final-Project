<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<%@include file="./common.jsp" %>
	<h1>MYPAGE</h1>

	<p>${login.getName() }님의 정보 수정 페이지 입니다.</p>

	<form action="mypageupdateres" method="post">
		<input type="hidden" name="userseq" value="${login.getUserseq()} }">
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
			<td><input type="text" id="userid" value="${dto.userid }" readonly="readonly"></td>
		</tr>
		<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="userpw" id="pw1" placeholder="비밀번호를 적어주세요" onkeyup="checkPwd1();">
					<input type="hidden" id="Chk1" value="false">	
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="checkPwd1"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id="pw2" placeholder="비밀번호를 확인해주세요" onkeyup="checkPwd2();">
					<input type="hidden" id="Chk2" value="false">
				</td>
			</tr>
<%
	}
%>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="username"
					placeholder="이름을 적어주세요" onkeyup="nameChk();" value="${dto.name }">
					<input type="hidden" id="Chk3" value="false">
					
				</td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="email" id="email"
					value="${dto.email }"> <input type="button"
					id="emailChkBtn" value="이메일 중복 확인"> <input type="hidden"
					id="Chk4" value="false"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="emailChk"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input style="width: 300px;" type="text" name="address" value="${dto.address }"
					id="address" class="form-control" readonly="readonly"
					placeholder="주소를 입력하려면 여기를 클릭하세요" onclick="goPopup();"> <input
					type="hidden" id="Chk5" value="false"></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" name="phone" id="phone" value="${dto.phone }"
					placeholder="숫자만 입력하세요" style="ime-mode: disabled"> <input
					type="hidden" id="Chk6" value="false"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="phoneChk"></td>
			</tr>
			<tr>
				<td id="submitBtn" colspan="2" align="center"><input
					type="button" value="내 정보 수정" disabled="disabled"></td>
			</tr>
			<tr>
				<td id="submitRes" colspan="2" align="center">
					<input type="submit" value="내 정보 수정">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="취소" onclick="location.href='mypage.do?userseq=${dto.userseq }'">
				</td>
			</tr>
		</table>
	</form>

</body>
<script type="text/javascript">

$(function() {
	$("#submitRes").hide();
});

$("#username").keyup(function(){
	var username = $("#username").val().trim();
	
	if(name != null){
		$("#Chk3").val('true');
		submitChk();
	} else{
		$("#Chk3").val('false');
		submitChk();
	}

});

function checkPwd1(){
	var f1 = document.forms[0];
	var pw = f1.pw1.value;
	
	if (pw.length < 4 || pw.length > 15){
		$("#checkPwd1").show();
		document.getElementById('checkPwd1').style.color = "red";
		document.getElementById('checkPwd1').innerHTML = "비밀번호를 4~ 15자로 작성하세요.";
		$("#Chk1").val('false');
		submitChk();
	} else if(pw.length == 0 || pw == null){
		$("#checkPwd1").hide();
		$("#Chk1").val('false');
		submitChk();
	} else {
		$("#checkPwd1").hide();
		$("#Chk1").val('true');
		submitChk();
		console.log(pw)
	}
	
}
function checkPwd2() {
	var f1 = document.forms[0];
	var pw1 = f1.pw1.value;
	var pw2 = f1.pw2.value;
	
	if (pw1 != pw2) {
		$("#checkPwd2").show();
		document.getElementById('checkPwd2').style.color = "red";
		document.getElementById('checkPwd2').innerHTML = "암호가 불일치합니다";
		$("#Chk2").val('false');
		submitChk();
	} else {
		$("#checkPwd2").show();
		document.getElementById('checkPwd2').style.color = "blue";
		document.getElementById('checkPwd2').innerHTML = "암호가 일치합니다.";
		$("#Chk2").val('true');
		submitChk();
		console.log(pw2)
		setTimeout(function() {
			$("#checkPwd2").hide();
			}, 2000);
	}

}

</script>

<script type="text/javascript">

$("#emailChkBtn").click(function(){
	var email = $("#email").val();
	console.log(email)
	if (email == null || email == "@null") {
		$("#emailChk").show();
		$("#emailChk").html('email을 입력해 주세요.');
		$("#emailChk").css("color", "red");
	} else if(){
		
	}else {
		$.ajax({
			type : "post",
			url : "ajaxemailChk.do?email=",
			data : email,
			contentType : "application/text",
			dataType : "text",
			success : function(check) {
				console.log(check)
				$("#emailChk").show();
				if (check == "false") {
					$("#emailChk").html('사용 가능한 email입니다.');
					$("#emailChk").css("color", "blue");
					$("#email").attr('readonly', true);
					$("#emailChkBtn").attr('type', 'hidden');
					$("#Chk4").val('true');
					submitChk();
					setTimeout(function() {
						$("#emailChk").hide();
						}, 2000);
				} else {
					$("#emailChk").html('이미 존재하는 email입니다.');
					$("#emailChk").css("color", "red");
				}
			},
			error : function() {
				alert("email 통신 실패");
			}
		});
	}

});

function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	// scrollbars=yes 스크롤 바 가능 resizable=yes 팝업창 크기 조절 가능 
	var pop = window.open("popup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
// 값 불러와서 id가 address...등에 각 값에 넣고 나머지 주소가 30글자보다 크면 너무길다고 리턴
function jusoCallBack(roadFullAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
	document.getElementById("address").value = roadFullAddr;
	$("#Chk5").val('true');
}

$("#phone").keyup(function(){
	var phone = $("#phone").val();
	var fphone = phone.substring(0,3);
	console.log(phone)
	console.log(fphone)
	if (phone == null || phone == "") {
		$("#phoneChk").show();
		$("#phoneChk").html('핸드폰 번호를 입력해 주세요.');
		$("#phoneChk").css("color", "red");
		$("#Chk6").val('false');
		submitChk();
	} else if (fphone != "010"){
		$("#phoneChk").show();
		$("#phoneChk").html('010으로 시작하는 번호를 입력해 주세요.');
		$("#phoneChk").css("color", "red");
		$("#Chk6").val('false');
		submitChk();
	} else if(phone.length < 11 || phone.length > 11 ) {
		$("#phoneChk").show();
		$("#phoneChk").html('핸드폰 번호 11자리까지 입력해 주세요.');
		$("#phoneChk").css("color", "red");
		$("#Chk6").val('false');
		submitChk();
	} else{
		$.ajax({
			type : "post",
			url : "ajaxphoneChk.do?phone=",
			data : phone,
			contentType : "application/text",
			dataType : "text",
			success : function(check) {
				$("#phoneChk").show();
				console.log(check)
				if (check == "false") {
					$("#phoneChk").html('사용 가능한 번호입니다.');
					$("#phoneChk").css("color", "blue");
					$("#Chk6").val('true');
					submitChk();
					console.log(phone)
					setTimeout(function() {
						$("#phoneChk").hide();
						}, 2000);
				} else if(check == "true") {
					$("#phoneChk").html('이미 존재하는 번호입니다.');
					$("#phoneChk").css("color", "red");
					$("#Chk6").val('false');
					submitChk();
					
				} else {
					$("#phoneChk").html('번호를 적어주세요');
					$("#phoneChk").css("color", "red");
					$("#Chk6").val('false');
					submitChk();
				}
			},
			error : function() {
				alert("phone 통신 실패");
			}
		});
	}

});

function submitChk() {
	var userid = $("#userid").val();
	var temp = userid.substring(userid.length()-2, userid.length());
	
	if(temp.equals("@n") || temp.equals("@k") || temp.equals("@g")){
		if($("#Chk3").val() == 'true' 
				&& $("#Chk4").val() == 'true'
				&& $("#Chk5").val() == 'true'
				&& $("#Chk6").val() == 'true'){
			$("#submitBtn").hide();
			$("#submitRes").show();
		} else{
			$("#submitBtn").show();
			$("#submitRes").hide();
		}
	}else{
		if($("#Chk1").val() == 'true' 
			&& $("#Chk2").val() == 'true'
			&& $("#Chk3").val() == 'true'
			&& $("#Chk4").val() == 'true'
			&& $("#Chk5").val() == 'true'
			&& $("#Chk6").val() == 'true'){
			$("#submitBtn").hide();
			$("#submitRes").show();
		} else{
			$("#submitBtn").show();
			$("#submitRes").hide();
		}
	}
}

</script>

</html>