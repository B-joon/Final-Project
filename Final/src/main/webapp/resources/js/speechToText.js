let recognition = null;
    function checkCompatibility() {
        recognition = new(window.SpeechRecognition || window.webkitSpeechRecognition)();
        recognition.lang = "ko";
        recognition.maxAlternatives = 5;

        if(!recognition) {
            alert("speech api를 사용하실 수 없습니다.");
        }
    }

    
	
    
    function startSpeechRecognition(){
        console.log('Start');

        recognition.addEventListener("speechstart", () => {
            console.log('Speech Start');
        });

        recognition.addEventListener("speechend", () => {
            console.log('Speech End');
        });
        recognition.addEventListener("result", (event) => {
            console.log('Speech Result', event.results);
            const text = event.results[0][0].transcript;
            document.getElementById("speech_result").value = text;
        });

        recognition.start();
        
        $("#speecharea").children().remove();
        $("#speecharea").append('<button type="button" class="btn btn-primary btn-sm" onclick="endSpeechRecognition()"><i class="fas fa-microphone-slash"></i></button>');
  
    }

    function endSpeechRecognition(){
        recognition.stop();
        
        $("#speecharea").children().remove();
        $("#speecharea").append('<button type="button" class="btn btn-primary btn-sm" onclick="startSpeechRecognition();"><i class="fas fa-microphone"></i></button>');
        
    }

    window.addEventListener('load', checkCompatibility)