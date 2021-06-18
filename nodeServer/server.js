// app이라는 변수에 express를 담아줌
var app = require('express')();
// http 변수에 http를 담아두고 Server함수에 app을 담아줌
var http = require('http').Server(app);
var io = require('socket.io')(http, {cors: {origin:"*"}});

// 페이지를 get으로 요청 했을때
app.get('/', function(req, res) {
	// 아래와 같은 메시지를 출력
	res.send('<h1>안녕하세요 "/" 경로입니다.</h1>');
});

io.on('connection', function(socket) {
	console.log('한명의 유저가 접속을 했습니다.');
	socket.on('disconnect', function() {
		console.log('한명의 유저가 접속해제를 했습니다.');
	});
	
	socket.on('send_msg', function(msg) {
		// 콘솔로 출력을 한다.
		console.log(msg);
		// 다시, 소켓을 통해 이벤트를 전송한다.
		io.emit('send_msg', msg);
	});
});

// http는 3000번 포트를 사용한다.
http.listen(3000, function() {
	// 콘솔창에 출력
	console.log('listening on *:3000');
});