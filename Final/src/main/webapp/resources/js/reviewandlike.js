	// 좋아요
	$(document).ready(function () {
		
		var userSeq = $("[name='userseq']").val();
		console.log(userSeq)
		
		var likeArray = $("*[name^='like']");

		for (var i = 0; i < likeArray.length; i++) {
		   var reviewseq = likeArray[i].value.substring(4);
		   like(reviewseq, userSeq);
		}

	});
	
	function like(reviewseq, userseq) {
		
		var likeCntData = {'userseq': userseq, 'reviewseq': reviewseq};
		console.log(likeCntData);
		
		$.ajax({
			url: "likecnt.do",
			type: "POST",
			data: likeCntData,
			success: function(data) {
				var likecnt = data;
				if (likecnt > 0) {
					$(".likeseq"+reviewseq).children().remove();
					$(".likeseq"+reviewseq).append('<i class="fas fa-heart"></i>');
					$(".like"+reviewseq).prop("name", likecnt);
				} else {
					$(".likeseq"+reviewseq).children().remove();
					$(".likeseq"+reviewseq).append('<i class="far fa-heart"></i>');
					$(".like"+reviewseq).prop("name", likecnt);
				}
			}
			
		});
	}
	
	function likeEvent(reviewseq) {
		
		var that = $(".like"+reviewseq);
		
		var sendData = {'reviewseq' : reviewseq, 'like' : that.prop('name')};
		
		$.ajax({
			url : 'like.do',
			type : 'POST',
			data : sendData,
			success: function (data) {
				that.prop('name', data);
				if (data == 1) {
					$(".likeseq"+reviewseq).children().remove();
					$(".likeseq"+reviewseq).append('<i class="fas fa-heart"></i>');
				} else {
					$(".likeseq"+reviewseq).children().remove();
					$(".likeseq"+reviewseq).append('<i class="far fa-heart"></i>');
				}
			}
		});
		window.location.reload();
	}
	function Update(reviewseq) {
		$(".list"+reviewseq).hide();
		$(".update"+reviewseq).show();
	}
	function NoUpdate(reviewseq) {
		$(".list"+reviewseq).show();
		$(".update"+reviewseq).hide();
	}