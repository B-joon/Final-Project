$(function(){
	
	insertControl();
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