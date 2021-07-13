function dayAndNight(self){
	console.log(self.innerHTML)
	var button = document.querySelector("#darkbtn");
    if(self.innerHTML == "다크모드"){
        document.querySelector("body").style.color="#BB86FC";
        document.querySelector("body").style.backgroundColor="#262626";
		
	
        self.innerHTML = "라이트모드";
        var aTag = document.querySelectorAll("a");
        for(var i=0; i<aTag.length;i++){
            aTag[i].style.color = "black";
        }
        button.setAttribute("class","btn btn-outline-light bg-gray")
        
    }else{
        document.querySelector("body").style.color="black";
        document.querySelector("body").style.backgroundColor="white";
		
	
        self.innerHTML = "다크모드";
        var aTag = document.querySelectorAll("a");
        for(var i=0; i<aTag.length;i++){
            aTag[i].style.color = "black";
        
        button.setAttribute("class","btn btn-outline-secondary")
    }
}
}