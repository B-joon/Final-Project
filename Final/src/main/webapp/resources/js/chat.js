	var roomname = document.getElementById("selectRoom").innerHTML;
    var socket = io("http://localhost:3000");
    var msgform = document.getElementById('msgform');
    // socket.on 함수로 서버에서 전달하는 신호를 수신
     // 메시지 수신시 HTML에 메시지 내용 작성
    socket.on('message', (msg) => {
        var messageList = document.getElementById('messages');
        var messageTag = document.createElement("li");
        messageTag.innerText = msg;
        messageList.appendChild(messageTag);
    });

	socket.emit('roomname', roomname);

    msgform.onsubmit = (e) => {
        e.preventDefault();
        var msginput = document.getElementById('msginput');

        // socket.emit으로 서버에 신호를 전달
        socket.emit('message', msginput.value, roomname);

        msginput.value = "";
    };

    function joinRoom(name) {	// 방 점속 버튼 클릭시
		// 해당 룸
		var roomJoin = name.innerHTML;
		console.log(roomJoin);
       	
       	// 서버에 룸 전환 신호를 발신
       	socket.emit('joinRoom', roomname, roomJoin);
    }