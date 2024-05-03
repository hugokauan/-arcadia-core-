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
        })
    }
}
)



// script.js
document.getElementById("menu-toggle").addEventListener("click", function() {
    var menuItems = document.getElementById("menu-items");
    menuItems.classList.toggle("open");
});