$(function(){
	
	
		$('#datetimepicker').datetimepicker();
		var playdate = $('#datetimepicker').datetimepicker('viewDate')
		var date = new Date(playdate);
		var year = date.getFullYear();
		var month = ('0' + (date.getMonth() + 1)).slice(-2);
		var day = ('0' + date.getDate()).slice(-2);

		var dateString = year + '-' + month  + '-' + day;

		console.log(dateString);
		$("#playdate").prop("value", dateString);
		
		
		$('#datetimepicker').on("change.datetimepicker", function(e) {
			var playdate = (e.date.format('YYYY-MM-DD'));
			console.log(playdate);
			$("#playdate").prop("value", playdate);
			
		});
})


function chkReservation() {

	if (loginChk()) {

		return requestPay();

	} else {

		alert("로그인을 해주세요.")
		location.href = 'loginform.do';

	}
}


function requestPay() {

	var ticketprice = $("#ticketprice").val();
	var num = $("[name='ticketcount'] option:selected").val();
	var coupon = $("[name='discount'] option:selected").val();
	var name = $("#productname").val();
	var price = (ticketprice * num) - coupon;
	var userseq = $("#loginseq").val();
	var playdate = $("#playdate").val()


	if (confirm('결제금액' + price + ' 원을 결제하시겠습니까?')) {

		return callPay(name, price, userseq, playdate, num);
	} else {
		alert('결제가 취소되었습니다');
	}


};


function callPay(name, price, userseq,playdate, num) {


	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp05572754"); // 발급받은 "가맹점 식별코드"를 사용합니다.
	IMP.request_pay({ // param
		pg: "html5_inicis",
		pay_method: "card", //결제 수단 
		merchant_uid: 'merchant_' + new Date().getTime(), 
		name: name, //상품이름
		amount: price, //상품가격
		buyer_name: userseq, // 구매자 이름 

	}, function(rsp) { // callback (rsp는 결제의 성공여부, 결제 정보, 에러정보 등을 담고있다. )
		if (rsp.success) {

			var insertdata = { 'productname': name, 'userseq': userseq, 'price': price, 'people': num, 'playdate': playdate };
			console.log(insertdata);
			$.ajax({
				url: "insertreservation.do",
				type: "POST",
				data: insertdata,
				success: function(data) {
					var msg = '결제가 완료되었습니다.';
					alert(msg);
					location.href="mypage.do?userseq="+userseq;
					

				},
				error: function() {
					alert("통신 실패.....");
				}
				
				
			})

				

		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);

		}

	})

};