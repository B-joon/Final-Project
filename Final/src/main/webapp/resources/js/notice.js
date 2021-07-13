


$(function(){
	$(".notice-admin-btn").hide();
	if ($(".userrole").val() == "admin") {
		$(".notice-admin-btn").show();
	}
	insertControl();
});

$(function() {
	downControl();
});

$(function() {
	$('.summernote').summernote({
		height: 300, 
		minHeight: null,
		maxHeight: null, 
		lang: 'ko-KR', 
		onImageUpload: function(files, editor, welEditable) { 
			sendFile(files[0], editor, welEditable); }
	});

});



function insertControl() {

	$("#insertControl").hide();
	var loginseq = $("#loginseq").val();
	var loginrole = $("#loginrole").val();
	console.log(loginseq);
	console.log(loginrole);

	if (loginseq != null && loginrole == 'admin') {
		$("#insertControl").show();
	}
}

function downControl() {

	var loginseq = $("#loginseq").val();
	console.log("loginseq=" + loginseq);

	if (loginseq == null || loginseq == "") {
		$("#downControl").removeAttr('href');
		$("#downControl").click(function() {
			alert("로그인을 해주세요 ! ");
			location.href = 'loginform.do';
		});
	}
}





