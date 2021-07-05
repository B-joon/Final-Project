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
    local: '#localVideo'
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
  onStat(result) { console.log(`EVENT FIRED: onStat: ${result}`); }
};

remon = new Remon({ config, listener });

$('#mystop').click(function(){
  remon.close();
});

$('#mystart').click(function(){
  // createCast의 인자는 방송채널의 ID입니다. 실제 서비스에서는 동일한 방송채널의 ID가 아닌, 고유하고 예측이 어려운 ID를 사용해야합니다.
  remon.createCast(streamingseq+streamingname);
});