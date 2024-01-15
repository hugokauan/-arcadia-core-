$(function(){
    window.onload = function(e) {
        window.addEventListener("message", (event) => {
            var item = event.data;
            $('.id').hide();
            if (item !== undefined && item.type === "ui"){
                if(item.display === false){
                    $('.id').fadeOut();
                }
                else{
                    $('.id').fadeIn();
                    document.getElementById("passaporte").innerHTML = "N° Passaporte:   "+item.id;
                    document.getElementById("nome").innerHTML = "Nome:   "+item.nome;
                    document.getElementById("sobrenome").innerHTML = "Sobrenome:   "+item.sobrenome;
                    document.getElementById("job").innerHTML = "Profissão:   "+item.job;
                    document.getElementById("cargo").innerHTML = "Cargo:   "+item.cargo;
                }
            }
        }
    )}
})