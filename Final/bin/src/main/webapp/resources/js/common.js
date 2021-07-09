// 공통적으로 사용할 function
// 1. 로그인 관련
// 2. 어떤 행위시 로그인 체크
// 3. 관리자 여부 확인

function loginChk() {
	
	var sessionLogin= $("#sessionLogin").val();
	alert(sessionLogin);
	
	if (sessionLogin == null || sessionLogin == "") {

		return false;
		
	} else {
		
		return true;
		
	}
	
}