var slider45 = document.getElementById("HAIRSSTABLE_OPACITY");
var slider46 = document.getElementById("HAIRSSTABLE_COLOR");
var slider47 = document.getElementById("HAIRS");
var slider48 = document.getElementById("BEARDS");
var slider49 = document.getElementById("BEARDSSTABLE_OPACITY");
var slider50 = document.getElementById("BEARDSSTABLE_COLOR");
var slider51 = document.getElementById("SHADOWS_OPACITY");
var slider52 = document.getElementById("SHADOWS_COLOR1");
var slider53 = document.getElementById("SHADOWS_COLOR2");
var slider54 = document.getElementById("SHADOWS_COLOR3");
var slider55 = document.getElementById("SHADOWS_TYPE");
var slider56 = document.getElementById("LIPSTICKS_OPACITY");
var slider57 = document.getElementById("LIPSTICKS_COLOR1");
var slider58 = document.getElementById("LIPSTICKS_COLOR2");
var slider59 = document.getElementById("LIPSTICKS_COLOR3");
var slider60 = document.getElementById("LIPSTICKS_TYPE");
var slider61 = document.getElementById("BRUSH_OPACITY");
var slider62 = document.getElementById("BRUSH_COLOR1");
var slider65 = document.getElementById("BRUSH_TYPE");
var slider66 = document.getElementById("EYELINNERS_OPACITY");
var slider67 = document.getElementById("EYELINNERS_COLOR1");
var slider70 = document.getElementById("EYELINNERS_TYPE");
var slider71 = document.getElementById("EYEBROWS_OPACITY");
var slider72 = document.getElementById("EYEBROWS_COLOR1");
var slider75 = document.getElementById("EYEBROWS_TYPE");
var slider76 = document.getElementById("MOLES_TYPE");
var slider77 = document.getElementById("MOLES_OPACITY");
var slider78 = document.getElementById("FRECKLES_TYPE");
var slider79 = document.getElementById("FRECKLES_OPACITY");
var slider80 = document.getElementById("AGEING_TYPE");
var slider81 = document.getElementById("AGEING_OPACITY");
var slider83 = document.getElementById("ACNE_TYPE");
var slider84 = document.getElementById("ACNE_OPACITY");
var slider85 = document.getElementById("COMPLEX_TYPE");
var slider86 = document.getElementById("COMPLEX_OPACITY");
var slider87 = document.getElementById("DISC_TYPE");
var slider88 = document.getElementById("DISC_OPACITY");
var slider89 = document.getElementById("SCARS_TYPE");
var slider90 = document.getElementById("SCARS_OPACITY");
var slider91 = document.getElementById("SPOTS_TYPE");
var slider92 = document.getElementById("SPOTS_OPACITY");
var slider124 = document.getElementById("TEETHS");
var slider125 = document.getElementById("HAIRSACCESSORIE");

slider45.oninput = function() {send_change(this.value, this.id)}
slider46.oninput = function() {send_change(this.value, this.id)}
slider47.oninput = function() {send_change(this.value, this.id)}
slider48.oninput = function() {send_change(this.value, this.id)}
slider49.oninput = function() {send_change(this.value, this.id)}
slider50.oninput = function() {send_change(this.value, this.id)}
slider51.oninput = function() {send_change(this.value, this.id)}
slider52.oninput = function() {send_change(this.value, this.id)}
slider53.oninput = function() {send_change(this.value, this.id)}
slider54.oninput = function() {send_change(this.value, this.id)}
slider55.oninput = function() {send_change(this.value, this.id)}
slider56.oninput = function() {send_change(this.value, this.id)}
slider57.oninput = function() {send_change(this.value, this.id)}
slider58.oninput = function() {send_change(this.value, this.id)}
slider59.oninput = function() {send_change(this.value, this.id)}
slider60.oninput = function() {send_change(this.value, this.id)}
slider61.oninput = function() {send_change(this.value, this.id)}
slider62.oninput = function() {send_change(this.value, this.id)}
slider65.oninput = function() {send_change(this.value, this.id)}
slider66.oninput = function() {send_change(this.value, this.id)}
slider67.oninput = function() {send_change(this.value, this.id)}
slider70.oninput = function() {send_change(this.value, this.id)}
slider71.oninput = function() {send_change(this.value, this.id)}
slider72.oninput = function() {send_change(this.value, this.id)}
slider75.oninput = function() {send_change(this.value, this.id)}
slider76.oninput = function() {send_change(this.value, this.id)}
slider77.oninput = function() {send_change(this.value, this.id)}
slider78.oninput = function() {send_change(this.value, this.id)}
slider79.oninput = function() {send_change(this.value, this.id)}
slider80.oninput = function() {send_change(this.value, this.id)}
slider81.oninput = function() {send_change(this.value, this.id)}
slider83.oninput = function() {send_change(this.value, this.id)}
slider84.oninput = function() {send_change(this.value, this.id)}
slider85.oninput = function() {send_change(this.value, this.id)}
slider86.oninput = function() {send_change(this.value, this.id)}
slider87.oninput = function() {send_change(this.value, this.id)}
slider88.oninput = function() {send_change(this.value, this.id)}
slider89.oninput = function() {send_change(this.value, this.id)}
slider90.oninput = function() {send_change(this.value, this.id)}
slider91.oninput = function() {send_change(this.value, this.id)}
slider92.oninput = function() {send_change(this.value, this.id)}
slider124.oninput = function() {send_change(this.value, this.id)}
slider125.oninput = function() {send_change(this.value, this.id)}

