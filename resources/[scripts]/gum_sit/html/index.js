var disableIt = false
$(document).keydown(function(e){
	var close = 27;
	var close2 = 8;
	switch (e.keyCode) {
		case close:
            disableIt = false
			$.post('http://gum_sit/exit')
        break;
        case close2:
            disableIt = false
            $.post('http://gum_sit/exit')
        break;
	}
});

$(function () {
    function sitMenuAnim(bool) {
        if (bool) {
            $("#sitMenu").show();
        } else {
            $("#sitMenu").hide();
        }
    }
    sitMenuAnim(false)
    $.post('http://gum_sit/screen', JSON.stringify({ x:window.screen.availWidth, y:window.screen.availHeight}))
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "sitMenu") {
            sitMenuAnim(true)
            loadInv(item.anims)
        }
        if (item.type === "openScenario") {
            sitMenuAnim(true)
            loadInterInv(item.scenarios)
        }
        if (item.type === "sitMenuClose") {
            if (item.status === false) {
                sitMenuAnim(false)
                disableIt = false
            }
        }
        if (item.type === "blockSimulate") {
            disableIt = true
        }
    })
    window.addEventListener('click', event => {
        if (disableIt == false) {
            $.post('http://gum_sit/simulateClick')
        }
    });
})

function loadInv(table_inv) {
    const tableBody = document.getElementById('sitMenuCont');
    let dataHtml = '';//
    for (var i in table_inv) {
        dataHtml += '<li class="item" onclick="playAnim(\''+table_inv[i].name+'\')"><a href="#"><div id="bottom-right">'+table_inv[i].text_print+'</div></a></div>'
    }
    tableBody.innerHTML = dataHtml
}
function loadInterInv(table_inv) {
    const tableBody = document.getElementById('sitMenuCont');
    let dataHtml = '';//
    for (var i in table_inv) {
        dataHtml += '<li class="item" onclick="playAnimInteract(\''+table_inv[i].hash+'\')"><a href="#"><div id="bottom-right">'+table_inv[i].text_print+'</div></a></div>'
    }
    tableBody.innerHTML = dataHtml
}
function playAnimInteract(hash) {
    $.post('http://gum_sit/playAnimInteract', JSON.stringify({hash:hash}));
}

function playAnim(anim) {
    $.post('http://gum_sit/playAnim', JSON.stringify({anim:anim}));
}