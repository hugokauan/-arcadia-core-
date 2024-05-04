$(function(){
    window.onload = function(e) {
        window.addEventListener("message", (event) => {
            var item = event.data;
            if (item !== undefined && item.type === "ui"){
                if(item.display === true){
                    $('.tablet').show();
                }
                else{
                    $('.tablet').hide();
                }
            }
            var storeItems = document.querySelectorAll('.store-item');
            storeItems.forEach(function(item) {
                item.addEventListener('click', function(event) {
                    event.preventDefault(); // Prevenir comportamento padrão do link
                    var itemName = this.dataset.name;
                    var itemPrice = this.dataset.price;
                    //alert('Você clicou em ' + itemName + '. Preço: ' + itemPrice);
                    $.post("https://ARCADIAPOLICIA/ARCADIA:entregarArmas",JSON.stringify({
                        itemName: itemName
                    }));
                });
            });
        })
    }
}
)



// script.js
/*document.getElementById("menu-toggle").addEventListener("click", function() {
    var menuItems = document.getElementById("menu-items");
    menuItems.classList.toggle("open");
});*/

document.getElementById("action-button").addEventListener("click", function() {
    $('.tablet').hide();
    $.post("https://ARCADIAPOLICIA/ARCADIA:SAIR",JSON.stringify({}));
});