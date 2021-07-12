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
	<h3 class="display-4">MYPAGEUPDATE</h3>
	<p>${dto.name }님의 정보 수정 페이지 입니다.</p>
	<div class="container border border-danger rounded">
	<form action="mypageupdateres.do" method="post">
		<input type="hidden" name="userseq" value="${dto.userseq} ">
		<table class="table table-borderless m-3">
		<tr id="idfram">
			<th scope="row">아이디</th>
			<td><input type="text" id="userid" class="form-control" value="${dto.userid }" readonly="readonly">
				<input type="hidden" id="hiddenuserid" value="${dto.userid }">
			</td>
		</tr>
		<tr id="pwfram">
			<th>비밀번호</th>
			<td>
				<input type="password" name="userpw" class="form-control" id="pw1" placeholder="비밀번호를 적어주세요" onkeyup="checkPwd1();">
				<input type="hidden" id="Chk1" value="false">	
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="checkPwd1"></td>
		</tr>
		<tr id="pw2fram">
			<th>비밀번호 확인</th>
			<td>
				<input type="password" class="form-control" id="pw2" placeholder="비밀번호를 확인해주세요" onkeyup="checkPwd2();">
				<input type="hidden" id="Chk2" value="false">	
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="checkPwd2"></td>
		</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control" name="name" id="username"
					placeholder="이름을 적어주세요" onkeyup="nameChk();" value="${dto.name }">
					<input type="hidden" id="Chk3" value="true">
					<input type="hidden" id="hiddenname" value="${dto.name }">
				</td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" class="form-control" name="email" id="email"
					value="${dto.email }"> <input type="button" class="btn btn-secondary"
					id="emailChkBtn" value="이메일 중복 확인"> 
					<input type="hidden" id="hiddenemail" value="${dto.email }">
					<input type="hidden"
					id="Chk4" value="true"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="emailChk"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input class="form-control" type="text" name="address" value="${dto.address }"
					id="address" class="form-control" readonly="readonly"
					placeholder="주소를 입력하려면 여기를 클릭하세요" onclick="goPopup();"> <input
					type="hidden" id="Chk5" value="true">
					<input type="hidden" id="hiddenaddress" value="${dto.address }">	
				</td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" class="form-control" name="phone" id="phone" value="${dto.phone }"
					placeholder="숫자만 입력하세요" style="ime-mode: disabled"> <input
					type="hidden" id="Chk6" value="true">
					<input type="hidden" id="hiddenphone" value="${dto.phone }">	
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="phoneChk"></td>
			</tr>
			<tr>
				<td id="submitBtn" colspan="2" align="center"><input
					type="button" value="내 정보 수정" class="btn btn-danger" disabled="disabled"></td>
			</tr>
			<tr>
				<td id="submitRes" colspan="2" align="center">
					<input type="submit" class="btn btn-danger" value="내 정보 수정">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="취소" class="btn btn-dark" onclick="location.href='mypage.do?userseq=${dto.userseq }'">
				</td>
			</tr>
		</table>
	</form>
	</div>

</body>
<script type="text/javascript">
// 시작 시 작동 SNS로그인이면 ID PW 수정 안보이게
$(function() {
	$("#submitRes").hide();
	var userid = $("#userid").val().trim();
	var temp = userid.substring(userid.length-2, userid.length);
	if(temp=="@n" || temp=="@k" || temp=="@g"){
		$("#idframe").hide();
		$("#pwframe").hide();
		$("#pw2frame").hide();
	}
	
});

// 이름부분이 채워지면 true로 바꾸기 
$("#username").keyup(function(){
	var username = $("#username").val().trim();
	
	if(username != null){
		$("#Chk3").val('true');
		submitChk();
	} else{
		$("#Chk3").val('false');
		submitChk();
	}

});
// 비밀번호 채우면 작동
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
// 비밀번호 확인 채우면 작동 
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

// 이메일 중복확인 
$("#emailChkBtn").click(function(){
	var email = $("#email").val();
	var hemail = $("#hiddenemail").val();
	console.log(email)
	if (email == null || email == "@null") {
		$("#emailChk").show();
		$("#emailChk").html('email을 입력해 주세요.');
		$("#emailChk").css("color", "red");
	} else if(email== hemail){
		$("#emailChk").show();
		$("#emailChk").html('사용 가능한 email입니다.');
		$("#emailChk").css("color", "blue");
		$("#Chk4").val('true');
		submitChk();
		setTimeout(function() {
			$("#emailChk").hide();
			}, 2000);
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

// 도로명 주소 API
function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	// scrollbars=yes 스크롤 바 가능 resizable=yes 팝업창 크기 조절 가능 
	var pop = window.open("popup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
// 값 불러와서 id가 address...
function jusoCallBack(roadFullAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
	document.getElementById("address").value = roadFullAddr;
	$("#Chk5").val('true');
}

// 핸드폰 번호 중복확인
$("#phone").keyup(function(){
	var phone = $("#phone").val();
	var fphone = phone.substring(0,3);
	var hphone = $("hiddenphone").val();
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
	} else if(phone==hphone){
		$("#phoneChk").html('사용 가능한 번호입니다.');
		$("#phoneChk").css("color", "blue");
		$("#Chk6").val('true');
		submitChk();
		console.log(phone)
		setTimeout(function() {
			$("#phoneChk").hide();
			}, 2000);
	}else{
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
// 수정버튼 비활성화인걸 활성화 시키는 조건
function submitChk() {
	var userid = $("#userid").val();
	var temp = userid.substring(userid.length-2, userid.length);
	
	if(temp=="@n" || temp=="@k" || temp=="@g"){
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