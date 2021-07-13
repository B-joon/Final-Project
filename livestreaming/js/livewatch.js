const streamingseq = searchParam('streamingseq');
console.log(streamingseq)
const streamingname = searchParam('streamingname');
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
    remote: '#remoteVideo'
  },
  media: {
    recvonly: true,
    audio: false,
    video: false
  }
};

const listener = {
  onCreate(chid) { console.log(`EVENT FIRED: onCreate: ${chid}`); },
  onJoin(chid) { console.log(`EVENT FIRED: onJoin: ${chid}`); $('#mystart').prop( "disabled", true ); $('#mystop').prop( "disabled", false ); },
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
  remon.joinCast(streamingseq);
});

function sendMessage(outmsg) {

    const name = searchParam('name');

    // if (nameInput.value) {
    //     name = nameInput.value;
    // }

    // if (summernote.value){
    //     msg = summernote.value;
    //     summernote.value="";

        

    // }else{
    //     if (!outmsg) {}outmsg = "Test Message";
    // }
    // console.log("msg : " + msg)

        console.log(outmsg)

    remon.sendMessage(name + '-' + outmsg);
    addMesssage(true, outmsg);
}

function addMesssage(isMine, msg) {

  const msgsplit = msg.split('-');
  const sender = msgsplit[0];
  const outmsg = msgsplit[1];


  const name = searchParam('name');

  const chatarea = document.getElementById("chatarea");

  var media = document.createElement("div");
  media.setAttribute("class","media m-2 border border-info rounded");

  var mediaBody = document.createElement("div");
  mediaBody.setAttribute("class","media-body");

  var Username = document.createElement("h5");
  Username.setAttribute("class","mt-0");
  Username.innerHTML = isMine ? name : sender;

  outmsg = outmsg.replace(/<(\/?)p>/gi, '');
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