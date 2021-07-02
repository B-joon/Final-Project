<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="./common.jsp" %>
 <div>
        <ul id="roller" class="roller">
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span><span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>

                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
            <li>
                <span class="loc" style="font-weight: bold;"></span><span class="icon"></span>

                <span class="ctemp">현재온도:</span> <span class="lowtemp">최저 온도:</span> <span class="hightemp">최고
                    온도:</span>
            </li>
        </ul>

    </div>

</body>
<style>

        .body {
            width: 100%;
            height: 100%;
        }

        .roller {
            height: 50px;
            overflow: hidden;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .roller li {
            height: 50px;
            padding: 0px;
            margin: 0px 100px;
        }
    </style>
    <script>
        function getCity(name) {
            return 'http://api.openweathermap.org/data/2.5/weather?q=' + name + '&appid=9ba126a5c7dd531b326056c2482af0b1&units=metric';
        }

        let cityName = new Array('Seoul', 'Gyeonggi-do', 'Daejeon', 'Pohang', 'Daegu', 'Jeonju', 'Busan', 'Jeju City',
            'Ulsan', 'Mokpo', 'Yeosu', 'Gwangju', 'Andong', 'Cheongju-si', 'Gangneung', 'Chuncheon');


        //var key = 'http://api.openweathermap.org/data/2.5/weather?q=Ulsan&appid=9ba126a5c7dd531b326056c2482af0b1&units=metric';


        //for문 안에서 var를 사용하면 전역변수로 선언된다 그래서 let i로 변경 
        for (let i = 0; i < cityName.length; i++) {

            $.getJSON(getCity(cityName[i]),
                function (result) {
                    $('.loc').eq(i).html(result.name);
                    $('.ctemp').eq(i).append(result.main.temp);
                    $('.lowtemp').eq(i).append(result.main.temp_min);
                    $('.hightemp').eq(i).append(result.main.temp_max);
                    let iconUrl = '<img src="./image/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">'
                    $('.icon').eq(i).html(iconUrl);


                });

            //city name [Seoul,Daejeon,Pohang,Daegu,Jeonju,Busan,Jeju City,Chuncheon,Gangneung,Cheongju-si,Andong,Gwangju,Yeosu,Mokpo,Suwon,Ulsan]

        }


        function tick() {
            $('#roller li:first').fadeOut(function () {
                $(this).appendTo($('#roller')).fadeIn(100);
                // li 첫번째 요소를 fadeOut 처리뒤에 li 요소 마지막으로 붙이고 fadeIn 
            });
        }
        setInterval(function () { tick() }, 3000);


    </script>
</html>