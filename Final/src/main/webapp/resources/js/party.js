$(function(){

	//chkPartyAreaCode();
	
})

// 축제정보 전체인지 아니면 특정지역인지 체크
function chkPartyAreaCode(areacode) {
	
//	var area = document.getElementsByName("partyareaCode")[0];
//	var idx = area.selectedIndex;
//	var areacode = area.options[idx].value;
	
	if (areacode == 0) {
		getPartyAllList();
	} else {
		getPartyList(areacode);
	}
	
}

// 상품정보 전체인지 아니면 특정지역인지 체크
function chkProductAreaCode(areacode) {
	
//	var area = document.getElementsByName("productareaCode")[0];
//	var idx = area.selectedIndex;
//	var areacode = area.options[idx].value;
	
	if (areacode == 0) {
		getProductAllList();
	} else {
		getProductList(areacode);
	}
	
}

// 모든 지역의 축제 정보 가져오기
function getPartyAllList() {
	
	$("#partylist").children().remove();

	const arrCode = [1, 31, 2, 34, 33, 3, 8, 32, 38, 37, 5, 7, 4, 36, 35, 6, 39];
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival'; /*URL*/
	for (var i = 0; i < arrCode.length; i++) {
		
		var param = getParams(arrCode[i]);
		
		(function() {
		
		$.ajax({

			url: url+param,
			method: 'get',
			dataType: 'json',
			async:false,
			success:function(data) {
				console.log(data)
				console.log(data.response.body.items)
				const list = data.response.body.items.item;
				const partylist = document.querySelector('#partylist');
				
				for (var i = 0; i < list.length; i++) {
					
					const div = document.createElement('div');

					div.setAttribute("class","partyDiv");
					const title = document.createElement('div');
					title.append(list[i].title);
					const addr = document.createElement('div');
					addr.append(list[i].addr1);
					const img = document.createElement('img');
					img.src = list[i].firstimage;
					img.style.witdh = "10em";
					img.style.height = "10em";
					const tel = document.createElement('div');
					tel.append(list[i].tel);
					div.append(title);
					div.append(addr);
					div.append(img);
					div.append(tel);
					
					partylist.append(div);
					
				}
					
				
			},
			error:function() {
				alert("실패")
			}
			
		});
		
		
	})();
	}	
}

// 해당 지역의 축제정보 가져오기
function getPartyList(areacode) {
	
	$("#partylist").children().remove();
	
//	var area = document.getElementsByName("partyareaCode")[0];
//	var idx = area.selectedIndex;
//	var areaCode = area.options[idx].value;
	console.log(areacode)
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival'; /*URL*/
	
	function getParams() {
		var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'EMJ2Rn9mhuxuoj5KpdNO%2FsWOOIhCiNFnNu%2Bdlizv7uuLcIoIueA%2FPp8ld%2BJfPtz5uWRAxF3toCwBM5oUOU0Tyw%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('100'); /**/
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
		queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
		queryParams += '&' + encodeURIComponent('listYN') + '=' + encodeURIComponent('Y'); /**/
		queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('A'); /**/
		queryParams += '&' + encodeURIComponent('eventStartDate') + '=' + encodeURIComponent('20210101'); /**/
		queryParams += '&' + encodeURIComponent('eventEndDate') + '=' + encodeURIComponent('20211231'); /**/
		queryParams += '&' + encodeURIComponent('areaCode') + '=' + encodeURIComponent(areacode); /**/
		queryParams += '&' + encodeURIComponent('_type=json');
		
		return queryParams;
	}
	
	$.ajax({
		
		url: url+getParams(),
		method: 'get',
		dataType: 'json',
		success:function(data) {
			console.log(data)
			console.log(data.response.body.items)
			const list = data.response.body.items.item;
			const partylist = document.querySelector('#partylist');
			
			for (var i = 0; i < list.length; i++) {
				
				const div = document.createElement('div');

				div.setAttribute("class","partyDiv");
				const title = document.createElement('div');
				title.append(list[i].title);
				const addr = document.createElement('div');
				addr.append(list[i].addr1);
				const img = document.createElement('img');
				img.src = list[i].firstimage;
				img.style.witdh = "10em";
				img.style.height = "10em";
				const tel = document.createElement('div');
				tel.append(list[i].tel);
				div.append(title);
				div.append(addr);
				div.append(img);
				div.append(tel);
				
				partylist.append(div);
				
			}
				
			
		},
		error:function() {
			alert("실패")
		}
		
	})
	
	
}