$(function() {
    function display(bool) {
        if (bool) {
            $("#container").fadeIn(100);
        } else {
            $("#container").fadeOut(200);
        }
    }
    display(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "barber_maker") {
            if (item.status == true) {
                document.getElementById("HAIRS").max = item.maxhair;
                document.getElementById("BEARDS").max = item.maxbeard;
                document.getElementById("TEETHS").max = item.maxteeths;
                document.getElementById("HAIRSACCESSORIE").max = item.maxhairacc;
            } else {
                display(false)
            }
        }
        if (item.type === "barber_open") {
            if (item.status == true) {
                display(true)
                document.getElementById("HAIRS").value = item.hair;
                document.getElementById("HAIRSACCESSORIE").value = item.hairaccessorie;
                document.getElementById("BEARDS").value = item.beard;
                document.getElementById("TEETHS").value = item.teeth;
                document.getElementById("BEARDSSTABLE_OPACITY").value = item.BEARDSSTABLE_OPACITY*10;
                document.getElementById("BEARDSSTABLE_COLOR").value = item.BEARDSSTABLE_COLOR;
                document.getElementById("SHADOWS_OPACITY").value = item.SHADOWS_OPACITY*10;
                document.getElementById("SHADOWS_COLOR1").value = item.SHADOWS_COLOR1;
                document.getElementById("SHADOWS_COLOR2").value = item.SHADOWS_COLOR2;
                document.getElementById("SHADOWS_COLOR3").value = item.SHADOWS_COLOR3;
                document.getElementById("SHADOWS_TYPE").value = item.SHADOWS_TYPE;
                document.getElementById("LIPSTICKS_OPACITY").value = item.LIPSTICKS_OPACITY*10;
                document.getElementById("LIPSTICKS_COLOR1").value = item.LIPSTICKS_COLOR1;
                document.getElementById("LIPSTICKS_COLOR2").value = item.LIPSTICKS_COLOR2;
                document.getElementById("LIPSTICKS_COLOR3").value = item.LIPSTICKS_COLOR3;
                document.getElementById("LIPSTICKS_TYPE").value = item.LIPSTICKS_TYPE;
                document.getElementById("BRUSH_OPACITY").value = item.BRUSH_OPACITY*10;
                document.getElementById("BRUSH_COLOR1").value = item.BRUSH_COLOR1;
                document.getElementById("BRUSH_TYPE").value = item.BRUSH_TYPE;
                document.getElementById("EYELINNERS_OPACITY").value = item.EYELINNERS_OPACITY*10;
                document.getElementById("EYELINNERS_COLOR1").value = item.EYELINNERS_COLOR1;
                document.getElementById("EYELINNERS_TYPE").value = item.EYELINNERS_TYPE;
                document.getElementById("EYEBROWS_OPACITY").value = item.EYEBROWS_OPACITY*10;
                document.getElementById("EYEBROWS_COLOR1").value = item.EYEBROWS_COLOR1;
                document.getElementById("EYEBROWS_TYPE").value = item.EYEBROWS_TYPE;
                document.getElementById("MOLES_OPACITY").value = item.MOLES_OPACITY*10;
                document.getElementById("MOLES_TYPE").value = item.MOLES_TYPE;
                document.getElementById("FRECKLES_TYPE").value = item.FRECKLES_TYPE;
                document.getElementById("FRECKLES_OPACITY").value = item.FRECKLES_OPACITY*10;
                document.getElementById("AGEING_TYPE").value = item.AGEING_TYPE;
                document.getElementById("AGEING_OPACITY").value = item.AGEING_OPACITY*10;
                document.getElementById("ACNE_TYPE").value = item.ACNE_TYPE;
                document.getElementById("ACNE_OPACITY").value = item.ACNE_OPACITY*10;
                document.getElementById("COMPLEX_TYPE").value = item.COMPLEX_TYPE;
                document.getElementById("COMPLEX_OPACITY").value = item.COMPLEX_OPACITY*10;
                document.getElementById("DISC_TYPE").value = item.DISC_TYPE;
                document.getElementById("DISC_OPACITY").value = item.DISC_OPACITY*10;
                document.getElementById("SCARS_TYPE").value = item.SCARS_TYPE;
                document.getElementById("SCARS_OPACITY").value = item.SCARS_OPACITY*10;
                document.getElementById("SPOTS_TYPE").value = item.SPOTS_TYPE;
                document.getElementById("SPOTS_OPACITY").value = item.SPOTS_OPACITY*10;
                document.getElementById("TEETHS").value = item.teeth;
            }
        }
    })
})

$(document).keydown(function(e) {
    var key_a = 65;
    var key_d = 68;
    var close1 = 27;
    var close2 = 8;
    switch (e.keyCode) {
        case key_a:
            $.post('http://gum_barberstore/left_key');
        break;
        case key_d:
            $.post('http://gum_barberstore/right_key');
        break;
        case close1:
            $.post('http://gum_barberstore/close');
        break;
        case close2:
            $.post('http://gum_barberstore/close');
        break;
    }
});
function save_character() {
    $.post('http://gum_barberstore/save_character');
}




function validate(id) {
    var check = document.getElementById(id);
    $.post('http://gum_barberstore/enable_disable', JSON.stringify({ id:id, check: check.checked}));
}

function send_change(value, id){
    $.post('http://gum_barberstore/send_change', JSON.stringify({ id:id, value: value}));
}
