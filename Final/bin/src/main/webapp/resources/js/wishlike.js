	// 좋아요
	$(document).ready(function () {
		
		var userSeq = $("[name='userseq']").val();
		console.log(userSeq)
		
		var wishlikeArray = $("*[name^='wishlike']");

		for (var i = 0; i < wishArray.length; i++) {
		   var wishlikeseq = wishlikeArray[i].value.substring(4);
		   wishlike(wishseq, userSeq);
		}

	});
	
	function wishlike(wishseq, userseq) {
		
		var wishlikeCntData = {'userseq': userseq, 'wishseq': wishseq};
		console.log(likeCntData);
		
		$.ajax({
			url: "wishlikecnt.do",
			type: "POST",
			data: wishlikeCntData,
			success: function(data) {
				var wishlikecnt = data;
				if (wishlikecnt > 0) {
					$(".wishlikeseq"+wishseq).children().remove();
					$(".wishlikeseq"+wishseq).append('<i class="fas fa-heart"></i>');
					$(".wishlike"+wishseq).prop("name", wishlikecnt);
				} else {
					$(".wishlikeseq"+wishseq).children().remove();
					$(".wishlikeseq"+wishseq).append('<i class="far fa-heart"></i>');
					$(".wishlike"+wishseq).prop("name", wishlikecnt);
				}
			}
			
		});
	}
	
	function wishlikeEvent(wishseq) {
		
		var that = $(".wishlike"+wishseq);
		
		var sendData = {'wishseq' : wishseq, 'like' : that.prop('name')};
		
		$.ajax({
			url : 'wishlike.do',
			type : 'POST',
			data : sendData,
			success: function (data) {
				that.prop('name', data);
				if (data == 1) {
					$(".wishlikeseq"+wishseq).children().remove();
					$(".wishlikeseq"+wishseq).append('<i class="fas fa-heart"></i>');
				} else {
					$(".wishlikeseq"+wishseq).children().remove();
					$(".wishlikeseq"+wishseq).append('<i class="far fa-heart"></i>');
				}
			}
		});
		window.location.reload();
	}
	function Update(wishseq) {
		$(".wishlist"+wishseq).hide();
		$(".wishupdate"+wishseq).show();
	}
	function NoUpdate(wishseq) {
		$(".wishlist"+wishseq).show();
		$(".wishupdate"+wishseq).hide();
	}