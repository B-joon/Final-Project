
function addWish() {
	if (confirm("찜하기에 추가하시겠습니까?")) {

		document.getElementById('form1').submit();
	} else {
		return;
	}
}

