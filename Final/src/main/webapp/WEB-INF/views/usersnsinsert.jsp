<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / SNS로그인</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>

<%@include file="./common.jsp" %>
	<div class="border border-danger rounded">
	<form action="usersnsInsertres.do" method="post">
		<input type="hidden" name="userid" value="${res.userid }">
		<input type="hidden" name="userpw" value="1234">
		<table id="table" class="table table-borderless text-center">
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control" name="name" id="username"
					placeholder="이름을 적어주세요" onkeyup="nameChk();" value="${res.name }">
					<input type="hidden" id="Chk1" value="false"></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" class="form-control" name="email" id="email"
					value="${res.email }"> <input type="button"
					id="emailChkBtn" class="btn btn-secondary" value="이메일 중복 확인"> <input type="hidden"
					id="Chk2" value="false"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="emailChk"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input class="form-control" type="text" name="address"
					id="address" class="form-control" readonly="readonly"
					placeholder="주소를 입력하려면 여기를 클릭하세요" onclick="goPopup();"> <input
					type="hidden" id="Chk3" value="false"></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" class="form-control"  name="phone" id="phone"
					placeholder="숫자만 입력하세요" style="ime-mode: disabled"> <input
					type="hidden" id="Chk4" value="false"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="phoneChk"></td>
			</tr>
			<tr>
				<td id="submitBtn" colspan="2" align="center"><input
					type="button" class="btn btn-danger" value="회원가입" disabled="disabled"></td>
			</tr>
			<tr>
				<td id="submitRes" colspan="2" align="center"><input
					type="submit" class="btn btn-danger" value="회원가입"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" class="btn btn-dark" value="취소"
					onclick="location.href='loginform.do'" /></td>
			</tr>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">

$(function() {
	$("#submitRes").hide();
	var username = $("#username").val().trim();
	console.log(username);
	if(username != null){
		$("#Chk1").val('true');
	}
});

</script>

<script type="text/javascript">

$("#username").keyup(function(){
	var username = $("#username").val().trim();
	
	if(name != null){
		$("#Chk1").val('true');
		submitChk();
	} else{
		$("#Chk1").val('false');
		submitChk();
	}

});

$("#emailChkBtn").click(function(){
	var email = $("#email").val();
	console.log(email)
	if (email == null || email == "@null") {
		$("#emailChk").show();
		$("#emailChk").html('email을 입력해 주세요.');
		$("#emailChk").css("color", "red");
	} else {
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
					$("#Chk2").val('true');
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
	$("#Chk3").val('true');
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
		$("#Chk4").val('false');
		submitChk();
	} else if (fphone != "010"){
		$("#phoneChk").show();
		$("#phoneChk").html('010으로 시작하는 번호를 입력해 주세요.');
		$("#phoneChk").css("color", "red");
		$("#Chk4").val('false');
		submitChk();
	} else if(phone.length < 11 || phone.length > 11 ) {
		$("#phoneChk").show();
		$("#phoneChk").html('핸드폰 번호 11자리까지 입력해 주세요.');
		$("#phoneChk").css("color", "red");
		$("#Chk4").val('false');
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
					$("#Chk4").val('true');
					submitChk();
					console.log(phone)
					setTimeout(function() {
						$("#phoneChk").hide();
						}, 2000);
				} else if(check == "true") {
					$("#phoneChk").html('이미 존재하는 번호입니다.');
					$("#phoneChk").css("color", "red");
					$("#Chk4").val('false');
					submitChk();
					
				} else {
					$("#phoneChk").html('번호를 적어주세요');
					$("#phoneChk").css("color", "red");
					$("#Chk4").val('false');
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
	
	if($("#Chk1").val() == 'true' 
			&& $("#Chk2").val() == 'true' 
			&& $("#Chk3").val() == 'true' 
			&& $("#Chk4").val() == 'true' ){
		$("#submitBtn").hide();
		$("#submitRes").show();
	} else{
		$("#submitBtn").show();
		$("#submitRes").hide();
	}
}


</script>
</html>