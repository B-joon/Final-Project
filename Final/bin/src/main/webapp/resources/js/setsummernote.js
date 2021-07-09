$(document).ready(function() {
  $('#summernote').summernote({
	  
	  placeholder: '컨텐츠 내용을 입력하세요.',
	  height: 300,
	  lang: "ko-KR",
	  callbacks : { // 여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				for (var i = files.length - 1; i >=0; i--) {
					sendFile(files[i], this);
				}
				
			}
		}
	  
  });
});

//이미지 파일 업로드
function sendFile(file, editor) {
	// 파일 전송을 위한 폼생성
	var data = new FormData();
	data.append("file", file);
	$.ajax({ // ajax를 통해 파일 업로드 처리
		data : data,
		type : "POST",
		url : "fileupload.do",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) { // 처리가 성공할 경우
			// 에디터에 이미지 출력
			$(editor).summernote('editor.insertImage', data.url);
		}
	});
}
