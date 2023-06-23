$(function(){
    window.onload = function(e) {
        window.addEventListener("message", (event) => {
            var item = event.data;
            if (item !== undefined && item.type === "GarageUI"){
                if(item.display === false){
                    $('.maindiv').fadeOut();
                }else{
                    $('.maindiv').fadeIn();
                }
                $('#carsB').click(function(){
                    $('.maindiv').fadeOut();
                    $('.carsdiv').fadeIn();
                })
                $('#X').click(function()
                {
                    $('.maindiv').fadeOut();
                    $('.carsdiv').fadeOut();
                    $.post("https://ARCADIA_Garage/close",JSON.stringify({
                    }));
                }
                )
                $('#X2').click(function()
                {
                    $('.maindiv').fadeOut();
                    $('.carsdiv').fadeOut();
                    $.post("https://ARCADIA_Garage/close",JSON.stringify({
                    }));
                }
                )
            }
        })
    }
}
)