<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 회원정보찾기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@include file="./common.jsp" %>

	<div class="border border-danger rounded">
	<div class="m-3">
	<input type="button" class="btn btn-danger mr-3" value="아이디찾기" onclick="idFind();">
	<input type="button" class="btn btn-warning" value="비밀번호찾기" onclick="pwFind();"></div>
	<div class="m-3" style="width:30em;">
	<table class="table table-borderless m-3">
		<tr>
			<td id="res"></td>
			<td id="pwres"></td>
		</tr>
		<tr id="nameframe">
			<th>이름</th>
			<td>
				<input type="text" id="name" class="form-control" placeholder="이름을 입력해 주세요">
				<input type="hidden"id="Chk1" value="false">
			</td>
		</tr>
		<tr id="idframe">
			<th>아이디</th>
			<td>
				<input type="text" id="userid" class="form-control"  placeholder="아이디를 입력해 주세요">
				<input type="hidden"id="Chk2" value="false">
			</td>
		</tr>
		<tr id="emailframe" >
			<th>EMAIL</th>
			<td>
				<input type="text" id="email" class="form-control"  placeholder="이메일을 입력해 주세요"> 
				<input type="button"id="proofBtn" class="btn btn-secondary" value="인증번호 발송"> 
				<input type="hidden"id="Chk3" value="false">
			</td>
		</tr>
		<tr>
			<td id="emailChk">
			</td>
		</tr>
		<tr id="proofframe">
			<th>인증번호 확인</th>
			<td>
				<input type="text" id="prooftext" class="form-control"  placeholder="이메일로 보낸 인증번호를 입력해주세요">
			</td>
		</tr>
		<tr>
			<td id="proofChk"></td>
		</tr>
		<tr>
			<td id="idFindChk"></td>
		</tr>
		<tr>
			<td id="pwFindChk"></td>
		</tr>
		<tr>
			<td>
				<input type="button" class="btn btn-secondary" id="okbutton" value="확인" disabled="disabled">
				<input type="button" class="btn btn-secondary" id="idFind" value="아이디 찾기">
				<input type="button" class="btn btn-secondary" id="pwFind" value="비밀번호 찾기">
			</td>
		</tr>
	</table>
	</div>
	</div>
	
</body>
<script type="text/javascript">

$(function() {
	$("#nameframe").hide();
	$("#idframe").hide();
	$("#emailframe").hide();
	$("#proofframe").hide();
	$("#okbutton").hide();
	$("#idFind").hide();
	$("#pwFind").hide();
});

function idFind(){
	$("#nameframe").show();
	$("#idframe").hide();
	$("#emailframe").show();
	$("#proofframe").show();
	$("#okbutton").val("아이디 찾기");
	$("#okbutton").show();
	$("#res").hide();
	$("#idFind").hide();
	$("#pwFind").hide();
	$("#userid").val('');
	$("#Chk1").val('false');
	$("#Chk2").val('false');
}

function pwFind(){
	$("#nameframe").hide();
	$("#idframe").show();
	$("#emailframe").show();
	$("#proofframe").show();
	$("#okbutton").val("비밀번호 찾기");
	$("#okbutton").show();
	$("#res").hide();
	$("#idFind").hide();
	$("#pwFind").hide();
	$("#name").val('');
	$("#Chk1").val('false');
	$("#Chk2").val('false');
}
</script>

<script type="text/javascript">

$("#name").keyup(function(event){
	var name = $("#name").val();
	if(name != null){
		$("#Chk1").val('true');
	} else{
		$("#Chk1").val('false');
	}
	submitChk();
}); 

$("#userid").keyup(function(event){
	var userid = $("#userid").val();
	if(name != null){
		$("#Chk2").val('true');
	} else{
		$("#Chk2").val('false');
	}
	submitChk();
}); 

