var dataAllStorages = []
var locations = []
var myStorageData = []
var idManipulate  = 0
var sharedData = []
var myBankData = []
var contextMenu = false
var sharedBankData = []

$(document).keydown(function(e){
	var close = 27;
	var close2 = 8;
	switch (e.keyCode) {
		case close:
			$.post('http://gum_storage/exit')
            $("#storageManage").hide();
            hideMenu(); 
        break;
        case close2:
			$.post('http://gum_storage/exit')
            $("#storageManage").hide();
            hideMenu(); 
        break;
	}
});

$(function () {
    function storageMenu(bool) {
        if (bool) {
            $("#storageManage").show();
        } else {
            $("#storageManage").hide();
        }
    }
    function bankMenu(bool) {
        if (bool) {
            $("#bankManage").show();
        } else {
            $("#bankManage").hide();
        }
    }
    storageMenu(false)
    bankMenu(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "storageBuyMenu") {
            dataAllStorages = item.all
            locations = item.locations
            loadStorage()
        }
        if (item.type === "myStorage") {
            myStorageData = []
            myStorageData = item.myStorageData
            loadMyStorage(item.city)
        }
        if (item.type === "storageClose") {
            storageMenu(false)
            bankMenu(false)
        }
        if (item.type === "manipulationSharedStorage") {
            sharedData = item.myStorageData
            loadSharedTable(item.id)
        }
        if (item.type === "myBank") {
            myBankData = item.myBankData
            loadBankMenu(item.city, owned=true)
        }
        if (item.type === "openThisBank") {
            loadThisBankMenu(item.id, item.identifier, item.city, item.money, item.gold, item.borrow_pay, item.borrow_money, item.borrow, item.firstName, item.lastName, item.owned)
        }
        if (item.type === "accessListBank") {
            sharedBankData = item.sharedBankData
            loadAccessListBank(item.id)
        }
    })
})

function loadAccessListBank(bankId) {
    const tableBody = document.getElementById('gridManage');
    let dataToHtml = '';
    dataToHtml += '<div id="buttonNw" onclick="addOnBankList(\''+bankId+'\')">Add access to a bank account</div>';
    for (var a in sharedBankData) {
        dataToHtml += '<div id="buttonNw" onclick="removeFromBankList(\''+sharedBankData[a].charid+'\', \''+bankId+'\')">'+sharedBankData[a].firstname+' '+sharedBankData[a].lastname+'</div>';
    }
    tableBody.innerHTML = dataToHtml
    $("#storageManage").show();
}

function addOnBankList(id) {
    $.post('http://gum_storage/addOnBankList', JSON.stringify({
        id: id
    }))
}

function removeFromBankList(charid, storageId) {
    $.post('http://gum_storage/removeFromBankList', JSON.stringify({
        charid: charid,
        id: storageId
    }))
}


function loadThisBankMenu(id, identifier, city, money, gold, borrow_pay, borrow_money, borrow, firstname, lastname, owned) {
    const tableBody = document.getElementById('gridManage');
    let dataToHtml = '';
    dataToHtml += '<div id="buttonNw" onclick="renameThisBank(\''+id+'\', \''+city+'\')">Account name : '+identifier+'</div>';
    dataToHtml += '<div id="buttonNw">Your name : '+firstname+' '+lastname+'</div>';
    dataToHtml += '<div id="buttonNw" onclick="editMoney(\''+id+'\', \''+city+'\')">Money : '+Math.round(money * 100) / 100+' $</div>';
    dataToHtml += '<div id="buttonNw" onclick="editGold(\''+id+'\', \''+city+'\')">Gold : '+Math.round(gold * 100) / 100+'</div>';
    if (borrow_money == 0) {
        dataToHtml += '<div id="buttonNw" onclick="borrowMoney(\''+id+'\', \''+city+'\')">Borrow money</div>';
    } else {
        dataToHtml += '<div id="buttonNw">Active loan and remaining to pay : '+borrow+'$</div>';
    }
    tableBody.innerHTML = dataToHtml
    $("#storageManage").show();
}

function openAccessListBank() {
    $.post('http://gum_storage/openAccessListBank', JSON.stringify({
        id: idManipulate
    }))
}
function renameThisBank(id, city) {
    $.post('http://gum_storage/renameThisBank', JSON.stringify({
        id: id,
        city: city
    }))
}

function editMoney(id, city) {
    $.post('http://gum_storage/editMoney', JSON.stringify({
        id: id,
        city : city,
    }))
}

function editGold(id, city) {
    $.post('http://gum_storage/editGold', JSON.stringify({
        id: id,
        city : city,
    }))
}

function borrowMoney(id, city) {
    $.post('http://gum_storage/borrowMoney', JSON.stringify({
        id: id,
        city : city,
    }))
}


