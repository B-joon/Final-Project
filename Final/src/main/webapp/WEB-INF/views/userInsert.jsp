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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	
	$(function() {
		$("#idChkres").hide();
		$("#checkPwd1").hide();
		$("#checkPwd2").hide();
	});
	// 비밀번호
	
	function checkPwd1(){
		var f1 = document.forms[0];
		var pw = f1.pw1.value;
		
		if (pw.length < 4 || pw.length > 15){
			$("#checkPwd1").show();
			document.getElementById('checkPwd1').style.color = "red";
			document.getElementById('checkPwd1').innerHTML = "비밀번호를 4~ 15자로 작성하세요.";
			$("#Chk2").val('false');
			submitChk();
		} else if(pw.length == 0 || pw == null){
			$("#checkPwd1").hide();
			$("#Chk2").val('false');
			submitChk();
		} else {
			$("#checkPwd1").hide();
			$("#Chk2").val('true');
			submitChk();
		}
		
	}
	
	
	// 비밀번호 확인
	function checkPwd2() {
		var f1 = document.forms[0];
		var pw1 = f1.pw1.value;
		var pw2 = f1.pw2.value;
		
		if (pw1 != pw2) {
			$("#checkPwd2").show();
			document.getElementById('checkPwd2').style.color = "red";
			document.getElementById('checkPwd2').innerHTML = "암호가 불일치합니다";
			$("#Chk3").val('false');
			submitChk();
		} else {
			$("#checkPwd2").show();
			document.getElementById('checkPwd2').style.color = "blue";
			document.getElementById('checkPwd2').innerHTML = "암호가 일치합니다.";
			$("#Chk3").val('true');
			submitChk();
			setTimeout(function() {
				$("#checkPwd2").hide();
				}, 3000);
		}

	}
	
	
</script>

</head>
<body>

	<form action="userInsertres.do" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input style="ime-mode: disabled" type="text" name="userid" id="userid" placeholder="4~13자만 가능합니다">
					<input type="hidden" id="Chk1" value="false">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="idChkres"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="userpw" id="pw1" placeholder="비밀번호를 적어주세요" onkeyup="checkPwd1();">
					<input type="hidden" id="Chk2" value="false">	
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="checkPwd1"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id="pw2" placeholder="비밀번호를 확인해주세요" onkeyup="checkPwd2();">
					<input type="hidden" id="Chk3" value="false">
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center" id="checkPwd2"></td>
			</tr>
			
			<tr>

			</tr>
			<tr>
				<th>EMAIL</th>
				<td>
					<input type="text" name="femail" id="femail" style="ime-mode: disabled" placeholder="이메일을 적어주세요">@
					 <input id="textEmail" placeholder="이메일을 선택하세요" readonly="readonly"> 
					<select name="bemail" id="bemail">
						<option value="" disabled selected>이메일을 선택해주세요.</option> 
						<option value="naver.com">naver.com</option> 
						<option value="hanmail.net">hanmail.net</option> 
						<option value="hotmail.com">hotmail.com</option> 
						<option value="nate.com">nate.com</option> 
						<option value="gmail.com">gmail.com</option>
						<option value="directly">직접입력</option>  
					</select>
					<input type="hidden" id="Chk4" value="false">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="emailChk"></td>
			</tr>
			
			<tr>
				<th>핸드폰 번호</th>
				<td>
					<input type="text" name="phone" id="phone" placeholder="숫자만 입력하세요" style="ime-mode: disabled">
					<input type="hidden" id="Chk5" value="false">
				</td>
					
			</tr>
			<tr>
				<td colspan="2" align="center" id="phoneChk"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input style="width: 300px;" type="text" name="address"
					id="address" class="form-control" readonly="readonly"
					placeholder="주소를 입력하려면 여기를 클릭하세요" onclick="goPopup();">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="button" value="취소" onclick="location.href='loginform.do'" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" id="submitRes" value="회원가입" disabled="disabled"></td>
			</tr>
		</table>
	</form>

</body>
<script type="text/javascript">

