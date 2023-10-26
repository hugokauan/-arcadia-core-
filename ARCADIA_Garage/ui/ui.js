$(function(){
    window.onload = function(e) {
        window.addEventListener("message", (event) => {
            var item = event.data;
            if (item !== undefined && item.type === "GarageUI" || item.type === "sendCars"){
                if(item.display === false){
                    $('.maindiv').fadeOut();
                }else{
                    $('.maindiv').fadeIn();
                }
                $('#carsB').click(function(){
                    $('.maindiv').fadeOut();
                    $('.carsdiv').fadeIn();

                    $.each(item.carros,function(index,element){
                        var button = $('<button>').text('Button ' + (index + 1));
                        button.appendTo('div');
                        document.getElementById("carros").innerHTML = element;
                    });
                    
                });
                $('#X').click(function()
                {
                    $('.maindiv').fadeOut();
                    $('.carsdiv').fadeOut();
                    $.post("https://ARCADIA_Garage/close",JSON.stringify({
                    }));
                });
                $('#X2').click(function()
                {
                    $('.maindiv').fadeOut();
                    $('.carsdiv').fadeOut();
                    $.post("https://ARCADIA_Garage/close",JSON.stringify({
                    }));
                });
            }
        })
    }
}
)