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

io.on('connection', (socket) => {   //연결이 들어오면 실행되는 이벤트
    // socket 변수에는 실행 시점에 연결한 상대와 연결된 소켓의 객체가 들어있다.
    //socket.emit으로 현재 연결한 상대에게 신호를 보낼 수 있다.
	// 기본적으로 채팅방 하나에 접속시켜준다.
	socket.on('roomname', (roomname) => {
		socket.join(roomname);
	});

    // on 함수로 이벤트를 정의해 신호를 수신할 수 있다.
    socket.on('message', (msg, roomname, name) => {
        //msg에는 클라이언트에서 전송한 매개변수가 들어온다. 이러한 매개변수의 수에는 제한이 없다.
        console.log('Message received: ' + roomname + "-" + name + " : " + msg);
		

        // io.emit으로 연결된 모든 소켓들에 신호를 보낼 수 있다.
        // io.emit('message', msg);
		// io.to(방이름).emit으로 특정 방의 소켓들에게 신호를 보낼 수 있다.
		io.to(roomname).emit('message', msg);
    });

	socket.on('joinRoom', (roomname, roomJoin) => {
		socket.join(roomJoin);	// 들어갈 룸에 들어간다.
		socket.leave(roomname);		// 기존의 룸을 나가고

		
		console.log(roomname + "나갔다");
		console.log(roomJoin + "들어왔다");
		
		// 룸을 성공적으로 전환했다는 신호 발송
		socket.emit('roomChanged', roomJoin);
	});
});


// http는 3000번 포트를 사용한다.
http.listen(3000, function() {
	// 콘솔창에 출력
	console.log('listening on *:3000');
});