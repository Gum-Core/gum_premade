var character_table = {}
var count_char = 0
var switchto = 0
$(function() {
    function display2(bool) {
        if (bool) {
            $("#container").fadeIn(100);
        } else {
            $("#container").fadeOut(200);
        }
    }
    function display(bool) {
        if (bool) {
            $("#container2").fadeIn(200);
        } else {
            $("#container2").hide();
        }
    }
    display(false)
    display2(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "loading_info") {
            if (item.status == true) {
                display2(true)
            } else {
                display2(false)
            }
        }
        if (item.type === "character_info") {
            if (item.status == true) {
                display(true)
                character_table = item.table
                count_char = item.countchar
                load_info(item.first, item.last, item.job, item.money, item.gold, item.sex)
            } else {
                display(false)
            }
        }
        // if (item.type === "volume_stop") {
        //     if (item.status == true) {
        //         stop_volume()
        //     } else {
        //         play_volume()
        //     }
        // }

    })

})

function play_volume() {
    document.querySelector("video").play();
}
function stop_volume() {
    document.querySelector("video").pause();
}

function load_info(firstname, lastname, job, money, gold, sex) {
    document.getElementById("name_text").innerHTML = firstname+" "+lastname;
    document.getElementById("gender_text").innerHTML = sex;
    document.getElementById("money_text").innerHTML = money;
    document.getElementById("gold_text").innerHTML = gold;
    document.getElementById("job_text").innerHTML = job;
}

function switch_char() {
    if (switchto < count_char-1) {
        switchto = switchto+1
    } else if (Number(switchto) === Number(count_char-1)) {
        switchto = 0
    }
    if (JSON.parse(character_table[switchto].skinPlayer).sex === "mp_female") {
        sex = "Female"
    } else {
        sex = "Male"
    }
    document.getElementById("name_text").innerHTML = character_table[switchto].firstname+" "+character_table[switchto].lastname;
    document.getElementById("gender_text").innerHTML = sex;
    document.getElementById("money_text").innerHTML = character_table[switchto].money;
    document.getElementById("gold_text").innerHTML = character_table[switchto].gold;
    document.getElementById("job_text").innerHTML = character_table[switchto].job;
    $.post('http://gum_character/switch_char', JSON.stringify({ char: switchto+1}));
}

function select_char() {
    $.post('http://gum_character/select_char', JSON.stringify({ char: switchto+1}));
}

function make_new() {
    $.post('http://gum_character/make_new');
}