$("#userid").blur(function(){
	var userid = $("#userid").val().trim();
	console.log(userid)
	if (userid == null || userid == "") {
		$("#idChkres").show();
		$("#idChkres").html('ID를 입력해 주세요.');
		$("#idChkres").css("color", "red");
	} else {
		$.ajax({
			type : "post",
			url : "ajaxidChk.do?userid=",
			data : userid,
			contentType : "application/text",
			dataType : "text",
			success : function(check) {
				$("#idChkres").show();
				console.log(check)
				if(userid.length > 3 && userid.length < 14){
					if (check == "false") {
						$("#idChkres").html('사용 가능한 ID입니다.');
						$("#idChkres").css("color", "blue");
						$("#Chk1").val('true');
						submitChk();
						
					} else {
						$("#idChkres").html('이미 존재하는 ID입니다.');
						$("#idChkres").css("color", "red");
						$("#Chk1").val('false');
						submitChk();
					}
				} else {
					$("#idChkres").html('ID를 4 ~ 13자로 만들어주세요.');
					$("#idChkres").css("color", "red");
					$("#Chk1").val('false');
					submitChk();
				}
			},
			error : function() {
				alert("ID 통신 실패");
			}
		});
	}

});

	$("#userid").keyup(function(event){
		// 좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
		var inputVal = $(this).val();
		if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode ==  46){ 
			return;
		}
		$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	}); 
	
	$("#femail").keyup(function(event){
		// 좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
		var inputVal = $(this).val();
		if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode ==  46){ 
			return;
		}
		$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	}); 
	
	$(function() {
        $('#bemail').change(function() {
            if ($('#bemail').val() == 'directly') {
                $('#textEmail').attr("disabled", false);
                $("#textEmail").attr("readonly", false);
                $('#textEmail').val("");
                $('#textEmail').focus();
            } else {
                $('#textEmail').val($('#bemail').val());
            }
        })
    });
	
	$("#bemail").blur(function(){
		var femail = $("#femail").val();
		var femailChk = femail + "@null";
		var bemail = $("#bemail").val();
		var email = femail + "@" + bemail;
		console.log(email)
		if (email == null || email == "@null" ||email == femailChk) {
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
					$("#addressChkres").show();
					if (check == "false") {
						$("#emailChk").html('사용 가능한 email입니다.');
						$("#emailChk").css("color", "blue");
						$("#Chk4").val('true');
						submitChk();
					} else {
						$("#emailChk").html('이미 존재하는 email입니다.');
						$("#emailChk").css("color", "red");
						$("#Chk4").val('false');
						submitChk();
					}
				},
				error : function() {
					alert("email 통신 실패");
				}
			});
		}

	});

	
	$("#phone").keyup(function(event){
	    var inputVal = $(this).val();
	    $(this).val(inputVal.replace(/[^0-9]/gi,''));
	});
	
	$("#phone").blur(function(){
		var phone = $("#phone").val();
		var fphone = phone.substring(0,3);
		console.log(phone)
		console.log(fphone)
		if (phone == null || phone == "") {
			$("#phoneChk").show();
			$("#phoneChk").html('핸드폰 번호를 입력해 주세요.');
			$("#phoneChk").css("color", "red");
			$("#Chk5").val('false');
			submitChk();
		} else if (fphone != "010"){
			$("#phoneChk").show();
			$("#phoneChk").html('010으로 시작하는 번호를 입력해 주세요.');
			$("#phoneChk").css("color", "red");
			$("#Chk5").val('false');
			submitChk();
		} else {
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
						$("#Chk5").val('true');
						submitChk();
					} else if(check == "true") {
						$("#phoneChk").html('이미 존재하는 번호입니다.');
						$("#phoneChk").css("color", "red");
						$("#Chk5").val('false');
						submitChk();
						
					} else {
						$("#phoneChk").html('번호를 적어주세요');
						$("#phoneChk").css("color", "red");
						$("#Chk5").val('false');
						submitChk();
					}
				},
				error : function() {
					alert("phone 통신 실패");
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
	}
	
	function submitChk() {
		
		if($("#Chk1").val() == 'true' && $("#Chk2").val() == 'true' && $("#Chk3").val() == 'true' && $("#Chk4").val() == 'true' && $("#Chk5").val() == 'true'){
			$("#submitRes").attr("disabled", false);
		} else{
			$("#submitRes").attr("disabled", true);
		}
	}
	
</script>
</html>