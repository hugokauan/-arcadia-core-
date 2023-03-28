$(function(){
    window.onload = function(e) {
        window.addEventListener("message", (event) => {
            var item = event.data;
            //var saldo = document.getElementById("saldo");
            //saldo.innerHTML = "R$ " +  item.valor;
            if (item !== undefined && item.type === "ui"){
                if(item.display === false){
                    $('.bancomain').hide();
                }
                else{
                    $('.bancomain').show();
                }
            }
            $('#bancobotaosaldo').click(function () { 
                $('#bancobotaosaque').fadeOut(); 
                //$('#bancobotaosaque').hide();
                $('#bancobotaodeposito').fadeOut();
                //$('#bancobotaodeposito').hide();
                document.getElementById("saldo").innerHTML = "R$ " + item.valor;
                $.post("https://ARCADIABANK/saldo",JSON.stringify({}));
                $('#saldo').fadeIn();
            });
            $('#bancobotaosaque').click(function () { 
                $('#bancoinputsaque').fadeIn();
                $('#submitbuttonsaque').fadeIn();
                $('#submitbuttonsaque').click(function(){
                    let inputvalue = $("#bancoinputsaque").val();
                    $.post("https://ARCADIABANK/sacar",JSON.stringify({
                        valorsaque: inputvalue
                    }));
                })
                $('#bancobotaosaldo').fadeOut(); 
                //$('#bancobotaosaldo').hide();
                $('#bancobotaodeposito').fadeOut();
                //$('#bancobotaodeposito').hide();
            });
            $('#bancobotaodeposito').click(function () {  
                $('#bancoinputdeposito').fadeIn();
                $('#submitbuttondeposito').fadeIn();
                $('#submitbuttondeposito').click(function(){
                    let inputvalue = $("#bancoinputdeposito").val();
                    $.post("https://ARCADIABANK/deposito",JSON.stringify({
                        valordeposito: inputvalue
                    }));
                })
                $('#bancobotaosaldo').fadeOut();
                //$('#bancobotaosaldo').hide();
                $('#bancobotaosaque').fadeOut();
                //$('#bancobotaosaque').hide();
            });
            $("#nuioffbutton").click(function(){
                $.post("https://ARCADIABANK/sair",JSON.stringify({}));
            })
            $("#nuihomebutton").click(function(){
                $('#submitbuttonsaque').fadeOut();
                $('#submitbuttondeposito').fadeOut();
                $('#bancoinputdeposito').fadeOut();
                $('#bancoinputsaque').fadeOut();
                $('#saldo').fadeOut();
                $('#bancobotaosaldo').fadeIn();
                $('#bancobotaosaque').fadeIn();
                $('#bancobotaodeposito').fadeIn();
            })
        })
    }
})