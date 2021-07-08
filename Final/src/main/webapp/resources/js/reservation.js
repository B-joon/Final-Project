function chkReservation(productseq) {

	if (loginChk()) {
		
		location.href='reservation.do?productseq='+productseq;
		
	} else {
		
		alert("로그인을 해주세요.")
		location.href='loginform.do';
		
	}
	
	
}

function goPayment() {
	
	var ticketprice = $("#ticketprice").val();
	var num = $("[name='ticketcount'] option:selected").val();
	var name = $("[name='reviewname']").val();
	var price = ticketprice * num;
	
	location.href='pay.do?name='+name+'&price='+price;
	
	
}