$(function() {
    function display2(bool) {
        if (bool) {
            $("#container").fadeIn(100);
        } else {
            $("#container").fadeOut(200);
        }
    }

    display2(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "notify") {
            if (item.status == true) {
                setTimeout(function(){ 
                    document.getElementById("title_text").innerHTML = item.title;
                    document.getElementById("text_system").innerHTML = item.text;
                    document.getElementById("iconimage").style.backgroundImage = "url('nui://gum_inventory/html/images/items/"+item.id+".png')";
                    display2(true)
                }, 400);
            } else {
                display2(false)
            }
        }

    })

})

