var playerCount = 0
var ticketTable = []
var itemList = []
var playerList = []
var activeId = 0
$(function() {
    function display(bool) {
        if (bool) {
            $("#container").fadeIn(100);
        } else {
            $('#buttonContainerTicket').hide();
            $("#buttonContainerText").hide();
            $("#buttonContainerPlayer").hide();
            $("#buttonContainerItem").hide();
            $("#container").fadeOut(200);
        }
    }
    display(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "cc") {
            var text = Number(item.x)+","+Number(item.y)+","+Number(item.z);
            var node = document.createElement('textarea');
            var selection = document.getSelection();
      
            node.textContent = text;
            document.body.appendChild(node);
      
            selection.removeAllRanges();
            node.select();
            document.execCommand('copy');
      
            selection.removeAllRanges();
            document.body.removeChild(node);
        }
        if (item.type === "cch") {
            var text = Number(item.x)+","+Number(item.y)+","+Number(item.z)+","+Number(item.h);
            var node = document.createElement('textarea');
            var selection = document.getSelection();
      
            node.textContent = text;
            document.body.appendChild(node);
      
            selection.removeAllRanges();
            node.select();
            document.execCommand('copy');
      
            selection.removeAllRanges();
            document.body.removeChild(node);
        }


        if (item.type === "openAdm") {
            if (item.status == true) {
                display(true)
                ticketTable=item.report
                playerList=item.player
                itemList=item.item
                permission=item.perms
                admin=item.admin

                const mainBody = document.getElementById('button_container');
                let dataHtmlBody = '';
                for (var a in permission) {
                    if (a == admin) {
                        var allPerms = permission[a]
                            for (var b in allPerms) {
                            if (b == "supportSys" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="openTicket()"><div id="textBase">Support system</div></div>'
                            }}
                            for (var b in allPerms) {
                            if (b == "playerList" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="openPlayer()"><div id="textBase">Player list</div></div>'
                            }}
                            for (var b in allPerms) {
                            if (b == "itemList" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="openItem()"><div id="textBase">Item list</div></div>'
                            }}
                        	 for (var b in allPerms) {
                            if (b == "noClip" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(1)"><div id="textBase">No clip</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "tpw" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(2)"><div id="textBase">Teleport on waypoint</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "tpc" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(3)"><div id="textBase">Teleport on coords</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "tpb" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(4)"><div id="textBase">Teleport back</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "teleportPlayer" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(20)"><div id="textBase">Teleport on player</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "bringPlayer" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(21)"><div id="textBase">Bring player</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "spectate" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(24)"><div id="textBase">Spectate player</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "giveItem" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(7)"><div id="textBase">Give item on ID</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "giveWeapon" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(8)"><div id="textBase">Give weapon on ID</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "giveMoney" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(9)"><div id="textBase">Give money on ID</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "giveGold" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(10)"><div id="textBase">Give gold on ID</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "changePed" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(12)"><div id="textBase">Change to ped</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "allowlist" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(13)"><div id="textBase">Add to allowlist</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "setChar" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(14)"><div id="textBase">Set character count</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "setGroup" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(15)"><div id="textBase">Set player group</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "setJob" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(16)"><div id="textBase">Set player job</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "kickPlayer" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(17)"><div id="textBase">Kick player</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "banPlayer" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(18)"><div id="textBase">Ban player</div></div>'
                            }}
                            for (var b in allPerms) {
                                if (b == "delChar" && allPerms[b] == true) {
                                dataHtmlBody += '<div id="button" onclick="actionMenu(19)"><div id="textBase">Delete character</div></div>'
                            }}
                    }
               }
               mainBody.innerHTML = dataHtmlBody
            } else {
                display(false)
            }
        }
    })
})

