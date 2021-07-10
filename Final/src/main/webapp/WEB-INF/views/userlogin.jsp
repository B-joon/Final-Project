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
<meta name = "google-signin-client_id"content = "598123668214-i2590f1kq85bg1lm2u1hga0ilps88h69.apps.googleusercontent.com">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/client:platform.js?onload=init" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<style type="text/css">

	#table.static{
		position:static;
		top: 200px;
	}

</style>

<body>
<%@include file="./common.jsp" %>	
	<table id="table" align="center">
		<tr>
			<th>아이디</th>
			<td><input type="text" id="userid" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="userpw"></td>
		</tr>
		<tr>
			<td><input type="button" value="로그인" onclick="login();"></td>
			<td align="center"><input type="button" value="아이디/비빌번호찾기" onclick="location.href='idpwFind.do'"></td>
			<td><input type="button" value="회원가입" onclick="location.href='userInsert.do'"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="loginChk"></td>
		</tr>
		
	</table>
	<div style="text-align:center">
	<a href="${url}"><img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" id="naver_id_login"/></a><br/>
	<a><img width="223" src="https://developers.google.com/identity/images/btn_google_signin_dark_normal_web.png?hl=ko" id="glogin"></a><br/>
	<a><img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png" id="kakaologin"></a>
	</div>	
	
	<br/>
	
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
    
    <script type="text/javascript">
    // google login
    function init() {
        gapi.load('auth2', function() {
            auth2 = gapi.auth2.init({
                client_id: '598123668214-i2590f1kq85bg1lm2u1hga0ilps88h69.apps.googleusercontent.com',
                cookiepolicy: 'single_host_origin',
                scope: 'profile email'
            });
            element = document.getElementById('glogin');
            auth2.attachClickHandler(element, {}, onSignUp, onFailure);
        });
    }
    
    function onSignUp(googleUser) {
      var profile = googleUser.getBasicProfile();
      const userid = profile.getId();
      const email = profile.getEmail();
      const name = profile.getName();
      console.log()
      location.href = 'googlelogin.do?userid' + userid + '&email='+ email + '&name=' + name;
    }
    
    function onFailure(err){
    	console.log(err)
    	return;
    }
    
    // kakaologin
    Kakao.init("25ce5d0c41a04c1ea8e0c87a129786b7");

		Kakao.Auth.createLoginButton({
			container : '#kakaologin',
			success : function(authObj) {
				var token = authObj.access_token;
				/* kakao  */
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						const email = res.kakao_account.email;
						var userid = res.id;
						location.href = 'kakaologin.do?email='+ email + "&userid=" + userid;
					}
				})

			},
			fail : function(err) {
				alert(JASON.stringify(err));
			}

		});
    
    
    </script>
    
</body>
</html>