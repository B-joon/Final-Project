$(function(){
	getWeather();
})

function getCity(name) {
	return 'http://api.openweathermap.org/data/2.5/weather?q=' + name
			+ '&lang=kr' + '&appid=9ba126a5c7dd531b326056c2482af0b1&units=metric';
}

let cityName = new Array('Seoul', 'Gyeonggi-do', 'Daejeon', 'Pohang', 'Daegu',
		'Jeonju', 'Busan', 'Jeju City', 'Ulsan', 'Mokpo', 'Yeosu', 'Gwangju',
		'Andong', 'Cheongju-si', 'Gangneung', 'Chuncheon');

// var key =
// 'http://api.openweathermap.org/data/2.5/weather?q=Ulsan&appid=9ba126a5c7dd531b326056c2482af0b1&units=metric';

// for문 안에서 var를 사용하면 전역변수로 선언된다 그래서 let i로 변경

function getWeather() {

	const weatherarea = document.getElementById("weatherarea");
	const ul = document.createElement("ul");
	ul.setAttribute("id", "roller");
	ul.setAttribute("class", "form-control");

for (let i = 0; i < cityName.length; i++) {

	$.getJSON(getCity(cityName[i]), function(result) {
		
		var li = document.createElement("li");
		
		var weather = document.createElement("span");
		weather.innerHTML = weatherIcon(result.weather[0].icon);
		
		var temp = document.createElement("span");
		temp.style.fontWeight = 'bold';
		temp.append(result.main.temp + '℃  ' + result.weather[0].description);
		
		var stick = document.createElement("i");
		stick.append("/");
		
		var temp_min = document.createElement("span");
		temp_min.style.color = 'blue';
		temp_min.append(result.main.temp_min + '℃');
		
		var temp_max = document.createElement("span");
		temp_max.style.color = 'red';
		temp_max.append(result.main.temp_max + '℃');
		
		var cityname = document.createElement("span");
		cityname.style.fontWeight = 'bold';
		cityname.append(getKorean(result.name));
		
		li.append(weather)
		li.append(temp)
		li.append(stick)
		li.append(temp_min)
		li.append(stick)
		li.append(temp_max)
		li.append(cityname)
		ul.append(li)
		
		console.log(result)
		
	});
	
}

weatherarea.append(ul)

startRolling()

}

function startRolling() {

	function tick() {
		$('#roller li:first').fadeOut(function() {
			$(this).appendTo($('#roller')).fadeIn(100);
			// li 첫번째 요소를 fadeOut 처리뒤에 li 요소 마지막으로 붙이고 fadeIn
		});
	}

	setInterval(function() {
		tick()
	}, 3000);
	
	
}

function weatherIcon(icon) {
	var iconTag;
	switch(icon) {
	
	case "01d":
		iconTag = "<i class='fas fa-sun'></i>";
		break;
	case "01n":
		iconTag = "<i class='fas fa-moon'></i>";
		break;
	case "02d":
		iconTag = "<i class='fas fa-cloud-sun'></i>";
		break;
	case "02n":
		iconTag = "<i class='fas fa-cloud-moon'></i>";
		break;
	case "03d":
		iconTag = "<i class='fas fa-cloud'></i>";
		break;
	case "03n":
		iconTag = "<i class='fas fa-cloud'></i>";
		break;
	case "04d":
		iconTag = "<i class='fas fa-cloud' style='color:black;'></i>";
		break;
	case "04n":
		iconTag = "<i class='fas fa-cloud' style='color:black;'></i>";
		break;
	case "09d":
		iconTag = "<i class='fas fa-cloud-rain'></i>";
		break;
	case "09n":
		iconTag = "<i class='fas fa-cloud-rain'></i>";
		break;
	case "10d":
		iconTag = "<i class='fas fa-cloud-sun-rain'></i>";
		break;
	case "10n":
		iconTag = "<i class='fas fa-cloud-moon-rain'></i>";
		break;
	case "11d":
		iconTag = "<i class='fas fa-bolt'></i>";
		break;
	case "11n":
		iconTag = "<i class='fas fa-bolt'></i>";
		break;
	case "13d":
		iconTag = "<i class='fas fa-snowflake'></i>";
		break;
	case "13n":
		iconTag = "<i class='fas fa-snowflake'></i>";
		break;
	case "50d":
		iconTag = "<i class='fas fa-smog'></i>";
		break;
	case "50n":
		iconTag = "<i class='fas fa-smog'></i>";
		break;	
	
	}
	
	return iconTag;
}

function getKorean(cityname) {
	
	var res;
	
	switch (cityname) {
	case 'Seoul':
		res = "서울";
		break;
	case 'Gyeonggi-do':
		res = "경기";
		break;
	case 'Daejeon':
		res = "대전";
		break;
	case 'Pohang':
		res = "포항";
		break;
	case 'Daegu':
		res = "대구";
		break;
	case 'Jeonju':
		res = "전주";
		break;
	case 'Busan':
		res = "부산";
		break;
	case 'Jeju City':
		res = "제주";
		break;
	case 'Ulsan':
		res = "울산";
		break;
	case 'Mokpo':
		res = "목포";
		break;
	case 'Yeosu':
		res = "여수";
		break;
	case 'Gwangju':
		res = "광주";
		break;
	case 'Andong':
		res = "안동";
		break;
	case 'Cheongju-si':
		res = "청주";
		break;
	case 'Gangneung':
		res = "강릉";
		break;
	case 'Chuncheon':
		res = "춘천";
		break;
	}
	
	
	return res;
}


