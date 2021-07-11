
	$(document).ready(function() {
		
		var userSeq = $("[name='userseq']").val();
		console.log(userSeq)
	
		var recommandArray = $("*[name^='recommand']");
		
		for (var i = 0; i < recommandArray.length; i++) {
			var productseq = recommandArray[i].value.substring(4);
			recommand(productseq, userSeq);
		}
	});
	
	function recommand(productseq, userseq) {
	
		var recommandCntData = {'userseq': userseq, 'productseq': productseq};
		console.log(recommandCntData);
		
		$.ajax({
			url: "recommandcnt.do",
			type: "POST",
			data: recommandCntData,
			success: function(data) {
				var recommandcnt = data;
				if (recommandcnt > 0) {
					$(".recommandseq"+productseq).children().remove();
					$(".recommandseq"+productseq).append('<i class="fas fa-heart"></i>');
					$(".recommand"+productseq).prop("name", recommandcnt);
				} else {
					$(".recommandseq"+productseq).children().remove();
					$(".recommandseq"+productseq).append('<i class="far fa-heart"></i>');
					$(".recommand"+productseq).prop("name", recommandcnt);
				}
			}
		});
	}