<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PTSD / 회원 검색</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	function searchFunction() {
		
		$("#userlist").children().remove();
		const partylist = document.querySelector('#userlist');
		const table = document.createElement('table');
		table.setAttribute("class","table table-dark m-3");
		const tr = document.createElement('tr');
		const th1 = document.createElement('th');
		th1.append("번호");
		const th2 = document.createElement('th');
		th2.append("이름");
		const th3 = document.createElement('th');
		th3.append("아이디");
		const th4 = document.createElement('th');
		th4.append("이메일");
		const th5 = document.createElement('th');
		th5.append("주소");
		const th6 = document.createElement('th');
		th6.append("전화번호");
		const th7 = document.createElement('th');
		th7.append("유저등급");
		const th8 = document.createElement('th');
		th8.append("회원탈퇴");
		tr.append(th1);
		tr.append(th2);
		tr.append(th3);
		tr.append(th4);
		tr.append(th5);
		tr.append(th6);
		tr.append(th7);
		tr.append(th8);
		table.append(tr);
		
		var name = $("#name").val().trim();
		console.log(name)
		if(name == null || name == ""){
			alert("이름을 적어주세요");
		}else{
			$.ajax({
				type : "post",
				url : "usersearch.do?name=",
				data : name,
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					console.log(data)
					console.log(data.userseq)
					console.log(data.length)
					for (var i = 0; i < data.length; i++) {
						const tr2 = document.createElement('tr');
						const userseq = document.createElement('td');
						userseq.append(data[i].userseq);
						const username = document.createElement('td');
						username.append(data[i].name);
						const userid = document.createElement('td');
						userid.append(data[i].userid);
						const email = document.createElement('td');
						email.append(data[i].email);
						const address = document.createElement('td');
						address.append(data[i].address);
						const phone = document.createElement('td');
						phone.append(data[i].phone);
						const userrole = document.createElement('td');
						userrole.append(data[i].userrole);
						const edit = document.createElement('td');
						const userdelete = document.createElement('input');
						userdelete.setAttribute("type","button");
						userdelete.setAttribute("value","회원탈퇴");
						userdelete.setAttribute("class","btn btn-danger");
						userdelete.setAttribute("onclick","location.href='admindelete.do?userseq="+data[i].userseq+"'");
						edit.append(userdelete);
						
						tr2.append(userseq);
						tr2.append(username);
						tr2.append(userid);
						tr2.append(email);
						tr2.append(address);
						tr2.append(phone);
						tr2.append(userrole);
						tr2.append(edit);
						

						table.append(tr2);
						
						
						
					}
					userlist.append(table);
				},
				error : function() {
					alert("유저 검색 통신 실패");
		}
	});
		}
	}
</script>

</head>
<body>
<%@include file="./common.jsp" %>	

	<div class="container border border-danger rounded">
		<div class="form-group row m-3">
			<div class="mr-3 col-xs-8">
				<input class="form-cotrol" id="name"
					type="text" size="30" placeholder="회원 이름을 입력해주세요!">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-danger btn-sm"  onclick="searchFunction();"
					type="button">검색</button>
			</div>
			
			<br>

		</div>
		
	</div>
	<div class="m-3" id="userlist">
	
		
	
	</div>
	

</body>
</html>