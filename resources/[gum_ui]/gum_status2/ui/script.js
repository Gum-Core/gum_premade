var hudShowed = false
function health_bar(){
    var health_active = $("#health_active");
    var prec = health_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        health_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        health_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}
function health_bar2(){
    var health_active2 = $("#health_active2");
    var prec = health_active2.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        health_active2.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        health_active2.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #797979 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}
function alcohol_bar(){
    var alcohol_active = $("#alcohol_active");
    var prec = alcohol_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        alcohol_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        alcohol_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}
function temperature_bar(){
    var temperature_active = $("#temperature_active");
    var prec = temperature_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        temperature_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        temperature_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}

function voice_bar(){
    var voice_active = $("#voice_active");
    var prec = voice_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        voice_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        voice_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}
function stamina_bar(){
    var stamina_active = $("#stamina_active");
    var prec = stamina_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        stamina_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        stamina_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}
function stamina_bar2(){
    var stamina_active2 = $("#stamina_active2");
    var prec = stamina_active2.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        stamina_active2.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        stamina_active2.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #797979 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}


function hunger_bar(){
    var hunger_active = $("#hunger_active");
    var prec = hunger_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        hunger_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        hunger_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}

function thirst_bar(){
    var thirst_active = $("#thirst_active");
    var prec = thirst_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        thirst_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        thirst_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}


function horse_health_bar(){
    var horse_health_active = $("#horse_health_active");
    var prec = horse_health_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        horse_health_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        horse_health_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}
function horse_health_bar2(){
    var horse_health_active2 = $("#horse_health_active2");
    var prec = horse_health_active2.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        horse_health_active2.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
    else{
        horse_health_active2.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #797979 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}

function horse_stamina_bar(){
    var horse_stamina_active = $("#horse_stamina_active");
    var prec = horse_stamina_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        horse_stamina_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }else{
        horse_stamina_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}
function horse_stamina_bar2(){
    var horse_stamina_active2 = $("#horse_stamina_active2");
    var prec = horse_stamina_active2.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        horse_stamina_active2.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }else{
        horse_stamina_active2.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #797979 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}
var minimap = false
function progress_bar(){
    var progress_active = $("#progress_active");
    var prec = progress_active.children().children().text();
    if (prec > 100)
        prec = 100;
    var deg = prec*3.6;
    if (deg <= 180){
        progress_active.css('background-image','linear-gradient(' + (90+deg) + 'deg, transparent 50%, #000000 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }else{
        progress_active.css('background-image','linear-gradient(' + (deg-90) + 'deg, transparent 50%, #ffffff 50%),linear-gradient(90deg, #000000 50%, transparent 50%)');
    }
}

$(document).ready(function () {
    hudShowed = true
    show_hud(false);
    $("#progress_active").hide(); 
    window.addEventListener("message", function (event) {
        if (event.data.progress===true) {
            $("#progress_active").show();
            set_progress(event.data.time) 
        }
        if (event.data.progress===false) {
            $("#progress_active").hide();
        }
        if (event.data.show===true) {
            if (event.data.alcohol > 0) {
                $("#alcohol_active").show();
            } else {
                $("#alcohol_active").hide();
            }
            show_hud(event.data.show);
            if (event.data.minimap === false) {
                minimap = false
                set_health(event.data.health);
                set_health2(event.data.health2);
                set_horse_health(event.data.horse_health);
                set_horse_health2(event.data.horse_health2);
                set_stamina(event.data.stamina);
                set_stamina2(event.data.stamina2);
                set_horse_stamina(event.data.horse_stamina);
                set_horse_stamina2(event.data.horse_stamina2);
                show_horse_stats(event.data.on_horse)
            } else {
                minimap = true
            }
            set_hunger(event.data.hunger);
            set_thirst(event.data.thirst);
            set_alcohol(event.data.alcohol);
            set_temperature(event.data.temp);
            if ( event.data.voice == true ) {
                $("#voice").attr("src","microphone_active.png");
              }else{
                $("#voice").attr("src","microphone_inactive.png");
            }
            set_voice(event.data.volume);
            } else{
                show_hud(event.data.show);
            }

    });
});

$(function() {
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.compass == true) {
            $("#compass").show();
            $('#compass').css('transform','rotate(' + event.data.angle + 'deg)');
        } else if (item.compass == false) {
            $("#compass").hide();
        }
    });
});


function show_hud(show_hud) {
    if (show_hud && true !== hudShowed) {
        hudShowed = true
        if (minimap == false) {
            $("#health_active").show();
            $("#health_active2").show();
            $("#stamina_active").show();
            $("#stamina_active2").show();
        } else {
            $("#health_active").hide();
            $("#health_active2").hide();
            $("#stamina_active").hide();
            $("#stamina_active2").hide();
        }
        $("#hunger_active").show();
        $("#thirst_active").show();
        $("#temperature_active").show();
        $("#voice_active").show();
    } else {
        if (show_hud === false &&hudShowed === true) {
            hudShowed = false
            $("#hunger_active").hide();
            $("#thirst_active").hide();
            $("#alcohol_active").hide();
            $("#temperature_active").hide();
            $("#voice_active").hide();
            if (minimap == false) {
                $("#stamina_active").hide();
                $("#stamina_active2").hide();
                $("#health_active").hide();
                $("#health_active2").hide();
                $("#horse_stamina_active").hide();
                $("#horse_stamina_active2").hide();
                $("#horse_health_active").hide();
                $("#horse_health_active2").hide();
            }
        }
    }
}


function show_horse_stats(horse_hud) {
    if (horse_hud) {
        $("#horse_stamina_active").show();
        $("#horse_stamina_active2").show();
        $("#horse_health_active").show();
        $("#horse_health_active2").show();
    } else {
        $("#horse_stamina_active").hide();
        $("#horse_stamina_active2").hide();
        $("#horse_health_active").hide();
        $("#horse_health_active2").hide();
    }
}
function set_horse_health(value) {
    var horseh = document.getElementsByClassName('horse_health_perc')[0];
    horseh.innerHTML = value;
    horse_health_bar()
}
function set_horse_health2(value) {
    var horseh2 = document.getElementsByClassName('horse_health_perc2')[0];
    horseh2.innerHTML = value;
    horse_health_bar2()
}
function set_temperature(value) {
    var temph = document.getElementsByClassName('temperature_perc')[0];
    temph.innerHTML = value;
    temperature_bar()
}
function set_voice(value) {
    var voih = document.getElementsByClassName('voice_perc')[0];
    voih.innerHTML = value;
    voice_bar()
}
function set_alcohol(value) {
    var alcohol = document.getElementsByClassName('alcohol_perc')[0];
    alcohol.innerHTML = value;
    alcohol_bar()
}
function set_horse_stamina(value) {
    var horses = document.getElementsByClassName('horse_stamina_perc')[0];
    horses.innerHTML = value;
    horse_stamina_bar()
}

function set_horse_stamina2(value) {
    var horses2 = document.getElementsByClassName('horse_stamina_perc2')[0];
    horses2.innerHTML = value;
    horse_stamina_bar2()
}



function set_health(value) {
    var health = document.getElementsByClassName('health_perc')[0];
    health.innerHTML = value;
    health_bar()
}
function set_health2(value) {
    var health2 = document.getElementsByClassName('health_perc2')[0];
    health2.innerHTML = value;
    health_bar2()
}

function set_hunger(value) {
    var hunger = document.getElementsByClassName('hunger_perc')[0];
    hunger.innerHTML = value;
    hunger_bar()
}

function set_thirst(value) {
    var thirst = document.getElementsByClassName('thirst_perc')[0];
    thirst.innerHTML = value;
    thirst_bar()
}
function set_stamina(value) {
    var stamina = document.getElementsByClassName('stamina_perc')[0];
    stamina.innerHTML = value;
    stamina_bar()
}
function set_stamina2(value) {
    var stamina2 = document.getElementsByClassName('stamina_perc2')[0];
    stamina2.innerHTML = value;
    stamina_bar2()
}
function set_progress(value) {
    var progress = document.getElementsByClassName('progress_perc')[0];
    progress.innerHTML = value;
    progress_bar()
}

