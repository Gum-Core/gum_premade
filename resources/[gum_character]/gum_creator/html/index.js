var slider0 = document.getElementById("EYES");
var slider1 = document.getElementById("0x3C0F");
var slider2 = document.getElementById("0xC3B2");
var slider3 = document.getElementById("0xE323");
var slider4 = document.getElementById("0x8D0A");
var slider5 = document.getElementById("0xEBAE");
var slider6 = document.getElementById("0x1DF6");
var slider7 = document.getElementById("0x1A00");
var slider8 = document.getElementById("0x91C1");
var slider9 = document.getElementById("0xC375");
var slider10 = document.getElementById("0xBB4D");
var slider11 = document.getElementById("0xB0B0");
var slider12 = document.getElementById("0x5D16");
var slider13 = document.getElementById("0xF065");
var slider14 = document.getElementById("0xAA69");
var slider15 = document.getElementById("0x7AC3");
var slider16 = document.getElementById("0x410D");
var slider17 = document.getElementById("0x6A0B");
var slider18 = document.getElementById("0xABCF");
var slider19 = document.getElementById("0x358D");
var slider20 = document.getElementById("0x6E7F");
var slider21 = document.getElementById("0x3471");
var slider22 = document.getElementById("0x03F5");
var slider23 = document.getElementById("0xED30");
var slider24 = document.getElementById("0x2844");
var slider25 = document.getElementById("0xB6CE");
var slider26 = document.getElementById("0xC04F");
var slider27 = document.getElementById("0xDDFB");
var slider28 = document.getElementById("0xA54E");
var slider29 = document.getElementById("0xD266");
var slider30 = document.getElementById("0xEE44");
var slider31 = document.getElementById("0x1B6B");
var slider32 = document.getElementById("0x8B2B");
var slider33 = document.getElementById("0x4AD1");
var slider34 = document.getElementById("0x2FF9");
var slider35 = document.getElementById("0x3303");
var slider36 = document.getElementById("0x84D6");
var slider37 = document.getElementById("0x561E");
var slider38 = document.getElementById("0xF156");
var slider39 = document.getElementById("0x34B1");
var slider40 = document.getElementById("HeadCategory");
var slider41 = document.getElementById("HeadTexture");
var slider42 = document.getElementById("BodyTexture");
var slider43 = document.getElementById("LegsTexture");
var slider44 = document.getElementById("BodyType");
var slider45 = document.getElementById("Waist");
var slider46 = document.getElementById("Scale");
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
var slider93 = document.getElementById("HAT");
var slider94 = document.getElementById("EYEWEAR");
var slider95 = document.getElementById("SCARF");
var slider96 = document.getElementById("MASK");
var slider97 = document.getElementById("NECKTIE");
var slider98 = document.getElementById("SHIRT");
var slider99 = document.getElementById("SUSPENDER");
var slider100 = document.getElementById("VEST");
var slider101 = document.getElementById("COAT");
var slider102 = document.getElementById("CCOAT");
var slider103 = document.getElementById("PONCHO");
var slider104 = document.getElementById("CLOAK");
var slider105 = document.getElementById("GLOVE");
var slider106 = document.getElementById("RRING");
var slider107 = document.getElementById("LRING");
var slider108 = document.getElementById("BRACELET");
var slider109 = document.getElementById("GUNBELT");
var slider110 = document.getElementById("GUNBELTACS");
var slider111 = document.getElementById("BELT");
var slider112 = document.getElementById("BUCKLE");
var slider113 = document.getElementById("LHOLSTER");
var slider114 = document.getElementById("PANT");
var slider115 = document.getElementById("SPAT");
var slider116 = document.getElementById("SKIRT");
var slider117 = document.getElementById("CHAP");
var slider118 = document.getElementById("BOOT");
var slider119 = document.getElementById("SPUR");
var slider120 = document.getElementById("GAUNTLET");
var slider121 = document.getElementById("ACCESORIE");
var slider122 = document.getElementById("SATCHEL");
var slider123 = document.getElementById("LOADOUT");
var slider124 = document.getElementById("TEETHS");


var nationSelected = false
var bodyTextureSelected = false
var legsTextureSelected = false
var bodyTypeSelected = false
var waistSelected = false
var eyesSelected = false
var headTextureSelected = false

slider0.oninput = function()  {send_change(this.value, this.id); eyesSelected = true; }
slider40.oninput = function() {send_change(this.value, this.id); nationSelected = true; }
slider41.oninput = function() {send_change(this.value, this.id); headTextureSelected = true; }
slider42.oninput = function() {send_change(this.value, this.id); bodyTextureSelected = true; }
slider43.oninput = function() {send_change(this.value, this.id); legsTextureSelected = true; }
slider44.oninput = function() {send_change(this.value, this.id); bodyTypeSelected = true;}
slider45.oninput = function() {send_change(this.value, this.id); waistSelected = true; }

