<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 결제</title>
</head>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!--iamport. pyment.js-->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
   

    // IMP.request_pay(param, callback) 호출
    //param 값 {kakaopay,naverpay,}
    // 호출하면 pc환경에서 지정한 pg사의 결제모듈 창이 나타난다. 

    function requestPay() {
        var IMP = window.IMP; // 생략해도 괜찮습니다.
        IMP.init("imp05572754"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card", //결제 수단 
            merchant_uid: "ORD20180131-0000011",
            name: "ptsd 티켓 결제", //상품이름
            amount: 64900, //상품가격
            buyer_name: "user", // userseq or username
            
        }, function (rsp) { // callback (rsp는 결제의 성공여부, 결제 정보, 에러정보 등을 담고있다. )
            if (rsp.success) {
            	var msg = '결제가 완료되었습니다.';
            	msg += "고유 ID: "+ rsp.imp_uid;// 결제 주문번호라고 생각하면 될듯 
            	msg += "상점 거래 ID:"+ rsp.merchant_uid;
            	msg += "결제 금액 :"+rsp.paid_amount;
            	msg += "카드 승인번호:" +rsp.apply_num; //카드 승인번호 
            // 결제 성공 시 로직,
            
    } else {
    	var msg = '결제에 실패하였습니다.';
    	msg += '에러내용 : '+ rsp.error_msg;
        // 결제 실패 시 로직,
        
    }
        alert(msg);
  })
};

</script>



<body>
<%@include file="./common.jsp" %>
		
    <button onclick="requestPay();">결제하기</button>
</body>
</html>