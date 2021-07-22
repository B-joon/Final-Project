$(function(){
	var sendButton = function () {
		  var ui = $.summernote.ui;

		  // create button
		  var button = ui.button({
		    contents: '<span id="sendButton" >SEND</span>',
		    tooltip: 'send',
		    click: function () {
				var inputmsg = $('#summernote').val();
				var outmsg = inputmsg.replace(/<(\/?)p>/gi, '');
				outmsg = outmsg.replace('<br>', '');
			sendMessage(outmsg);
				$('#summernote').summernote('reset');
               
		    }
		  });

		  return button.render();   // return button as jquery object
		}
	
	//썸머노트 실행
	$(document).ready(function() {
		

		
		
		$('#summernote').summernote(
										{
											height : 100,
											minHeight : 30,
											maxHeight : 500, 
											focus : true, 
											dialogsInBody : true,
											placeholder : '메세지를 입력해주세요.',
											lang : 'ko-KR',
											toolbar : [
													// [groupName, [list of button]]
													[ 'style', [ 'bold', 'underline' ] ],
													[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
													[ 'mybutton', ['send']] ],
													buttons:{
														send: sendButton
													},
											callbacks : { // 여기 부분이 이미지를 첨부하는 부분
												onImageUpload : function(files) {
													sendFile(files[0], this);
												},
												onPaste : function(e) {
													var clipboardData = e.originalEvent.clipboardData;
													if (clipboardData
															&& clipboardData.items
															&& clipboardData.items.length) {
														var item = clipboardData.items[0];
														if (item.kind === 'file'
																&& item.type
																		.indexOf('image/') !== -1) {
															e.preventDefault();
														}
													}
												}
											}
										});
						
						// 엔터 입력시 에어리어 초기화 및 값 전송
						$('#summernote').on('summernote.enter', function() {
							$(function() {
								var inputmsg = $('#summernote').val();
								var outmsg = inputmsg.replace(/<(\/?)p>/gi, '');
								outmsg = outmsg.replace('<br>', '');
                            sendMessage(outmsg);
							$('#summernote').summernote('reset');
                            
							})
						});
		});
	
})