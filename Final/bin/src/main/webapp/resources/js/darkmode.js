function dayAndNight(self){
    if(self.value == "다크모드"){
        document.querySelector("body").style.color="#BB86FC";
        document.querySelector("body").style.backgroundColor="#262626";
        self.value="라이트모드";
        var aTag = document.querySelectorAll("a");
        for(var i=0; i<aTag.length;i++){
            aTag[i].style.color = "powderblue";
        }
    }else{
        document.querySelector("body").style.color="black";
        document.querySelector("body").style.backgroundColor="white";
        self.value="다크모드";
        var aTag = document.querySelectorAll("a");
        for(var i=0; i<aTag.length;i++){
            aTag[i].style.color = "white";
    }
}
}