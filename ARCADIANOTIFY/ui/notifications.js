$(function(){
    window.onload = function(e) {
        window.addEventListener("message", (event) => {
            var item = event.data;
                if (item !== undefined && item.type === "notify"){
                    if (item.display === true) {
                        document.getElementById("notify").innerHTML = item.message;
                        $('.notifymain').fadeIn();
                    } 
                    else{
                        $('.notifymain').fadeOut();
                    }  
            }
        })
    }
})