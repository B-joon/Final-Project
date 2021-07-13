const streamingseq = searchParam('streamingseq');
console.log(streamingseq)
const streamingname = searchParam('streamingname');
console.log(streamingname)
const userid = searchParam('userid');
const name = searchParam('name');

$(function(){

  $("#streamingname").append(streamingname);

});

function searchParam(key) {
    return new URLSearchParams(location.search).get(key);
  };

let remon;

const config = {
  credential: {
    serviceId: 'b1e3ea11-e8d3-401b-944b-74fc4e62b0fc',
    key: '4232867ea2108f40d079171ae49f9c501c723362e0940e021951f8ae121b468a'
  },
  view: {
    local: '#localVideo'
  },
  media: {
    audio: true,
    video: true
  }
};

const listener = {
  onCreate(chid) { console.log(`EVENT FIRED: onCreate: ${chid}`); $('#mystart').prop( "disabled", true ); $('#mystop').prop( "disabled", false ); },
  onJoin(chid) { console.log(`EVENT FIRED: onJoin: ${chid}`); },
  onClose() { 
    console.log('EVENT FIRED: onClose'); 
    $('#mystart').prop( "disabled", false ); 
    $('#mystop').prop( "disabled", true ); 
    remon.close();
    remon = new Remon({ config, listener });
  },
  onError(error) { console.log(`EVENT FIRED: onError: ${error}`); },
  onStat(result) { console.log(`EVENT FIRED: onStat: ${result}`); },
  onMessage(msg) {
    var outmsg = msg.replace(/<(\/?)p>/gi, '');
        console.log(outmsg)
    addMesssage(false, outmsg);
}
};

remon = new Remon({ config, listener });

$('#mystop').click(function(){
  remon.close();
});

$('#mystart').click(function(){
  // createCast의 인자는 방송채널의 ID입니다. 실제 서비스에서는 동일한 방송채널의 ID가 아닌, 고유하고 예측이 어려운 ID를 사용해야합니다.
  remon.createCast(streamingseq);
});

function sendMessage() {

    const name = searchParam('name');

    // if (nameInput.value) {
    //     name = nameInput.value;
    // }

    if (summernote.value){
      msg = summernote.value;
      summernote.value="";

      

    }else{
        if (!outmsg) {}outmsg = "Test Message";
    }
    console.log("msg : " + msg)
    var outmsg = msg.replace(/<(\/?)p>/gi, '');
      console.log(outmsg)

    remon.sendMessage(name + '-' + outmsg);
    addMesssage(true, outmsg);
}

function addMesssage(isMine, msg) {

    const name = searchParam('name');

    const chatarea = document.getElementById("chatarea");

    var media = document.createElement("div");
    media.setAttribute("class","media m-2 border border-info rounded");

    var mediaBody = document.createElement("div");
    mediaBody.setAttribute("class","media-body");

    var Username = document.createElement("h5");
    Username.setAttribute("class","mt-0");
    Username.innerHTML = isMine ? name : msg.split('-')[0];

    var outmsg = msg.replace(/<(\/?)p>/gi, '');
    outmsg = outmsg.replace('<br>', '');
    // console.log(outmsg)
    var content = document.createElement("p");
    content.innerHTML = outmsg;
    console.log(content)

    mediaBody.append(Username);
    mediaBody.append(content);
    media.append(mediaBody);

    chatarea.appendChild(media);

    if (isMine) Username.setAttribute("class","mt-0 text-info");

    const $messageTextBox = $('#chatarea'); 
    $messageTextBox.scrollTop($messageTextBox[0].scrollHeight);

    // msgItem.innerHTML = isMine ? "Me : " + msg : msg.split('-')[0] + " : " + msg.split('-')[1];
    
}