// 모든 지역의 상품 정보
function getProductAllList() {
	
	$("#partylist").children().remove();

	const arrCode = [1, 31, 2, 34, 33, 3, 8, 32, 38, 37, 5, 7, 4, 36, 35, 6, 39];
	
	for (var i = 0; i < arrCode.length; i++) {
		
		var areacode = arrCode[i];
		
		(function(){
		
			$.ajax({
				url: "getProductList.do?areacode="+areacode,
				method: "post",
				contentType : "application/json",
				dataType: "json",
				async:false,
				success:function(data) {
					const partylist = document.querySelector('#partylist');
					
					for (var i = 0; i < data.length; i++) {
						
						const div = document.createElement('div');

						div.setAttribute("class","partyDiv");
						const productname = document.createElement('div');
						productname.append(data[i].productname);
						const address = document.createElement('div');
						address.append(data[i].address);
						const img = document.createElement('img');
						img.src = data[i].thumbimg;
						img.style.witdh = "10em";
						img.style.height = "10em";
						const productcontent = document.createElement('div');
						productcontent.append(data[i].productcontent);
						const tellnumber = document.createElement('div');
						tellnumber.append(data[i].tellnumber);
						const button1 = document.createElement('input');
						button1.setAttribute("type","button");
						button1.setAttribute("value","예매하기");
						button1.setAttribute("onclick","chkReservation("+data[i].productseq+");");

						const button2 = document.createElement('input');
						button2.setAttribute("type","button");
						button2.setAttribute("value","좋아요");
						button2.setAttribute("onclick","");
						
						const button3 = document.createElement('input');
						button3.setAttribute("type","button");
						button3.setAttribute("value","찜하기");
						button3.setAttribute("onclick","");
						
						div.append(productname);
						div.append(address);
						div.append(img);
						div.append(productcontent);
						div.append(tellnumber);
						div.append(button1);
						div.append(button2);
						div.append(button3);

						partylist.append(div);
						
					}

				},
				error:function() {
					alert("실패")
				}
				})
			
			
			
	})();
	
	}
	
}

// 해당 지역의 상품 정보
function getProductList(areacode) {
	
	$("#partylist").children().remove();

	$.ajax({
		url: "getProductList.do?areacode="+areacode,
		method: "post",
		contentType : "application/json",
		dataType: "json",
		success:function(data) {
			const partylist = document.querySelector('#partylist');
			
			for (var i = 0; i < data.length; i++) {
				
				const div = document.createElement('div');

				div.setAttribute("class","partyDiv");
				const productname = document.createElement('div');
				productname.append(data[i].productname);
				const address = document.createElement('div');
				address.append(data[i].address);
				const img = document.createElement('img');
				img.src = data[i].thumbimg;
				img.style.witdh = "10em";
				img.style.height = "10em";
				const productcontent = document.createElement('div');
				productcontent.append(data[i].productcontent);
				const tellnumber = document.createElement('div');
				tellnumber.append(data[i].tellnumber);
				const button1 = document.createElement('input');
				button1.setAttribute("type","button");
				button1.setAttribute("value","예매하기");
				button1.setAttribute("onclick","chkReservation("+data[i].productseq+");");

				const button2 = document.createElement('input');
				button2.setAttribute("type","button");
				button2.setAttribute("value","좋아요");
				button2.setAttribute("onclick","");
				
				const button3 = document.createElement('input');
				button3.setAttribute("type","button");
				button3.setAttribute("value","찜하기");
				button3.setAttribute("onclick","");
				
				div.append(productname);
				div.append(address);
				div.append(img);
				div.append(productcontent);
				div.append(tellnumber);
				div.append(button1);
				div.append(button2);
				div.append(button3);

				partylist.append(div);
				
			}
			

		},
		error:function() {
			alert("실패")
		}
		})
	
	
}

// 예매하기 클릭시 로그인 여부 확인 + 로그인 체크하는 공통된 메소드를 하나 만들어야 할 듯
function chkReservation(productseq) {
	
	var sessionLogin= $("#sessionLogin").val();
	alert(sessionLogin);
	
	if (sessionLogin == null || sessionLogin == "") {
		
		alert("로그인을 해주세요.")
		location.href='loginform.do';
		
		
		
	} else {
		
		location.href='reservation.do?productseq='+productseq;
		
	}
	
	
	
	
}


// 축제정보 가져올시의 파라미터
function getParams(areacode) {
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'EMJ2Rn9mhuxuoj5KpdNO%2FsWOOIhCiNFnNu%2Bdlizv7uuLcIoIueA%2FPp8ld%2BJfPtz5uWRAxF3toCwBM5oUOU0Tyw%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('100'); /**/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
	queryParams += '&' + encodeURIComponent('listYN') + '=' + encodeURIComponent('Y'); /**/
	queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('A'); /**/
	queryParams += '&' + encodeURIComponent('eventStartDate') + '=' + encodeURIComponent('20210101'); /**/
	queryParams += '&' + encodeURIComponent('eventEndDate') + '=' + encodeURIComponent('20211231'); /**/
	queryParams += '&' + encodeURIComponent('areaCode') + '=' + encodeURIComponent(areacode); /**/
	queryParams += '&' + encodeURIComponent('_type=json');
	
	return queryParams;
}