function loadBankMenu(city) {
    const tableBody = document.getElementById('gridManage');
    let dataToHtml = '';
    dataToHtml += '<div id="buttonNw" onclick="createNew(\''+city+'\')">Create a new account</div>';    
    for (var a in myBankData) {
        if (myBankData[a].borrow_pay == 0) {
            if (myBankData[a].owned == true) {
                dataToHtml += '<div id="buttonNoClickBank" onmouseover="over(\''+myBankData[a].id+'\')" onclick="openBank(\''+myBankData[a].id+'\', \''+city+'\', \''+myBankData[a].name+'\')">'+myBankData[a].identifier+'</br>'+myBankData[a].name+' | '+Math.round(myBankData[a].money * 100) / 100+' $ | '+Math.round(myBankData[a].gold * 100) / 100+' G</br>Loan : None</div>';    
            } else {
                dataToHtml += '<div id="buttonNoClickBankNo" onmouseover="over(\''+myBankData[a].id+'\')" onclick="openBank(\''+myBankData[a].id+'\', \''+city+'\', \''+myBankData[a].name+'\')">'+myBankData[a].identifier+'</br>'+myBankData[a].name+' | '+Math.round(myBankData[a].money * 100) / 100+' $ | '+Math.round(myBankData[a].gold * 100) / 100+' G</br>Loan : None</div>';    
            }
        } else {
            if (myBankData[a].owned == true) {
                const now = new Date(myBankData[a].borrow_pay+(1000 * 60 * 60 * 24 * 7));
                dataToHtml += '<div id="buttonNoClickBank" onmouseover="over(\''+myBankData[a].id+'\')" onclick="openBank(\''+myBankData[a].id+'\', \''+city+'\', \''+myBankData[a].name+'\')">'+myBankData[a].identifier+'</br>'+myBankData[a].name+' | '+Math.round(myBankData[a].money * 100) / 100+' $ | '+Math.round(myBankData[a].gold * 100) / 100+' G</br>Loan : '+now.customFormat( "#DD#.#MM#.")+' | Left to pay : '+myBankData[a].borrow+'$</div>';
            } else {
                const now = new Date(myBankData[a].borrow_pay+(1000 * 60 * 60 * 24 * 7));
                dataToHtml += '<div id="buttonNoClickBankNo" onmouseover="over(\''+myBankData[a].id+'\')" onclick="openBank(\''+myBankData[a].id+'\', \''+city+'\', \''+myBankData[a].name+'\')">'+myBankData[a].identifier+'</br>'+myBankData[a].name+' | '+Math.round(myBankData[a].money * 100) / 100+' $ | '+Math.round(myBankData[a].gold * 100) / 100+' G</br>Loan : '+now.customFormat( "#DD#.#MM#.")+' | Left to pay : '+myBankData[a].borrow+'$</div>';
            }
        }
    }
    tableBody.innerHTML = dataToHtml
    $("#storageManage").show();
}

function openBank(id, cityNow, bankCity) {
    $.post('http://gum_storage/openBank', JSON.stringify({
        id: id,
        cityNow: cityNow,
        bankCity: bankCity
    }))
}

function createNew(city) {
    $.post('http://gum_storage/createNew', JSON.stringify({
        city: city
    }))
}

function loadSharedTable(storageId) {
    const tableBody = document.getElementById('gridManage');
    let dataToHtml = '';
    dataToHtml += '<div id="buttonNw" onclick="addOnList(\''+storageId+'\')">Add access to the warehouse</div>';
    for (var a in sharedData) {
        dataToHtml += '<div id="buttonNw" onclick="removeFromList(\''+sharedData[a].charid+'\', \''+storageId+'\')">'+sharedData[a].firstname+' '+sharedData[a].lastname+'</div>';
    }
    tableBody.innerHTML = dataToHtml
    $("#storageManage").show();
}

function addOnList(id) {
    $.post('http://gum_storage/addOnList', JSON.stringify({
        id: id
    }))
}

function removeFromList(charid, storageId) {
    $.post('http://gum_storage/removeFromList', JSON.stringify({
        charid: charid,
        id: storageId
    }))
}

function loadStorage() {
    const tableBody = document.getElementById('gridManage');
    let dataToHtml = '';
    dataToHtml += '<div id="buttonNw" onclick="selectLocation()">Create new storage</div>';
    tableBody.innerHTML = dataToHtml
    $("#storageManage").show();
}

