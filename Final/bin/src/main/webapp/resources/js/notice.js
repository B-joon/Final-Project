

$(function(){
	insertControl();
});

$(function(){
	downControl();
});

function insertControl(){
	
	$(".insertControl").hide();
	var loginseq = $("#loginseq").val();
	var loginrole = $("#loginrole").val();
	console.log(loginseq);
	console.log(loginrole);
	
	if (loginseq != null && loginrole == 'admin'){
		$(".insertControl").show();
	}
	
}

function downControl(){
	
	var loginseq = $("#loginseq").val();
	console.log("loginseq="+loginseq);
	
	if(loginseq == null || loginseq == ""){
		$(".downControl").removeAttr('href');
		$(".downControl").click(function(){
			alert("로그인을 해주세요 ! ");
			location.href='loginform.do';
		})
	
	
	}
	
	
}




