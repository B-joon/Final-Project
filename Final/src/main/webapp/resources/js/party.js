$(function(){

	chkPartyAreaCode(1);
	
})

// 축제정보 전체인지 아니면 특정지역인지 체크
function chkPartyAreaCode(areacode) {

	if (areacode == 0) {
		getPartyAllList();
	} else {
		getPartyList(areacode);
	}
	
}

// 상품정보 전체인지 아니면 특정지역인지 체크
function chkProductAreaCode(areacode) {

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
					
					const cardDeck = document.createElement('div');
					cardDeck.setAttribute("class","col-sm-3 mb-3");
					cardDeck.style.wordBreak = 'break-all';
					
					const card = document.createElement('div');
					card.setAttribute("class","card border-warning");
					
					const img = document.createElement('img');
					img.setAttribute("class","card-img-top");
					img.setAttribute("alt","Card image cap");
					img.setAttribute("onerror","this.src='resources/img/noimage.png'");
					img.src = list[i].firstimage;
					img.style.witdh = "10em";
					img.style.height = "10em";
					
					const div = document.createElement('div');
					div.setAttribute("class","card-body");
			
					const title = document.createElement('h5');
					title.append(list[i].title);
					title.setAttribute("class","card-header bg-warning mb-3");
					title.style.fontweight = 'bold';
					
					const addr = document.createElement('div');
					addr.append(list[i].addr1);

					const tel = document.createElement('div');
					tel.append(list[i].tel);
					
					const button = document.createElement('button');
					button.setAttribute("onclick", 'getAddress("'+list[i].addr1+'","'+list[i].title+'");')
					button.setAttribute("type","button");
					button.setAttribute("class","btn btn-warning");
					button.setAttribute("data-toggle","modal");
					button.setAttribute("data-target","#addrModal");
					button.append("지도보기")
					// 지도정보를 미리 불러온다음에 모달로 표현해도 될듯?
				    
					card.append(title);
					div.append(addr);
					div.append(tel);
					div.append(button);
					
					card.append(img);
					card.append(div);

					cardDeck.append(card);
					
					partylist.append(cardDeck)
					
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
				
				const cardDeck = document.createElement('div');
				cardDeck.setAttribute("class","col-sm-3 mb-3");
				cardDeck.style.wordBreak = 'break-all';
				
				const card = document.createElement('div');
				card.setAttribute("class","card border-warning");
				
				const img = document.createElement('img');
				img.setAttribute("class","card-img-top");
				img.setAttribute("alt","Card image cap");
				img.setAttribute("onerror","this.src='resources/img/noimage.png'");
				img.src = list[i].firstimage;
				img.style.witdh = "10em";
				img.style.height = "10em";
				
				const div = document.createElement('div');
				div.setAttribute("class","card-body");
		
				const title = document.createElement('h5');
				title.append(list[i].title);
				title.setAttribute("class","card-header bg-warning mb-3");
				title.style.fontweight = 'bold';
				
				const addr = document.createElement('div');
				addr.append(list[i].addr1);

				const tel = document.createElement('div');
				tel.append(list[i].tel);
				
				const button = document.createElement('button');
				button.setAttribute("onclick", 'getAddress("'+list[i].addr1+'","'+list[i].title+'");')
				button.setAttribute("type","button");
				button.setAttribute("class","btn btn-warning");
				button.setAttribute("data-toggle","modal");
				button.setAttribute("data-target","#addrModal");
				button.append("지도보기")
				
				card.append(title);
				div.append(addr);
				div.append(tel);
				div.append(button);
				
				card.append(img);
				card.append(div);

				cardDeck.append(card);
				
				partylist.append(cardDeck)
				
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

			$.ajax({
				url: "getProductAllList.do",
				method: "post",
				contentType : "application/json",
				dataType: "json",
				async:false,
				success:function(data) {
					const partylist = document.querySelector('#partylist');
					
					for (var i = 0; i < data.length; i++) {	
						
						const cardDeck = document.createElement('div');
						cardDeck.setAttribute("class","col-sm-3 mb-3");
						
						const card = document.createElement('div');
						card.setAttribute("class","card border-danger");
						
						const img = document.createElement('img');
						img.setAttribute("class","card-img-top");
						img.setAttribute("alt","Card image cap");
						img.setAttribute("onerror","this.src='resources/img/noimage.png'");
						img.src = data[i].thumbimg;
						img.style.witdh = "10em";
						img.style.height = "10em";
						
						const div = document.createElement('div');
						div.setAttribute("class","card-body");
				
						const title = document.createElement('h5');
						title.append(data[i].productname);
						title.setAttribute("class","card-header bg-danger mb-3");
						title.style.fontweight = 'bold';
						
						const addr = document.createElement('div');
						addr.append(data[i].address);

						const tel = document.createElement('div');
						tel.append(data[i].tellnumber);
						
						const button1 = document.createElement('button');
						button1.setAttribute("type","button");
						button1.setAttribute("class","btn btn-danger m-1");
						button1.append("자세히보기")
						button1.setAttribute("onclick","location.href='reservation.do?productseq="+data[i].productseq+"';");
						
						card.append(title);
						div.append(addr);
						div.append(tel);
						div.append(button1);
						
						card.append(img);
						card.append(div);

						cardDeck.append(card);
						
						partylist.append(cardDeck)
						
					}

				},
				error:function() {
					alert("실패")
				}
				})
	
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
				
				const cardDeck = document.createElement('div');
				cardDeck.setAttribute("class","col-sm-3 mb-3");
				
				const card = document.createElement('div');
				card.setAttribute("class","card border-danger");
				
				const img = document.createElement('img');
				img.setAttribute("class","card-img-top");
				img.setAttribute("alt","Card image cap");
				img.setAttribute("onerror","this.src='resources/img/noimage.png'");
				img.src = data[i].thumbimg;
				img.style.witdh = "10em";
				img.style.height = "10em";
				
				const div = document.createElement('div');
				div.setAttribute("class","card-body");
		
				const title = document.createElement('h5');
				title.append(data[i].productname);
				title.setAttribute("class","card-header bg-danger mb-3");
				title.style.fontweight = 'bold';
				
				const addr = document.createElement('div');
				addr.append(data[i].address);

				const tel = document.createElement('div');
				tel.append(data[i].tellnumber);

				const button1 = document.createElement('button');
				button1.setAttribute("type","button");
				button1.setAttribute("class","btn btn-danger m-1");
				button1.append("자세히보기")
				button1.setAttribute("onclick","location.href='reservation.do?productseq="+data[i].productseq+"';");
				
				card.append(title);
				div.append(addr);
				div.append(tel);
				div.append(button1);
				
				card.append(img);
				card.append(div);

				cardDeck.append(card);
				
				partylist.append(cardDeck)
				
			}
			

		},
		error:function() {
			alert("실패")
		}
		})
	
	
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
