const contextMenu = document.getElementById("context-menu");
const scope = document.querySelector("body");
var animals = []
var city = ""
var enableTax = false
var myMoney = 0
var myInventory = {}
var labelList = {}
var storeId = 0
var removeChange = ""
var inContext  = false
var payment = 0
var prepayed = 0
var ifOwner = false
$(document).keydown(function(e) {
    var close = 27;
    var close2 = 8;
    switch (e.keyCode) {
        case close:
            $("#container").hide();
            $.post('http://gum_search/close');
            break;
        case close2:
            $("#container").hide();
            $.post('http://gum_search/close');
            break;
    }
});
$(function() {
    function containerOpen(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    containerOpen(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "open"){
            containerOpen(true)
            containerLoad(item.inventory, item.money, item.gold)
        }
        if (item.type === "close"){
            containerOpen(false)
        }
    })
})

function containerLoad(inventory, money, gold) {
    const tableBody = document.getElementById('itemInformation');
    let dataHtml = '';
    let num = money
    let n = num.toFixed(2);
    let gnum = gold
    let g = gnum.toFixed(2);
    dataHtml += '<div class="buttonItem" onmouseout="cleanMe()" onmouseover="rename(\''+"Peníze"+'\')" id="itemIdMoney" onClick="transferMoney(\''+n+'\')"><div id="text">'+n+'</div></div>'
    dataHtml += '<div class="buttonItem" onmouseout="cleanMe()" onmouseover="rename(\''+"Zlato"+'\')" id="itemIdGold" onClick="transferGold(\''+g+'\')"><div id="text">'+g+'</div></div>'

    for (var b in inventory) {
        if (inventory[b].weapon == false) {
            dataHtml += '<div class="buttonItem" onmouseout="cleanMe()" onmouseover="rename(\''+inventory[b].label+'\')" id="itemId'+b+'" onClick="transferItem(\''+inventory[b].id+'\',\''+inventory[b].count+'\',\''+inventory[b].item+'\')"><div id="text">'+inventory[b].count+'</div></div>'
        }
    }
    for (var b in inventory) {
        if (inventory[b].weapon == true) {
            dataHtml += '<div class="buttonItem" onmouseout="cleanMe()" onmouseover="rename(\''+inventory[b].label+'\')" id="itemId'+b+'" onClick="transferWeapon(\''+inventory[b].id+'\')"></div>'
        }
    }
    tableBody.innerHTML = dataHtml
    for (var b in inventory) {
        document.getElementById("itemId"+b+"").style.backgroundImage = "url('nui://gum_inventory/html/images/items/"+inventory[b].item+".png')";
        document.getElementById("itemId"+b+"").style.backgroundSize = "100% 100%";
    }
    document.getElementById("itemIdMoney").style.backgroundImage = "url('nui://gum_inventory/html/images/items/money.png')";
    document.getElementById("itemIdMoney").style.backgroundSize = "100% 100%";

    document.getElementById("itemIdGold").style.backgroundImage = "url('nui://gum_inventory/html/images/items/gold.png')";
    document.getElementById("itemIdGold").style.backgroundSize = "100% 100%";
}

function transferMoney(count) {
    $.post('http://gum_search/transferMoney', JSON.stringify({
        count: count
    }));
}

function transferGold(count) {
    $.post('http://gum_search/transferGold', JSON.stringify({
        count: count
    }));
}

function transferItem(id, count, item) {
    $.post('http://gum_search/transferItem', JSON.stringify({
        id: id,
        count: count,
        item: item,
        weapon: false
    }));
}

function transferWeapon(id) {
    $.post('http://gum_search/transferItem', JSON.stringify({
        id: id,
        weapon: true
    }));
}

function cleanMe() {
    document.getElementById("itemLabel").innerHTML = "";
}

function rename(text) {
    document.getElementById("itemLabel").innerHTML = text;
}