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
    }

    function endSpeechRecognition(){
        recognition.stop();
    }

    window.addEventListener('load', checkCompatibility)