$("#proofBtn").click(function(){
	var email = $("#email").val();
	$("#proofBtn").val("인증번호 재발송");
	var key;
	var bool = true;
	if(email == null || email== ""){
		$("#proofChk").html('이메일을 적어주세요');
		setTimeout(function() {
			$("#proofChk").hide();
			}, 2000);
	}else if (bool) {
		$.ajax({
			type : "post",
			url : "proofChk.do?email=",
			data : email,
			contentType : "application/text",
			dataType : "text",
			success : function(authCodes) {
				if(authCodes == null){
					$("#emailChk").html('회원가입 되어 있는 이메일이 아닙니다.');
					$("#emailChk").css("color", "red");
				}else{
				key = authCodes;
				bool = false;
				}
			},
			error : function() {
				alert("이메일 인증 통신 실패");
			}
		});
		
		$("#prooftext").keyup(function() {
			var proof = $("#prooftext").val();
			if(proof.length == 6){
				if(proof == key){
					$("#proofChk").html('인증완료');
					$("#proofChk").css("color", "blue");
					$("#proofBtn").attr('type', 'hidden');
					$("#email").attr('readonly', true)
					$("#prooftext").attr('readonly', true);
					$("#Chk3").val('true');
					submitChk();
					console.log(proof)
					setTimeout(function() {
						$("#proofChk").hide();
						}, 2000);
				} else{
					$("#proofChk").html('인증번호를 다시 확인해주시거나 재발송을 눌러주세요.<br> 복사 붙여넣기하신 경우 맨뒤에 숫자를 지웠다 다시 적어주세요');
					event.preventDefault();
				}
			}
			
		});
	} else{
		event.preventDefault();
	}

});

$("#idFind").click(function() {
	var name = $("#name").val().trim();
	var email = $("#email").val().trim();
	var idFindVal = {
		"name" : name,
		"email" : email
	}

	if (name == null || name == "") {
		$("#idFindChk").html('이름을 작성해주세요');
		setTimeout(function() {
			$("#idFindChk").hide();
			}, 5000);
	} else {
		$.ajax({
			type : "post",
			url : "idFind.do",
			data : JSON.stringify(idFindVal),
			contentType : "application/json",
			dataType : "json",
			success : function(msg) {
				if (msg.userid != null) {
					$("#nameframe").hide();
					$("#emailframe").hide();
					$("#proofframe").hide();
					$("#idFind").hide();
					$("#pwFind").hide();
					$("#res").html("사용자님의 아이디는 : " + msg.userid + " 입니다.");
				} else {
					$("#idFindChk").html('이름과 이메일에 일치하는 아이디가 없습니다.');
					$("#idFindChk").css("color", "red");
					setTimeout(function() {
						$("#idFindChk").hide();
						}, 5000);
				}
			},
			error : function() {
				alert("통신 실패");
			}
		});
	}

});


$("#pwFind").click(function(){
	var userid = $("#userid").val().trim();
	console.log(userid);
	var email = $("#email").val().trim();
	console.log(email);
	var pwFindVal = {
		"userid" : userid,
		"email" : email
	}

	if (userid == null || userid == "") {
		alert("아이디를 작성해주세요");
	} else {
		$.ajax({
			type : "post",
			url : "pwFind.do",
			data : JSON.stringify(pwFindVal),
			contentType : "application/json",
			dataType : "json",
			success : function(msg) {
				console.log(msg.check);
				if (msg.check == true) {
					$("#idframe").hide();
					$("#emailframe").hide();
					$("#proofframe").hide();
					$("#idFind").hide();
					$("#pwFind").hide();
					$("#pwres").html("고객님의 교체된 비밀번호는 이메일로 보냈습니다.");
				} else if(msg.check == false) {
					$("#pwFindChk").html('아이디와 이메일에 일치하는 비밀번호가 없습니다.');
					$("#pwFindChk").css("color", "red");
					setTimeout(function() {
						$("#idFindChk").hide();
						}, 2000);
				} else{
					$("#pwFindChk").html('아이디와 이메일에 일치하는 비밀번호가 없습니다.');
					$("#pwFindChk").css("color", "red");
					setTimeout(function() {
						$("#idFindChk").hide();
						}, 2000);
				}
			},
			error : function() {
				alert("통신 실패");
			}
		});
	}
	
});

function submitChk() {
	var name = $("#name").val().trim();
	var userid = $("#userid").val().trim();
	if($("#Chk1").val() == 'true' && $("#Chk3").val() == 'true'
			){
		$("#okbutton").hide();
		$("#idFind").show();
		$("#pwFind").hide();
	} else if($("#Chk2").val() == 'true' && $("#Chk3").val() == 'true' ) {
		$("#okbutton").hide();
		$("#idFind").hide();
		$("#pwFind").show();
	}else{
		$("#okbutton").show();
		$("#idFind").hide();
		$("#pwFind").hide();
	}
}

</script>
</html>