slider1.oninput = function() {send_change(this.value, this.id)}
slider2.oninput = function() {send_change(this.value, this.id)}
slider3.oninput = function() {send_change(this.value, this.id)}
slider4.oninput = function() {send_change(this.value, this.id)}
slider5.oninput = function() {send_change(this.value, this.id)}
slider6.oninput = function() {send_change(this.value, this.id)}
slider7.oninput = function() {send_change(this.value, this.id)}
slider8.oninput = function() {send_change(this.value, this.id)}
slider10.oninput = function() {send_change(this.value, this.id)}
slider11.oninput = function() {send_change(this.value, this.id)}
slider12.oninput = function() {send_change(this.value, this.id)}
slider13.oninput = function() {send_change(this.value, this.id)}
slider14.oninput = function() {send_change(this.value, this.id)}
slider15.oninput = function() {send_change(this.value, this.id)}
slider16.oninput = function() {send_change(this.value, this.id)}
slider17.oninput = function() {send_change(this.value, this.id)}
slider18.oninput = function() {send_change(this.value, this.id)}
slider19.oninput = function() {send_change(this.value, this.id)}
slider20.oninput = function() {send_change(this.value, this.id)}
slider21.oninput = function() {send_change(this.value, this.id)}
slider22.oninput = function() {send_change(this.value, this.id)}
slider23.oninput = function() {send_change(this.value, this.id)}
slider24.oninput = function() {send_change(this.value, this.id)}
slider25.oninput = function() {send_change(this.value, this.id)}
slider26.oninput = function() {send_change(this.value, this.id)}
slider27.oninput = function() {send_change(this.value, this.id)}
slider28.oninput = function() {send_change(this.value, this.id)}
slider29.oninput = function() {send_change(this.value, this.id)}
slider30.oninput = function() {send_change(this.value, this.id)}
slider31.oninput = function() {send_change(this.value, this.id)}
slider32.oninput = function() {send_change(this.value, this.id)}
slider33.oninput = function() {send_change(this.value, this.id)}
slider34.oninput = function() {send_change(this.value, this.id)}
slider35.oninput = function() {send_change(this.value, this.id)}
slider36.oninput = function() {send_change(this.value, this.id)}
slider37.oninput = function() {send_change(this.value, this.id)}
slider38.oninput = function() {send_change(this.value, this.id)}
slider39.oninput = function() {send_change(this.value, this.id)}
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
slider93.oninput = function() {send_change(this.value, this.id)}
slider94.oninput = function() {send_change(this.value, this.id)}
slider95.oninput = function() {send_change(this.value, this.id)}
slider96.oninput = function() {send_change(this.value, this.id)}
slider97.oninput = function() {send_change(this.value, this.id)}
slider98.oninput = function() {send_change(this.value, this.id)}
slider99.oninput = function() {send_change(this.value, this.id)}
slider100.oninput = function() {send_change(this.value, this.id)}
slider101.oninput = function() {send_change(this.value, this.id)}
slider102.oninput = function() {send_change(this.value, this.id)}
slider103.oninput = function() {send_change(this.value, this.id)}
slider104.oninput = function() {send_change(this.value, this.id)}
slider105.oninput = function() {send_change(this.value, this.id)}
slider106.oninput = function() {send_change(this.value, this.id)}
slider107.oninput = function() {send_change(this.value, this.id)}
slider108.oninput = function() {send_change(this.value, this.id)}
slider109.oninput = function() {send_change(this.value, this.id)}
slider110.oninput = function() {send_change(this.value, this.id)}
slider111.oninput = function() {send_change(this.value, this.id)}
slider112.oninput = function() {send_change(this.value, this.id)}
slider113.oninput = function() {send_change(this.value, this.id)}
slider114.oninput = function() {send_change(this.value, this.id)}
slider115.oninput = function() {send_change(this.value, this.id)}
slider116.oninput = function() {send_change(this.value, this.id)}
slider117.oninput = function() {send_change(this.value, this.id)}
slider118.oninput = function() {send_change(this.value, this.id)}
slider119.oninput = function() {send_change(this.value, this.id)}
slider120.oninput = function() {send_change(this.value, this.id)}
slider121.oninput = function() {send_change(this.value, this.id)}
slider122.oninput = function() {send_change(this.value, this.id)}
slider123.oninput = function() {send_change(this.value, this.id)}
slider124.oninput = function() {send_change(this.value, this.id)}

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
        if (item.type === "char_maker") {
            if (item.status == true) {
                display(true)
                document.getElementById("HAIRS").max = item.maxhair;
                document.getElementById("BEARDS").max = item.maxbeard;

                document.getElementById("HAT").max = item.maxhats;
                document.getElementById("EYEWEAR").max = item.maxeyewear;
                document.getElementById("SCARF").max = item.maxscarf;
                document.getElementById("MASK").max = item.maxmask;
                document.getElementById("NECKTIE").max = item.maxnecktie;
                document.getElementById("SHIRT").max = item.maxshirt;
                document.getElementById("SUSPENDER").max = item.maxsuspender;
                document.getElementById("VEST").max = item.maxvest;
                document.getElementById("COAT").max = item.maxcoat;
                document.getElementById("CCOAT").max = item.maxccoat;
                document.getElementById("PONCHO").max = item.maxponcho;
                document.getElementById("CLOAK").max = item.maxcloak;
                document.getElementById("GLOVE").max = item.maxglove;
                document.getElementById("RRING").max = item.maxrring;
                document.getElementById("LRING").max = item.maxlring;
                document.getElementById("BRACELET").max = item.maxbracelet;
                document.getElementById("GUNBELT").max = item.maxgunbelt;
                document.getElementById("GUNBELTACS").max = item.maxgunbeltacs;
                document.getElementById("BELT").max = item.maxbelts;
                document.getElementById("BUCKLE").max = item.maxbuckles;
                document.getElementById("LHOLSTER").max = item.maxlholster;
                document.getElementById("PANT").max = item.maxpants;
                document.getElementById("SPAT").max = item.maxspats;
                document.getElementById("SKIRT").max = item.maxskirt;
                document.getElementById("CHAP").max = item.maxchap;
                document.getElementById("BOOT").max = item.maxboot;
                document.getElementById("SPUR").max = item.maxspur;
                document.getElementById("GAUNTLET").max = item.maxgauntlet;
                document.getElementById("ACCESORIE").max = item.maxaccesorie;
                document.getElementById("SATCHEL").max = item.maxsatchel;
                document.getElementById("LOADOUT").max = item.maxloadouts;
                document.getElementById("TEETHS").max = item.maxteeths;
            } else {
                display(false)
            }
        }
    })
})

