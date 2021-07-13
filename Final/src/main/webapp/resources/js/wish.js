function chkWish() {
	
	var productseq = $("#productseq").val();
	var userseq = $("#userseq").val();
	console.log(productseq)
	console.log(userseq)
	
	$.ajax({
	
		url: "chkWish.do?productseq="+productseq+"&userseq="+userseq,
		method: "post",
		dataType: "text",
		success:function(data) {
			if (data > 0) {
				$("#wisharea").children().remove();
				$("#wisharea").append('<i class="fas fa-heart"></i>')
			} else {
				$("#wisharea").children().remove();
				$("#wisharea").append('<i class="far fa-heart"></i>')
			}
		},
		error:function() {
			alert("통신 실패")
		}
		
	})
	
}

function addWish() {

	var emptyHeart = '<i class="far fa-heart"></i>';
	var fillHeart = '<i class="fas fa-heart"></i>'
	
	var wishStat = $("#wisharea").html();
	console.log(wishStat)
	
	var productseq = $("#productseq").val();
	var userseq = $("#userseq").val();
	
	if (wishStat === emptyHeart) {
		
		if (confirm("찜하기에 추가하시겠습니까?")) {

			$.ajax({
				
				url: "wishInsert.do?productseq="+productseq+"&userseq="+userseq,
				method: "post",
				success:function(data) {
					chkWish();
					getWishCount();
					
				},
				error:function() {
					alert("통신 실패")
				}
				
			})

		}
		
	} else if (wishStat === fillHeart) {
		
		if (confirm("찜하기에서 삭제하시겠습니까?")) {		
			
			$.ajax({
				
				url: "wishDelete.do?productseq="+productseq+"&userseq="+userseq,
				method: "post",
				success:function() {
					chkWish();
					getWishCount();
				},
				error:function() {
					alert("통신 실패")
				}
				
			})

		}
	}
	
	
}

function getWishCount() {
	
	var productseq = $("#productseq").val();
	var userseq = $("#userseq").val();
	console.log(productseq)
	console.log(userseq)
	
	$.ajax({
	
		url: "getWishCount.do?productseq="+productseq+"&userseq="+userseq,
		method: "post",
		dataType: "text",
		success:function(data) {
				$("#wishcount").html(data);
		},
		error:function() {
			alert("통신 실패")
		}
		
	})
	
}

