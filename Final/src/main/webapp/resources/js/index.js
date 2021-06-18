$(function(){

	getPartyList();
	
})


function getPartyList() {
	
	var area = document.getElementsByName("areaCode")[0];
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
