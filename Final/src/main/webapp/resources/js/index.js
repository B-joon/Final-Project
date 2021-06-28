

$(function(){

	getPartyList();
	
})

function getPartyList() {
	
	$("#partylist").children().remove();
	
	var area = document.getElementsByName("partyareaCode")[0];
	var idx = area.selectedIndex;
	var areaCode = area.options[idx].value;
	console.log(areaCode)
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
		queryParams += '&' + encodeURIComponent('areaCode') + '=' + encodeURIComponent(areaCode); /**/
		queryParams += '&' + encodeURIComponent('_type=json');
		
		return queryParams;
	}
	
	$.ajax({
		
		url: url+getParams(),
		method: 'get',
		dataType: 'json',
		success:function(data) {
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

function getProductList() {
	
	$("#partylist").children().remove();
	
	var area = document.getElementsByName("productareaCode")[0];
	var idx = area.selectedIndex;
	var areaCode = area.options[idx].value;
	
	$.ajax({
		url: "getProductList.do?areaCode="+areaCode,
		method: "post",
		contentType : "application/json",
		dataType: "json",
		success:function(data) {
			console.log(data)
			console.log("예매하기");
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
				const button = document.createElement('input');
				button.setAttribute("type","button");
				button.setAttribute("value","예매하기");
				button.setAttribute("onclick","location.href='reservation.do?productseq="+data[i].productseq+"'");

				div.append(productname);
				div.append(address);
				div.append(img);
				div.append(productcontent);
				div.append(tellnumber);
				div.append(button);

				partylist.append(div);
				
			}
			

		},
		error:function() {
			alert("실패")
		}
		})
	
	
}