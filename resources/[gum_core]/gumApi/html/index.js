var inInput = false
var inAnswer = false
$(document).keydown(function(e) {
    var pressenter=13;
    var close = 27;
    var close2 = 8;
    switch (e.keyCode) {
        case pressenter:
            if (inInput) {
                send_values()
            } else if (inAnswer) {
                yes_func()
            }
        break;
        case close:
            if (inInput) {
                close_input()
            } else if (inAnswer) {
                no_func()
            }
        break;

    }
});

$(function() {
    function display2(bool) {
        if (bool) {
            $("#container").fadeIn(100);
        } else {
            $("#container").fadeOut(200);
        }
    }
    function display_input(bool) {
        if (bool) {
            $("#containerInput").show();
        } else {
            $("#containerInput").hide();
        }
    }
    function display_answer(bool) {
        if (bool) {
            $("#containerInput2").show();
        } else {
            $("#containerInput2").hide();
        }
    }
    display2(false)
    display_input(false)
    display_answer(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "copyPoly") {
            var text = ""
            for (var i in item.points) {
                text += "vector3("+item.points[i].x+","+item.points[i].y+","+item.points[i].z+"),\n";
            }
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
        if (item.type === "notify") {
            if (item.status == true) {
                setTimeout(function(){ 
                    document.getElementById("title_text").innerHTML = item.title;
                    document.getElementById("text_system").innerHTML = item.text;
                    document.getElementById("iconimage").style.backgroundImage = "url('nui://"+item.folder+""+item.id+".png')";
                    display2(true)
                }, 400);
            } else {
                display2(false)
            }
        }
        if (event.data.type == "open_inputs"){
            if (event.data.status == true) {
                inInput = true
                display_input(true)
                $("#text_input").focus();
                set_input_info(event.data.title, event.data.subtext)
            } else {
                display_input(false)  
                inInput = false
            }
        }
        if (event.data.type == "open_answer"){
            if (event.data.status == true) {
                display_answer(true)
                $("#text_input").focus();
                set_input_answer(event.data.title, event.data.first, event.data.second)
            } else {
                display_answer(false)  
                inAnswer = false
            }
        }

    })

})


function set_input_info(title, subtext) {
    document.getElementById("header").innerHTML = title;
    document.getElementById("button_2").innerHTML = subtext;
}
function set_input_answer(title, first, second) {
    document.getElementById("header2").innerHTML = title;

    document.getElementById("button_2_ans").innerHTML = first;
    document.getElementById("button_1_ans").innerHTML = second;
}

function send_values() {
    if (document.getElementById("text_input").value === "") {
        document.getElementById("form_id").reset();
        $.post('http://gumApi/button_1', JSON.stringify({ text: "close" }));
    } else {
        $.post('http://gumApi/button_2', JSON.stringify({ text: document.getElementById("text_input").value }));
        document.getElementById("form_id").reset();
    }
    inInput = false;
}

function close_input() {
    document.getElementById("form_id").reset();
    $.post('http://gumApi/button_1', JSON.stringify({ text: "close" }));
    inInput = false
}

function yes_func() {
    document.getElementById("form_id").reset();
    $.post('http://gumApi/yes', JSON.stringify({ text: "yes" }));
    inAnswer = false
}

function no_func() {
    document.getElementById("form_id").reset();
    $.post('http://gumApi/no', JSON.stringify({ text: "no" }));
    inAnswer = false
}
