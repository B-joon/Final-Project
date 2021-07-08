function chkReservation(productseq) {

	if (loginChk()) {
		
		location.href='reservation.do?productseq='+productseq;
		
	} else {
		
		alert("로그인을 해주세요.")
		location.href='loginform.do';
		
	}
	
	
}