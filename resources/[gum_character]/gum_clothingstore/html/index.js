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
        if (item.type === "clothing_maker") {
            if (item.status == true) {
                display(true)
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
            } else {
                display(false)
            }
        }


        if (item.type === "clothing_data_now") {
            if (item.status == true) {
                document.getElementById("HAT").value = item.hats;
                document.getElementById("hatText").innerHTML = "Hat - " + item.hats
                document.getElementById("EYEWEAR").value = item.eyewear;
                document.getElementById("eyeText").innerHTML = "Eyewear - " + item.eyewear
                document.getElementById("SCARF").value = item.scarf;
                document.getElementById("scarfText").innerHTML = "Scarf - " + item.scarf
                document.getElementById("MASK").value = item.mask;
                document.getElementById("MaskText").innerHTML = "Mask - " + item.mask
                document.getElementById("NECKTIE").value = item.necktie;
                document.getElementById("NeckText").innerHTML = "Necktie - " + item.necktie
                document.getElementById("SHIRT").value = item.shirt;
                document.getElementById("ShirtText").innerHTML = "Shirt - " + item.shirt
                document.getElementById("SUSPENDER").value = item.suspender;
                document.getElementById("SuspenderText").innerHTML = "Suspender - " + item.suspender
                document.getElementById("VEST").value = item.vest;
                document.getElementById("VestText").innerHTML = "Vest - " + item.vest
                document.getElementById("COAT").value = item.coat;
                document.getElementById("CoatText").innerHTML = "Coat - " + item.coat
                document.getElementById("CCOAT").value = item.ccoat;
                document.getElementById("CCOatText").innerHTML = "Ccoat - " + item.ccoat
                document.getElementById("PONCHO").value = item.poncho;
                document.getElementById("PonchoText").innerHTML = "Poncho - " + item.poncho
                document.getElementById("CLOAK").value = item.cloak;
                document.getElementById("CloakText").innerHTML = "Cloak - " + item.cloak
                document.getElementById("GLOVE").value = item.glove;
                document.getElementById("GloveText").innerHTML = "Glove - " + item.glove
                document.getElementById("RRING").value = item.rring;
                document.getElementById("RRingText").innerHTML = "Rring - " + item.rring
                document.getElementById("LRING").value = item.lring;
                document.getElementById("LRingText").innerHTML = "Lring - " + item.lring
                document.getElementById("BRACELET").value = item.bracelet;
                document.getElementById("BraceletText").innerHTML = "Bracelet - " + item.bracelet
                document.getElementById("GUNBELT").value = item.gunbelt;
                document.getElementById("GunBeltText").innerHTML = "Gunbelt - " + item.gunbelt
                document.getElementById("GUNBELTACS").value = item.gunbeltacs;
                document.getElementById("GunAccText").innerHTML = "Gunbeltacs - " + item.gunbeltacs
                document.getElementById("BELT").value = item.belts;
                document.getElementById("BeltText").innerHTML = "Belt - " + item.belts
                document.getElementById("BUCKLE").value = item.buckles;
                document.getElementById("BuckleText").innerHTML = "Buckle - " + item.buckles
                document.getElementById("LHOLSTER").value = item.lholster;
                document.getElementById("LHolsterText").innerHTML = "Lholster - " + item.lholster
                document.getElementById("PANT").value = item.pants;
                document.getElementById("PantText").innerHTML = "Pant - " + item.pants
                document.getElementById("SPAT").value = item.spats;
                document.getElementById("SpatText").innerHTML = "Spat - " + item.spats
                document.getElementById("SKIRT").value = item.skirt;
                document.getElementById("SkirtText").innerHTML = "Skirt - " + item.skirt
                document.getElementById("CHAP").value = item.chap;
                document.getElementById("ChapText").innerHTML = "Chap - " + item.chap
                document.getElementById("BOOT").value = item.boot;
                document.getElementById("BootText").innerHTML = "Boot - " + item.boot
                document.getElementById("SPUR").value = item.spur;
                document.getElementById("SpurText").innerHTML = "Spur - " + item.spur
                document.getElementById("GAUNTLET").value = item.gauntlet;
                document.getElementById("GauntletText").innerHTML = "Gauntlet - " + item.gauntlet
                document.getElementById("ACCESORIE").value = item.accesorie;
                document.getElementById("AccText").innerHTML = "Accesorie - " + item.accesorie
                document.getElementById("SATCHEL").value = item.satchel;
                document.getElementById("SatchelText").innerHTML = "Satchel - " + item.satchel
                document.getElementById("LOADOUT").value = item.loadouts;
                document.getElementById("LoadoutText").innerHTML = "Loadout - " + item.loadouts
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
    var close1 = 27;
    var close2 = 8;
    switch (e.keyCode) {
        case key_w:
            $.post('http://gum_clothingstore/up_key');
        break;

        case key_s:
            $.post('http://gum_clothingstore/down_key');
        break;

        case key_a:
            $.post('http://gum_clothingstore/left_key');
        break;

        case key_d:
            $.post('http://gum_clothingstore/right_key');
        break;

        case key_q:
            $.post('http://gum_clothingstore/zoom_key');
        break;

        case key_e:
            $.post('http://gum_clothingstore/unzoom_key');
        break;

        case close1:
            $.post('http://gum_clothingstore/close');
        break;
        case close2:
            $.post('http://gum_clothingstore/close');
        break;
    }
});

function save_character() {
    $.post('http://gum_clothingstore/save_clothing', JSON.stringify({}));
}

function send_change(value, id){
    $.post('http://gum_clothingstore/send_change', JSON.stringify({ id:id, value: value}));
}
