var activeCategoryInventory = "all";
var ShopItems = [];
var selectid = 0;
var scroll = 0;
var ShowHowMany = false;

window.addEventListener("message", function (event) {
  if (event.data.type == 1) {
    $(".shop").fadeIn();
    $('.centerwrapper').css("margin-left", "37%");
    ShopItems = event.data.shopitems;
    CreateShopItems(event.data.shopitems);
    FilterItems(activeCategoryInventory, ShopItems)
  } else if (event.data.type == 2) {
    $(".shop").fadeOut();
    selectid = 0;
  }
});

function goToByScroll(id) {
  var position = id.offset().top - $("#shopInventory").offset().top + $("#shopInventory").scrollTop();
  var shopdiv = document.getElementById("shopInventory");
  shopdiv.scroll({
    top: position,
    left: 0,
    behavior: 'smooth'
  });
}


function CreateShopItems(items) {
  $("#shopInventory").html("");
  $.each(items, function (index, item) {
    var itemamount = item.amount;
    if (item.amount == -1) {
      itemamount = "∞";
    }
    $("#shopInventory").append('<div id="item-' + index + '"  data-category="' + item.category + '"class="slot">' +
      '<div class="itemimg" style = "background-image: url(nui://gum_inventory/html/images/items/' + item.img + ')">' +
      console.log(item.img),
      '<div class="item-count">' + itemamount + '</div></div>' +
      '<div class="itemtext">' +
      '<div class="itemname">' + item.label + '</div>' +
      '<div class="itemprice">' + item.price + '$</div>' +
      '</div></div>'
    );

    var cusid_ele = document.getElementById("shopInventory").getElementsByClassName('slot');
    if (selectid != 0) {
      if (index == selectid) {
        $('#item-' + selectid).addClass('active');
        goToByScroll($('#item-' + selectid))
      }
    } else {
      if (cusid_ele.length == 1) {
        $('#item-' + index).addClass('active');
      }
    }

    if (itemamount == 0) {
      $('#item-' + index).css('opacity', 0.5);
    }
    $('#item-' + index).data('item', item);
    $('#item-' + index).data('index', index);
  });


}
function delay(callback, ms) {
  var timer = 0;
  return function () {
    var context = this, args = arguments;
    clearTimeout(timer);
    timer = setTimeout(function () {
      callback.apply(context, args);
    }, ms || 0);
  };
}


$(document).keyup(delay(function (e) {

  if (e.keyCode == 13 & !ShowHowMany) { //enter
    var slot = $("#shopInventory").find('.slot.active')
    var itemdata = slot.data('item');
    var index = slot.data('index');

    if (itemdata) {
      if (itemdata.amount > 0 || -1) {
        selectid = index;
        ShowHowMany = true;
        HowMany(itemdata);
      }
    }
  }
}, 150));


function HowMany(itemdata) {
  dialog.prompt({
    title: "Quantité",
    button: "Confirmer",
    required: false,
    position: ['middle', 20],

    input: {
      type: "number"
    },
    validate: function (value) {
      if (value > 0) {
        itemdata.amount = parseInt(value);
        $.post('http:/dvr_shops/buyitem', JSON.stringify({ data: itemdata }));
      }
      return true;
    },
    callback: function (value) {
      ShowHowMany = false;
    }
  });
}

$(document).keyup(function (e) {
  if (e.keyCode == 8 || e.keyCode == 27) {
    $(".shop").fadeOut();
    dialog.close();
    ShowHowMany = false;
    $.post('http:/dvr_shops/close', JSON.stringify({}));
  }

  if (e.keyCode == 83 || e.keyCode == 40) { //s
    var slot = $("#shopInventory").find('.slot.active'),
      active = slot.next();
    if (active.length == 0) {
      slot.removeClass('active');
      $("#shopInventory").parent().find('div:first-of-type').addClass('active');
      var shopdiv = document.getElementById("shopInventory");
      shopdiv.scroll({
        top: 0,
        left: 0,
        behavior: 'smooth'
      });

    } else {
      slot.removeClass('active');
      active.addClass('active');
      goToByScroll(active);
    }
  }

  if (e.keyCode == 87 || e.keyCode == 38) { //w
    var slot = $("#shopInventory").find('.slot.active'),
      active = slot.prev();
    if (active.length == 0) {
      slot.removeClass('active');
      $("#shopInventory").parent().find('div:last-of-type').addClass('active');

      var shopdiv = document.getElementById("shopInventory");
      shopdiv.scroll({
        top: $("#shopInventory").height(),
        left: 0,
        behavior: 'smooth'
      });

    } else {
      slot.removeClass('active');
      active.addClass('active');
      goToByScroll(active);
    }
  }
});

function FilterItems(category, items) {


  $("#shopInventory").html("");
  $.each(items, function (index, item) {

    if (activeCategoryInventory == category) {

      var itemamount = item.amount;
      if (item.amount == -1) {
        itemamount = "∞";
      }
      $("#shopInventory").append('<div id="item-' + index + '"  data-category="' + item.category + '"class="slot">' +
        '<div class="itemimg" style = "background-image: url(nui://gum_inventory/html/images/items/' + item.img + ')">' +
        '<div class="item-count">' + itemamount + '</div></div>' +
        '<div class="itemtext">' +
        '<div class="itemname">' + item.label + '</div>' +
        '<div class="itemprice">' + item.price + '$</div>' +
        '</div></div>'
      );
      var cusid_ele = document.getElementById("shopInventory").getElementsByClassName('slot');
      if (selectid != 0) {
        if (index == selectid) {
          $('#item-' + selectid).addClass('active');
          goToByScroll($('#item-' + selectid))
        }
      } else {
        if (cusid_ele.length == 1) {
          $('#item-' + index).addClass('active');
        }
      }
      if (itemamount == 0) {
        $('#item-' + index).css('opacity', 0.5);
      }
      $('#item-' + index).data('item', item);
      $('#item-' + index).data('index', index);
    }
  });
}