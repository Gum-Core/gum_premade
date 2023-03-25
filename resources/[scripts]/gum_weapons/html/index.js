var shared_table = {}
var global_table = {}
var weapon_table = {}
var ammo_table = {}
var comp_table = {}
var buy_table = {}
var value = 1
var block_spam = false
var value_ammo = 1
var backupMe = undefined
var overMe = false
$(document).keydown(function(e){
	var close = 27, close2 = 8;
	switch (e.keyCode) {
		case close:
			$.post('http://gum_weapons/exit')
            backupMe = undefined
		break;
        case close2:
			$.post('http://gum_weapons/exit')
            backupMe = undefined
		break;
	}
});

$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
            $("#shared_table").show();
            $("#back_arrow").hide();
            $("#pay_weapos").show();
        } else {
            $("#container").hide();
        }
    }
    function display_buy(bool) {
        if (bool) {
            $("#container_buying").show();
            $("#weapon_table").show();

            $("#ammo_table").hide();
            $("#weapon_table").show();
            
            $("#ammo_store").show();
            $("#weapon_store").hide();
            $("#buy_weapon").show();
            $("#buy_ammo").hide();
        } else {
            $("#container_buying").hide();
        }
    }

    display(false)
    display_buy(false)


    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "language") {
            Language = item.Language
        }
        if (item.type === "customization_menu") {
            if (item.status == true) {
                display(true)
                shared_table = item.table_shared
                global_table = item.table_glob
                comp_table = item.table_comps
                shared_data(item.table_shared, item.table_glob)
                weapType = item.weapType
                document.getElementById('component_for_buy').innerHTML = "Cena";
            } else {
                display(false)
            }
        }
        if (item.type === "buying_menu") {
            if (item.status == true) {
                display_buy(true)
                weapon_table = item.weapon_table
                weapon_store(item.weapon_table)
                ammo_table = item.ammo_table
                ammo_store(item.ammo_table)
            } else {
                display_buy(false)
            }
        }
        if (item.type === "price_for_load") {
            if (item.status == true) {
                load_price(item.price, item.wep_name)
            }
        }
        if (item.type === "price_for_ammo") {
            if (item.status == true) {
                load_ammo_price(item.price, item.amm_name)
            }
        }
        if (item.type === "compo_price") {
            document.getElementById('component_for_buy').innerHTML = "Cena : </br>"+item.comp_price+"$";
        }
    })

    $("#close").click(function () {
        $.post('http://gum_weapons/exit', JSON.stringify({}));
        return
    })

})

function weapon_store(weapon_store){
    const tableBody = document.getElementById('weapon_table');
    let dataHtml = '';
    for(var key in weapon_store){
        dataHtml += '<div class="wep_grid-item2">'+key+'</div>'
        dataHtml += '<div class="wep_grid-item""><div id="wep_right" onclick="wep_switch_right(\''+ key +'\')"></div><div id="input_value_'+key+'" class="wep_input_value">Zvolit</div></div>';
        dataHtml += '</br></br></br></br>'
   }

   tableBody.innerHTML = dataHtml
}

function ammo_store(ammo_table){
    const tableBody = document.getElementById('ammo_table');
    let dataHtml = '';
    for(var key in ammo_table){
        dataHtml += '<div class="wep_grid-item2">'+key+'</div>'
        dataHtml += '<div class="wep_grid-item"><div id="wep_right" onclick="wep_switch_right2(\''+ key +'\')"></div><div id="input_value2_'+key+'" class="wep_input_value">Zvolit</div></div>';
        dataHtml += '</br></br></br></br>'
    }
    tableBody.innerHTML = dataHtml
}
function switch_to_weapon(){
    $("#weapon_table").show();
    $("#ammo_table").hide();
    $("#buy_weapon").show();
    $("#buy_ammo").hide();

    $("#ammo_store").show();
    $("#weapon_store").hide();
    document.getElementById('weapon_for_buy').innerHTML = "Cena";
    $.post('http://gum_weapons/delete_prop', JSON.stringify({}));
}
function switch_to_ammo(){
    $.post('http://gum_weapons/delete_prop', JSON.stringify({}));
    $("#ammo_table").show();
    $("#weapon_table").hide();
    $("#buy_ammo").show();
    $("#buy_weapon").hide();

    $("#ammo_store").hide();
    $("#weapon_store").show();
    document.getElementById('weapon_for_buy').innerHTML = "Cena";
}


