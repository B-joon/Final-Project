const streamingseq = searchParam('streamingseq');
console.log(streamingseq)
const streamingname = searchParam('streamingname');
const userid = searchParam('userid');
const name = searchParam('name');

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
  onStat(result) { console.log(`EVENT FIRED: onStat: ${result}`); }
};

remon = new Remon({ config, listener });

$('#mystop').click(function(){
  remon.close();
});

$('#mystart').click(function(){
  remon.joinCast(streamingseq+streamingname);
});
