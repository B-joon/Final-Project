function chkReservation(productseq) {

	if (loginChk()) {
		
		location.href='reservation.do?productseq='+productseq;
		
	} else {
		
		alert("로그인을 해주세요.")
		location.href='loginform.do';
		
	}
	
	
}



    function requestPay() {
    
    	var ticketprice = $("#ticketprice").val();
		var num = $("[name='ticketcount'] option:selected").val();
		var coupon = $("[name='discount'] option:selected").val();
		var name = $("#productname").val();
		var price = (ticketprice * num)-coupon;
		var userseq = $("#loginseq").val();
		
    
    
        var IMP = window.IMP; // 생략해도 괜찮습니다.
        IMP.init("imp05572754"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card", //결제 수단 
            merchant_uid: "ORD20180131-0000011",
            name: name, //상품이름
            amount: price, //상품가격
            buyer_name: userseq, // 구매자 이름 
            
        }, function (rsp) { // callback (rsp는 결제의 성공여부, 결제 정보, 에러정보 등을 담고있다. )
            if (rsp.success) {
            	var msg = '결제가 완료되었습니다.';
            	msg += "고유 ID: "+ rsp.imp_uid;
            	msg += "상점 거래 ID:"+ rsp.merchant_uid;
            	msg += "결제 금액 :"+rsp.paid_amount;
            	msg += "카드 승인번호:" +rsp.apply_num;
            // 결제 성공 시 로직,성공시 ajax 를 통해 결제내역 insert 예정 
            
    } else {
    	var msg = '결제에 실패하였습니다.';
    	msg += '에러내용 : '+ rsp.error_msg;
        // 결제 실패 시 로직,
        
    }
        alert(msg);
  })
};