$(document).keydown(function(e) {
    var key_w = 87;
    var key_s = 83;
    var key_a = 65;
    var key_d = 68;
    var key_q = 81;
    var key_e = 69;
    switch (e.keyCode) {
        case key_w:
            $.post('http://gum_character/up_key');
        break;

        case key_s:
            $.post('http://gum_character/down_key');
        break;

        case key_a:
            $.post('http://gum_character/left_key');
        break;

        case key_d:
            $.post('http://gum_character/right_key');
        break;

        case key_q:
            $.post('http://gum_character/zoom_key');
        break;

        case key_e:
            $.post('http://gum_character/unzoom_key');
        break;
    }
});
function save_character() {
    var firstname = document.getElementById("firstname").value;
    var lastname = document.getElementById("lastname").value;
    if (firstname === "" && lastname === "") {
        $.post('http://gum_character/alert_to_notify', JSON.stringify({ type:"name"}));    
    } else if (nationSelected == false) {            
        $.post('http://gum_character/alert_to_notify', JSON.stringify({ type:"nation"}));
    } else if (bodyTextureSelected === false) {
        $.post('http://gum_character/alert_to_notify', JSON.stringify({ type:"bodyTexture"}));
    } else if (legsTextureSelected === false) {
        $.post('http://gum_character/alert_to_notify', JSON.stringify({ type:"legsTexture"}));
    } else if (bodyTypeSelected === false) {
        $.post('http://gum_character/alert_to_notify', JSON.stringify({ type:"bodyType"}));
    } else if (waistSelected === false) {
        $.post('http://gum_character/alert_to_notify', JSON.stringify({ type:"waist"}));
    } else if (eyesSelected === false) {
        $.post('http://gum_character/alert_to_notify', JSON.stringify({ type:"eyes"}));
    } else if (headTextureSelected == false) {
        $.post('http://gum_character/alert_to_notify', JSON.stringify({ type:"headTexture"}));
    } else {
        $.post('http://gum_creator/save_character', JSON.stringify({ firstname:firstname, lastname:lastname}));
    }
}

function validate(id) {
    var check = document.getElementById(id);
    $.post('http://gum_creator/enable_disable', JSON.stringify({ id:id, check: check.checked}));
}

function send_change(value, id){
    $.post('http://gum_creator/send_change', JSON.stringify({ id:id, value: value}));
}