$(document).keydown(function(e) {
    var close1 = 27;
    var close2 = 8;
    switch (e.keyCode) {
        case close1:
            $('#buttonContainerTicket').hide();
            $("#buttonContainerText").hide();
            $("#buttonContainerPlayer").hide();
            $("#buttonContainerItem").hide();
            $("#button_container").show();
            $("#container").fadeOut(200);
            $.post('http://gum_adminmenu_nui/close');
        break;
        case close2:
            $('#buttonContainerTicket').hide();
            $("#buttonContainerText").hide();
            $("#buttonContainerPlayer").hide();
            $("#buttonContainerItem").hide();
            $("#button_container").show();
            $("#container").fadeOut(200);
            $.post('http://gum_adminmenu_nui/close');
        break;
    }
});

function openTicket() {
    hideButtons()
    const ticketBody = document.getElementById('buttonContainerTicket');
    let dataHtml = '';
    ticketTable.sort(function(a, b){if(b.date < a.date) { return -1; }return 0;})
    for (var a in ticketTable) {
        dataHtml += '<div id="button2" onClick="showMe('+a+')"><div id="text">'+ticketTable[a].title+'</div><div id="text2">'+ticketTable[a].date+'</div></div>'
   }
   ticketBody.innerHTML = dataHtml
   $("#buttonContainerTicket").fadeIn(200);
   $("#buttonContainerText").fadeIn(200);
}

function openPlayer() {
    playerCount = 0
    hideButtons()
    const playerBody = document.getElementById('buttonContainerPlayer');
    let dataHtml = '';
    playerList.sort(function(a, b){if(b.source > a.source) { return -1; }return 0;})
    for (var a in playerList) {
        playerCount += 1
        dataHtml += '<div id="button2"><div id="text">['+playerList[a].source+'] '+playerList[a].playerName+'</div><div id="text2">'+playerList[a].charId+' | '+playerList[a].playerHex+'</div></div>'
   }
   playerBody.innerHTML = dataHtml
   
    document.getElementById("header").innerHTML = "<div id='back' onclick='backList()'></div>Admin menu | "+playerCount+""
   $("#buttonContainerPlayer").fadeIn(200);
}

function openItem() {
    playerCount = 0
    hideButtons()
    const playerBody = document.getElementById('buttonContainerItem');
    let dataHtml = '';
    itemList.sort(function(a, b){if(b.label > a.label) { return -1; }return 0;})
    for (var a in itemList) {
        playerCount += 1
        dataHtml += '<div id="button2" onclick=giveItem('+a+')><div id="text">'+itemList[a].label+'</div><div id="text2">'+itemList[a].item+' | '+itemList[a].limit+' kg</div></div>'
   }
   playerBody.innerHTML = dataHtml
   
    document.getElementById("header").innerHTML = "<div id='back' onclick='backList()'></div>Admin menu | "+playerCount+""
   $("#buttonContainerItem").fadeIn(200);
}

function deleteTicket() {
    console.log(ticketTable[activeId].title, ticketTable[activeId].date)
}
function giveItem(a) {
    $.post('http://gum_adminmenu_nui/giveItem', JSON.stringify({item:itemList[a].item})); 
}

function showMe(a){
    activeId = a
    document.getElementById("supportTitle").innerHTML = ""+ticketTable[a].title+""
    document.getElementById("supportText").innerHTML = ""+ticketTable[a].text+""
    document.getElementById("supportSteamId").innerHTML = "steam : "+ticketTable[a].steamid+""
    document.getElementById("supportCharId").innerHTML = "charid : "+ticketTable[a].charid+""
    document.getElementById("supportDate").innerHTML = ""+ticketTable[a].date+""
    document.getElementById("supportSource").innerHTML = "ID : "+ticketTable[a].source+""
}
function actionMenu(a) {
    $.post('http://gum_adminmenu_nui/makeIt', JSON.stringify({type:a}));
}
function backList() {
    $("#buttonContainerTicket").fadeOut(200);
    $("#buttonContainerText").fadeOut(200);
    $("#buttonContainerPlayer").fadeOut(200);
    $("#buttonContainerItem").fadeOut(200);
    showButtons()
}

function hideButtons() {
    $("#button_container").fadeOut(200);

}
function showButtons() {
    $("#button_container").fadeIn(100);
}