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

function couponVal(){
	var userseq = $("#loginseq").val();
	var makeseq = $("#makeseq").val();
	var coupontitle = $("#coupontitle").val(); 
	var discount = $("#discount").val(); 
	var endday = $("#endday").val(); 
	
    let queryString = "userseq="+userseq+"&"+"makeseq="+makeseq
	+"&"+"coupontitle="+coupontitle+"&"+"discount="+discount+"&"+"endday="+endday
	
	location.href="downloadcoupon.do?"+queryString
}

 $ajax