function wep_switch_right(keys2){
    if (block_spam == false ){
        for(var key in weapon_table){
            if (key == keys2){
                for (var key2 in weapon_table[key]){
                    if (Object.keys(weapon_table[key])[value] == undefined){
                        value = 0
                    } else {
                        document.getElementById('input_value_'+key).innerHTML = Object.keys(weapon_table[key])[value];
                    }
                }
                var update_value = document.getElementById('input_value_'+key).innerHTML;
                $.post('http://gum_weapons/show_store_weapons', JSON.stringify({ weapon_name: update_value}));
            }
        }
        block_spam = true
        value = value+1
        setTimeout(function() {
            block_spam = false
        }, 500);
    }
}

function buy_ammo(){
    $.post('http://gum_weapons/buy_weapon', JSON.stringify({}));
}
function buy_weapon(){
    $.post('http://gum_weapons/buy_ammo', JSON.stringify({}));
}

function wep_switch_right2(keys3){
    if (block_spam == false ){
        for(var key in ammo_table){
            if (key == keys3){
                for (var key2 in ammo_table[key]){
                    if (Object.keys(ammo_table[key])[value_ammo] == undefined){
                        value_ammo = 0
                    } else {
                        document.getElementById('input_value2_'+key).innerHTML = Object.keys(ammo_table[key])[value_ammo];
                    }
                }
                var update_value = document.getElementById('input_value2_'+key).innerHTML;
                $.post('http://gum_weapons/ammo_price_weapons', JSON.stringify({ ammo_name: update_value}));
            }
        }
        block_spam = true
        value_ammo = value_ammo+1
        setTimeout(function() {
            block_spam = false
        }, 500);
    }
}

function load_price(price_value, weapon_name){
    document.getElementById('weapon_for_buy').innerHTML = weapon_name+"</br>"+price_value+"$";
}

function load_ammo_price(price_value, ammo_name){
    document.getElementById('weapon_for_buy').innerHTML = ammo_name+"</br>"+price_value+"$";
}

function shared_data(){
    const tableBody = document.getElementById('shared_table');
    let dataHtml = '';
    buy_table = {}

    for (var k in shared_table) {
        // var str = k
        // const result1 = str.replaceAll('_', ' ');
        dataHtml += '<div onclick="openMe(\''+ k +'\')" class="grid-item2" id="gridInfo'+k+'"><div id="text">'+k+'</div></div>'
    }
    dataHtml += "</br>"
    for (var k in global_table) {
        // var str = k
        // const result1 = str.replaceAll('_', ' ');
        if (k !== Language[7]) {
            dataHtml += '<div onclick="openMe2(\''+ k +'\')" class="grid-item2" id="gridInfo'+k+'"><div id="text">'+k+'</div></div>'
        }
    }

    tableBody.innerHTML = dataHtml
    for (var k in shared_table) {
        document.getElementById("gridInfo"+k+"").style.height = "20px"; 
    }
    for (var k in global_table) {
        document.getElementById("gridInfo"+k+"").style.height = "20px"; 
    }
    load_components()
}