function loadMyStorage(city) {
    const tableBody = document.getElementById('gridManage');
    let dataToHtml = '';
    for (var a in myStorageData) {
        const now = new Date(myStorageData[a].prepay+(1000 * 60 * 60 * 24 * 7));
        if (myStorageData[a].owned == true) {
            dataToHtml += '<div id="button" onmouseover="over(\''+myStorageData[a].id+'\')" onclick="openStorage(\''+myStorageData[a].id+'\', \''+myStorageData[a].upgrade+'\', \''+city+'\', \''+myStorageData[a].city+'\', \''+myStorageData[a].payed+'\')">'+myStorageData[a].city+' | '+myStorageData[a].name+' | Vlastní</br>Platba : '+now.customFormat( "#DD#.#MM#.")+' | Prepaid : '+myStorageData[a].money+'</div>';
        } else {
            dataToHtml += '<div id="buttonNoClick" onmouseover="over(\''+myStorageData[a].id+'\')" onclick="openStorage(\''+myStorageData[a].id+'\', \''+myStorageData[a].upgrade+'\', \''+city+'\', \''+myStorageData[a].city+'\', \''+myStorageData[a].payed+'\')">'+myStorageData[a].city+' | '+myStorageData[a].name+' | Sdíleny</br>Platba : '+now.customFormat( "#DD#.#MM#.")+' | Prepaid : '+myStorageData[a].money+'</div>';
        }
    }
    tableBody.innerHTML = dataToHtml
    $("#storageManage").show();
}

function over(id) {
    if (contextMenu == false) {
        idManipulate = id
    }
}

function openStorage(id, upgrade, cityNow, city, payed) {
    $.post('http://gum_storage/exit')
    $("#storageManage").hide();
    $.post('http://gum_storage/openStorage', JSON.stringify({
        id: id,
        upgrade: upgrade,
        cityNow: cityNow,
        city: city,
        payed: payed
    }))
}

function openAccessList() {
    $.post('http://gum_storage/openAccessList', JSON.stringify({
        id: idManipulate,
    }))
}

function prepayStorage() {
    $.post('http://gum_storage/prepayStorage', JSON.stringify({
        id: idManipulate,
    }))
}
function selectLocation() {
    const tableBody = document.getElementById('gridManage');
    let dataToHtml = '';
    for (var a in locations) {
        dataToHtml += '<div id="buttonNw" onclick="buyStorage(\''+locations[a][3]+'\')">'+locations[a][3]+'</div>';
    }
    tableBody.innerHTML = dataToHtml
}


function buyStorage(location) {
    const tableBody = document.getElementById('gridManage');
    let dataToHtml = '';
    var count = 0;
    for (var a in dataAllStorages) {
        count += 1
        dataToHtml += '<div id="buttonNw" onclick="buyLevel(\''+count+'\',\''+location+'\')">Level : '+count+' | Places : '+dataAllStorages[a][0]+' kg | Price per week : '+dataAllStorages[a][1]+'$</div>';
    }
    tableBody.innerHTML = dataToHtml
}

function buyLevel(count, location) {
    $.post('http://gum_storage/buyLevel', JSON.stringify({
        level: count,
        location: location
    }))
}

Date.prototype.customFormat = function(formatString){
    var YYYY,YY,MMMM,MMM,MM,M,DDDD,DDD,DD,D,hhhh,hhh,hh,h,mm,m,ss,s,ampm,AMPM,dMod,th;
    YY = ((YYYY=this.getFullYear())+"").slice(-2);
    MM = (M=this.getMonth()+1)<10?('0'+M):M;
    MMM = (MMMM=["January","February","March","April","May","June","July","August","September","October","November","December"][M-1]).substring(0,3);
    DD = (D=this.getDate())<10?('0'+D):D;
    DDD = (DDDD=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][this.getDay()]).substring(0,3);
    th=(D>=10&&D<=20)?'th':((dMod=D%10)==1)?'st':(dMod==2)?'nd':(dMod==3)?'rd':'th';
    formatString = formatString.replace("#YYYY#",YYYY).replace("#YY#",YY).replace("#MMMM#",MMMM).replace("#MMM#",MMM).replace("#MM#",MM).replace("#M#",M).replace("#DDDD#",DDDD).replace("#DDD#",DDD).replace("#DD#",DD).replace("#D#",D).replace("#th#",th);
    h=(hhh=this.getHours());
    if (h==0) h=24;
    if (h>12) h-=12;
    hh = h<10?('0'+h):h;
    hhhh = hhh<10?('0'+hhh):hhh;
    AMPM=(ampm=hhh<12?'am':'pm').toUpperCase();
    mm=(m=this.getMinutes())<10?('0'+m):m;
    ss=(s=this.getSeconds())<10?('0'+s):s;
    return formatString.replace("#hhhh#",hhhh).replace("#hhh#",hhh).replace("#hh#",hh).replace("#h#",h).replace("#mm#",mm).replace("#m#",m).replace("#ss#",ss).replace("#s#",s).replace("#ampm#",ampm).replace("#AMPM#",AMPM);
  };