function openMe(k) {
    if (overMe == false) {
        if (document.getElementById("gridInfo"+k+"").style.height == "20px") {
            if (backupMe !== undefined && backupMe !== null) {
                document.getElementById("gridInfo"+backupMe+"").style.height = "20px"; 
                document.getElementById("gridInfo"+backupMe+"").innerHTML = '<div id="text">'+backupMe+'</div>'
                document.getElementById("gridInfo"+backupMe+"").style.overflowY = "hidden";
                $("#selectMe").hide();
            }
            backupMe = k

            document.getElementById("gridInfo"+k+"").style.height = "100px"; 
            document.getElementById("gridInfo"+k+"").style.overflowY = "scroll";
            $("#selectMe").show();
            for (var a in shared_table) {
                if (k == a) {
                    let dataHtml2 = '';
                    const tableBody2 = document.getElementById('gridInfo'+k+'');
                    var data = shared_table[k]
                    dataHtml2 += '<div id="selectMe" onclick="useComponent(\'cleanIt\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/clean.png" width="32" height="32"></div>'
                    for (var b in data) {
                        if (weapType == "SHORTARM") {
                            if (k == Language[5] || k == Language[8]|| k == Language[2]|| k == Language[12]|| k == Language[15] || k == Language[3] || k == Language[31]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/MATERIAL_COLOR/'+data[b].replace(/\D/g, '')+'.png" width="32" height="32"></div>'
                            } else if (k == Language[11] || k == Language[17]|| k == Language[14]|| k == Language[33]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/MATERIAL_ENGRAVING_COLOR/'+data[b].replace(/\D/g, '')+'.png" width="32" height="32"></div>'
                            } else if (k == Language[19]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/GRIPSTOCK_ENGRAVING_SHORTARM/'+data[b].replace(/\D/g, '')+'.png" width="32" height="32"></div>'
                            } else if (k == Language[13] || k == Language[16] || k == Language[7] || k == Language[32]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/ENGRAVING/'+data[b].replace(/\D/g, '')+'.png" width="32" height="32"></div>'
                            } else if (k == Language[22]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/WRAP_COLOR/'+b+'.png" width="32" height="32"></div>'
                            } else {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/BARREL/1.png" width="32" height="32"></div>'
                            }
                        } else {
                            if (k == Language[5] || k == Language[8]|| k == Language[2]|| k == Language[12]|| k == Language[15]|| k == Language[3] || k == Language[31]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/MATERIAL_COLOR/'+data[b].replace(/\D/g, '')+'.png" width="32" height="32"></div>'
                            } else if (k == Language[11] || k == Language[17]|| k == Language[14] || k == Language[33]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/MATERIAL_ENGRAVING_COLOR/'+data[b].replace(/\D/g, '')+'.png" width="32" height="32"></div>'
                            } else if (k == Language[19]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/GRIPSTOCK_ENGRAVING_LONGARM/'+data[b].replace(/\D/g, '')+'.png" width="32" height="32"></div>'
                            } else if (k == Language[13] || k == Language[16] || k == Language[7] || k == Language[32]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/ENGRAVING/'+data[b].replace(/\D/g, '')+'.png" width="32" height="32"></div>'
                            } else if (k == Language[22]) {
                                dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/WRAP_COLOR/'+b+'.png" width="32" height="32"></div>'
                            } else {
                            dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/BARREL/1.png" width="32" height="32"></div>'
                            }
                        }
                    }
                    tableBody2.innerHTML = dataHtml2
                }
            }
        } else {
            document.getElementById("gridInfo"+k+"").style.height = "20px"; 
            document.getElementById("gridInfo"+k+"").innerHTML = '<div id="text">'+k+'</div>'
            document.getElementById("gridInfo"+k+"").style.overflowY = "hidden";
            $("#selectMe").hide();
        }
    }
}
function openMe2(k) {
    if (overMe == false) {
        if (document.getElementById("gridInfo"+k+"").style.height == "20px") {
            if (backupMe !== undefined && backupMe !== null) {
                document.getElementById("gridInfo"+backupMe+"").style.height = "20px"; 
                document.getElementById("gridInfo"+backupMe+"").innerHTML = '<div id="text">'+backupMe+'</div>'
                document.getElementById("gridInfo"+backupMe+"").style.overflowY = "hidden";
                $("#selectMe").hide();
            }
            backupMe = k
            
            document.getElementById("gridInfo"+k+"").style.height = "100px"; 
            $("#selectMe").show();
            let dataHtml2 = '';
            const tableBody2 = document.getElementById('gridInfo'+k+'');
            dataHtml2 += '<div id="selectMe" onclick="useComponent(\'cleanIt\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/clean.png" width="32" height="32"></div>'
            for (var a in global_table) {
                if (k == a) {
                    var data = global_table[k]
                    for (var b in data) {
                        dataHtml2 += '<div id="selectMe" onclick="useComponent(\''+data[b]+'\', \''+k+'\')" onmouseover="overMouse()" onmouseout="outMouse()"><img id="img" src="images/BARREL/1.png" width="32" height="32"></div>'
                    }
                    tableBody2.innerHTML = dataHtml2
                }
            }
        } else {
            document.getElementById("gridInfo"+k+"").style.height = "20px"; 
            document.getElementById("gridInfo"+k+"").innerHTML = '<div id="text">'+k+'</div>'
            $("#selectMe").hide();
        }
    }
}

function useComponent(comp, category) {
    $.post('http://gum_weapons/compData', JSON.stringify({ comp: comp, category:category}));
}

function overMouse() {
    overMe = true
}

function outMouse() {
    overMe = false
}

function load_components(){
    for (var key in comp_table){
        // console.log(key+" "+comp_table[key])
    }
}

function buy_components(){
    $.post('http://gum_weapons/buy_components', JSON.stringify({ table_comp: buy_table}));
}

function switch_left(data){
    var update_value = document.getElementById('input_value_'+data).innerHTML;
    var checked_value = (Number(update_value) - 1);
    for (var key in shared_table){
        if (key == data) {
            if (update_value == 0) {
                document.getElementById('input_value_'+data).innerHTML = (Number(update_value) - 1);
                $.post('http://gum_weapons/reset_skin', JSON.stringify({}));
                console.log(key)
                buy_table[key] = {value:-1, component:shared_table[data][document.getElementById('input_value_'+data).innerHTML]}
            } else if (shared_table[data][checked_value] !== undefined) {
                document.getElementById('input_value_'+data).innerHTML = (Number(update_value) - 1);
                $.post('http://gum_weapons/set_skin', JSON.stringify({ load_now: shared_table[data][document.getElementById('input_value_'+data).innerHTML] }));
                buy_table[key] = {value:checked_value, component:shared_table[data][document.getElementById('input_value_'+data).innerHTML]}
            }
        }
    }
}

function switch_left2(data){
    var update_value = document.getElementById('input_value_'+data).innerHTML;
    var checked_value = (Number(update_value) - 1);
    for (var key in global_table){
        if (key == data) {
            if (update_value == 0) {
                document.getElementById('input_value_'+data).innerHTML = (Number(update_value) - 1);
                $.post('http://gum_weapons/reset_skin', JSON.stringify({sended:"global", what:document.getElementById('input_value_'+data).innerHTML}));
                buy_table[key] = {value:checked_value, component:global_table[data][document.getElementById('input_value_'+data).innerHTML]}
            } else if (global_table[data][checked_value] !== undefined) {
                document.getElementById('input_value_'+data).innerHTML = (Number(update_value) - 1);
                $.post('http://gum_weapons/set_skin', JSON.stringify({ load_now: global_table[data][document.getElementById('input_value_'+data).innerHTML]}));
                buy_table[key] = {value:checked_value, component:global_table[data][document.getElementById('input_value_'+data).innerHTML]}
            }
        }
    }
}

function switch_right(data){
    var update_value = document.getElementById('input_value_'+data).innerHTML;
    var checked_value = (Number(update_value) + 1);
    for (var key in shared_table){
        if (key == data) {
            if (shared_table[data][checked_value] !== undefined){ 
                document.getElementById('input_value_'+data).innerHTML = (Number(update_value) + 1);
                $.post('http://gum_weapons/set_skin', JSON.stringify({ load_now: shared_table[data][document.getElementById('input_value_'+data).innerHTML] }));
                buy_table[key] = {value:checked_value, component:shared_table[data][document.getElementById('input_value_'+data).innerHTML]}
            }
        }
    }
 }

function switch_right2(data){
    var update_value = document.getElementById('input_value_'+data).innerHTML;
    var checked_value = (Number(update_value) + 1);
    for (var key in global_table){
        if (key == data) {
            if (global_table[data][checked_value] !== undefined){ 
                document.getElementById('input_value_'+data).innerHTML = (Number(update_value) + 1);
                $.post('http://gum_weapons/set_skin', JSON.stringify({ load_now: global_table[data][document.getElementById('input_value_'+data).innerHTML]}));
                buy_table[key] = {value:checked_value, component:global_table[data][document.getElementById('input_value_'+data).innerHTML]}
            }
        }
    }
 }


 function set_camera(data){
    $.post('http://gum_weapons/set_camera', JSON.stringify({ weapon_cam: data }));
}