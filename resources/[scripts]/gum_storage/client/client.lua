local buttonsPrompt = GetRandomIntInRange(0, 0xffffff)
local buttons = {}
local cachedAll = {}
local nowInStorage = ""
local cachedBanks = {}
local firstName = ""
local lastName = ""

Citizen.CreateThread(function()
    createPrompt("Otevřít", 0x27D1C284, buttonsPrompt)
end)


RegisterCommand("st", function(source, args, rawCommand)
    TriggerServerEvent("gum_storage:openStorageCreator")
end)
RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    TriggerServerEvent("gum_storage:payBorrow")
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Locations) do		
        local blips = N_0x554d9d53f696d002(1664425300, v[1], v[2], v[3])
        SetBlipSprite(blips, -2128054417, 1)
        SetBlipScale(blips, 1.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blips, "Bank")
    end
    for k,v in pairs(Config.Storage) do
        local blipsSellSpot = N_0x554d9d53f696d002(1664425300, v[1], v[2], v[3])
        SetBlipSprite(blipsSellSpot, 3156103112, 1)
        SetBlipScale(blipsSellSpot, 1.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipsSellSpot, "Warehouse")
    end
    while true do
        local timer = 2000
        local playerCoords = GetEntityCoords(PlayerPedId())
        for a,b in pairs(Config.Storage) do
            if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, b[1], b[2], b[3], false) < 7.5 then
                nowInStorage = b[4]
                timer = 500
                if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, b[1], b[2], b[3], false) < 1.2 then
                    timer = 5
                    PromptSetActiveGroupThisFrame(buttonsPrompt, CreateVarString(10, 'LITERAL_STRING', "Warehouse"))
                    if Citizen.InvokeNative(0xE0F65F0640EF0617, buttons["Open"]) then
                        local openMe = false
                        for c,d in pairs(GetPlayers()) do
                            if d ~= PlayerId() then
                                local mycoords = GetEntityCoords(PlayerPedId())
                                local targetCoords = GetEntityCoords(GetPlayerPed(d))
                                local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, false)
                                if (2.0 > distance) then
                                    openMe = true
                                end
                            end
                        end
                        if openMe == false then
                            TriggerServerEvent("gum_storage:openStorage", b[4])
                        else
                            exports['gum_notify']:DisplayLeftNotification("Warehouse", "Someone is standing too close.", "money", 2000)
                        end
                        Citizen.Wait(1000)
                    end
                end
            end
        end
        for a,b in pairs(Config.Locations) do
            if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, b[1], b[2], b[3], false) < 7.5 then
                timer = 500
                if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, b[1], b[2], b[3], false) < 1.2 then
                    timer = 5
                    PromptSetActiveGroupThisFrame(buttonsPrompt, CreateVarString(10, 'LITERAL_STRING', "Bank"))
                    if Citizen.InvokeNative(0xE0F65F0640EF0617, buttons["Open"]) then
                        local openMe = false
                        for c,d in pairs(GetPlayers()) do
                            if d ~= PlayerId() then
                                local mycoords = GetEntityCoords(PlayerPedId())
                                local targetCoords = GetEntityCoords(GetPlayerPed(d))
                                local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, false)
                                if (2.0 > distance) then
                                    openMe = true
                                end
                            end
                        end
                        if openMe == false then
                            TriggerServerEvent("gum_storage:openBank", a)
                        else
                            exports['gum_notify']:DisplayLeftNotification("Warehouse", "Someone is standing too close.", "money", 2000)
                        end
                        Citizen.Wait(1000)
                    end
                end
            end
        end
        Citizen.Wait(timer)
    end
end)

function GetPlayers()
	local players = {}
	for i = 0, 32 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end
	return players
end



RegisterNetEvent("gum_storage:openCreator")
AddEventHandler("gum_storage:openCreator", function(storageData, newStorage)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "storageBuyMenu",
        all = Config.StorageLevels,
        locations = Config.Storage,
    })
end)

RegisterNetEvent("gum_storage:openBank")
AddEventHandler("gum_storage:openBank", function(bankData, charId, city, first, last)
    cachedBanks = bankData
    firstName = first
    lastName = last
    local myBanks = {}
    for a,b in pairs(bankData) do
        if tonumber(charId) == tonumber(b.charidentifier) then
            if b.name == city then
                table.insert(myBanks, {id=b.id, identifier=b.identifier, charidentifier=b.charidentifier, name=b.name, money=b.money, gold=b.gold, borrow=b.borrow, borrow_pay=b.borrow_pay, borrow_money=b.borrow_money, owned=true})
            end
        end
    end
    for a,b in pairs(bankData) do
        for c,d in pairs(json.decode(b.shared)) do
            if tonumber(d.charid) == tonumber(charId) then
                if b.name == city then
                    table.insert(myBanks, {id=b.id, identifier=b.identifier, charidentifier=b.charidentifier, name=b.name, money=b.money, gold=b.gold, borrow=b.borrow, borrow_pay=b.borrow_pay, borrow_money=b.borrow_money, owned=false})
                end
            end
        end
    end
    Citizen.Wait(0)
    for a,b in pairs(bankData) do
        if tonumber(charId) == tonumber(b.charidentifier) then
            if b.name ~= city then
                table.insert(myBanks, {id=b.id, identifier=b.identifier, charidentifier=b.charidentifier, name=b.name, money=b.money, gold=b.gold, borrow=b.borrow, borrow_pay=b.borrow_pay, borrow_money=b.borrow_money, owned=true})
            end
        end
    end
    for a,b in pairs(bankData) do
        for c,d in pairs(json.decode(b.shared)) do
            if tonumber(d.charid) == charId then
                if b.name ~= city then
                    table.insert(myBanks, {id=b.id, identifier=b.identifier, charidentifier=b.charidentifier, name=b.name, money=b.money, gold=b.gold, borrow=b.borrow, borrow_pay=b.borrow_pay, borrow_money=b.borrow_money, owned=false})
                end
            end
        end
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "myBank",
        myBankData = myBanks,
        city = city,
    })
end)

RegisterNetEvent("gum_storage:updateBank")
AddEventHandler("gum_storage:updateBank", function(bankData, charId, city, first, last)
    cachedBanks = bankData
    firstName = first
    lastName = last
    local myBanks = {}
    for a,b in pairs(bankData) do
        if tonumber(charId) == tonumber(b.charidentifier) then
            if b.name == city then
                table.insert(myBanks, {id=b.id, identifier=b.identifier, charidentifier=b.charidentifier, name=b.name, money=b.money, gold=b.gold, borrow=b.borrow, borrow_pay=b.borrow_pay, borrow_money=b.borrow_money, owned=true})
            end
        end
    end
    for a,b in pairs(bankData) do
        for c,d in pairs(json.decode(b.shared)) do
            if tonumber(d.charid) == tonumber(charId) then
                if b.name == city then
                    table.insert(myBanks, {id=b.id, identifier=b.identifier, charidentifier=b.charidentifier, name=b.name, money=b.money, gold=b.gold, borrow=b.borrow, borrow_pay=b.borrow_pay, borrow_money=b.borrow_money, owned=false})
                end
            end
        end
    end
    Citizen.Wait(0)
    for a,b in pairs(bankData) do
        if tonumber(charId) == tonumber(b.charidentifier) then
            if b.name ~= city then
                table.insert(myBanks, {id=b.id, identifier=b.identifier, charidentifier=b.charidentifier, name=b.name, money=b.money, gold=b.gold, borrow=b.borrow, borrow_pay=b.borrow_pay, borrow_money=b.borrow_money, owned=true})
            end
        end
    end
    for a,b in pairs(bankData) do
        for c,d in pairs(json.decode(b.shared)) do
            if tonumber(d.charid) == charId then
                if b.name ~= city then
                    table.insert(myBanks, {id=b.id, identifier=b.identifier, charidentifier=b.charidentifier, name=b.name, money=b.money, gold=b.gold, borrow=b.borrow, borrow_pay=b.borrow_pay, borrow_money=b.borrow_money, owned=false})
                end
            end
        end
    end
    SendNUIMessage({
        type = "myBank",
        myBankData = myBanks,
        city = city,
    })
end)

RegisterNUICallback('addOnBankList', function(data, cb)
    TriggerEvent("guminputs:getInput", "Confirm", "What ID to add?", function(cb)
        local charId = tostring(cb)
        if charId ~= nil and charId ~= 'close' then
            TriggerServerEvent("gum_storage:addUserToSharedBank", data.id, charId)
        end
    end)
end)

RegisterNUICallback('removeFromBankList', function(data, cb)
    TriggerServerEvent("gum_storage:removeUserFromSharedBank", data.id, data.charid)
end)

RegisterNUICallback('openAccessListBank', function(data, cb)
    for a,b in pairs(cachedBanks) do
        if tonumber(b.id) == tonumber(data.id) then
            local shared = json.decode(b.shared)
            SendNUIMessage({
                type = "accessListBank",
                shared = shared,
                id = data.id,
            })
        end
    end
end)

RegisterNUICallback('createNew', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "storageClose",})
    TriggerEvent("guminputs:getInput", "Confirm", "Account name?", function(cb)
        local name = tostring(cb)
        if name ~= nil and name ~= 'close' then
            TriggerServerEvent("gum_storage:createNew", data.city, name)
        end
    end)
end)

RegisterNUICallback('editMoney', function(data, cb)
    TriggerEvent("guminputs:getAnswer", "Do you want to deposit or choose?", "Invest", "Select", function(cb)
        local answer = cb
        if answer == true then 
            TriggerEvent("guminputs:getInput", "Confirm", "How much do you want to transfer?", function(cb)
                local count = tonumber(cb)
                if count ~= nil and count ~= 'close' and count > 0 then
                    TriggerServerEvent("gum_storage:editMoney", data.id, count, "add", data.city)
                end
            end)
        else
            TriggerEvent("guminputs:getInput", "Confirm", "How much do you want to transfer?", function(cb)
                local count = tonumber(cb)
                if count ~= nil and count ~= 'close' and count > 0 then
                    TriggerServerEvent("gum_storage:editMoney", data.id, count, "remove", data.city)
                end
            end)
        end
    end)
end)

RegisterNUICallback('editGold', function(data, cb)
    TriggerEvent("guminputs:getAnswer", "Chceš vlozit nebo vybrat?", "Vložit", "Vybrat", function(cb)
        local answer = cb
        if answer == true then 
            TriggerEvent("guminputs:getInput", "Confirm", "How much do you want to transfer?", function(cb)
                local count = tonumber(cb)
                if count ~= nil and count ~= 'close' and count > 0 then
                    TriggerServerEvent("gum_storage:editGold", data.id, count, "add", data.city)
                end
            end)
        else
            TriggerEvent("guminputs:getInput", "Confirm", "How much do you want to transfer?", function(cb)
                local count = tonumber(cb)
                if count ~= nil and count ~= 'close' and count > 0 then
                    TriggerServerEvent("gum_storage:editGold", data.id, count, "remove", data.city)
                end
            end)
        end
    end)
end)

RegisterNUICallback('borrowMoney', function(data, cb)
    TriggerEvent("guminputs:getInput", "Confirm", "How much do you want to borrow? (Max  100$)", function(cb)
        local count = tonumber(cb)
        if count ~= nil and count ~= 'close' and count > 0 then
            if count <= 100 and count > 0 then
                TriggerServerEvent("gum_storage:borrowMoney", data.id, count, data.city)
            else
                exports['gum_notify']:DisplayLeftNotification("Bank", "Max 100$.", "money", 2000)
            end
        end
    end)
end)

RegisterNUICallback('openBank', function(data, cb)
    if data.bankCity ~= data.cityNow then
        exports['gum_notify']:DisplayLeftNotification("Bank", "You can't open a bank account that you have elsewhere.", "money", 2000)
        return false
    end
    for a,b in pairs(cachedBanks) do
        if b.id == tonumber(data.id) then
            SendNUIMessage({
                type = "openThisBank",
                id = b.id,
                identifier = b.identifier,
                city = data.cityNow,
                money = b.money,
                gold = b.gold,
                borrow_pay = b.borrow_pay,
                borrow_money = b.borrow_money,
                borrow = b.borrow,
                firstName = firstName,
                lastName = lastName,
            })
        end
    end
end)

RegisterNUICallback('renameThisBank', function(data, cb)
    TriggerEvent("guminputs:getInput", "Confirm", "Rename to?", function(cb)
        local name = tostring(cb)
        if name ~= nil and name ~= 'close' then
            TriggerServerEvent("gum_storage:renameThisBank", data.id, name, data.city)
        end
    end)
end)


RegisterNetEvent("gum_storage:openStorage")
AddEventHandler("gum_storage:openStorage", function(storageData, charId, city)
    cachedAll = storageData
    local myStorages = {}
    for a,b in pairs(storageData) do
        if tonumber(charId) == b.charid then
            if b.city == city then
                table.insert(myStorages, {id=b.id, charid=b.charid, name=b.name, city=b.city, upgrade=b.upgrade, shared=b.shared, prepay=b.prepay, money=b.money, owned=true, payed=b.payed})
            end
        end
    end
    for a,b in pairs(storageData) do
        for c,d in pairs(json.decode(b.shared)) do
            if tonumber(d.charid) == charId then
                if b.city == city then
                    table.insert(myStorages, {id=b.id, charid=b.charid, name=b.name, city=b.city, upgrade=b.upgrade, shared=b.shared, prepay=b.prepay, money=b.money, owned=false, payed=b.payed})
                end
            end
        end
    end

    for a,b in pairs(storageData) do
        if tonumber(charId) == b.charid then
            if b.city ~= city then
                table.insert(myStorages, {id=b.id, charid=b.charid, name=b.name, city=b.city, upgrade=b.upgrade, shared=b.shared, prepay=b.prepay, money=b.money, owned=true, payed=b.payed})
            end
        end
    end
    for a,b in pairs(storageData) do
        for c,d in pairs(json.decode(b.shared)) do
            if tonumber(d.charid) == charId then
                if b.city ~= city then
                    table.insert(myStorages, {id=b.id, charid=b.charid, name=b.name, city=b.city, upgrade=b.upgrade, shared=b.shared, prepay=b.prepay, money=b.money, owned=false, payed=b.payed})
                end
            end
        end
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "myStorage",
        myStorageData = myStorages,
        city = city,
    })
end)


RegisterNUICallback('openAccessList', function(data, cb)
    local sharedListForJs = {}
    for a,b in pairs(cachedAll) do
        if tonumber(data.id) == tonumber(b.id) then
            for c,d in pairs(json.decode(b.shared)) do
                table.insert(sharedListForJs, {charid=d.charid, firstname=d.firstname, lastname=d.lastname})
            end
            SendNUIMessage({
                type = "manipulationSharedStorage",
                myStorageData = sharedListForJs,
                id = data.id,
            })
        end
    end
end)

RegisterNetEvent("gum_storage:updateStoragePrepare")
AddEventHandler("gum_storage:updateStoragePrepare", function(storageData, charId)
    cachedAll = storageData
    local myStorages = {}
    for a,b in pairs(storageData) do
        if tonumber(charId) == b.charid then
            table.insert(myStorages, {id=b.id, charid=b.charid, name=b.name, city=b.city, upgrade=b.upgrade, shared=b.shared, prepay=b.prepay, money=b.money, owned=true, payed=b.payed})
        end
    end
    for a,b in pairs(storageData) do
        for c,d in pairs(json.decode(b.shared)) do
            if tonumber(d.charid) == charId then
                table.insert(myStorages, {id=b.id, charid=b.charid, name=b.name, city=b.city, upgrade=b.upgrade, shared=b.shared, prepay=b.prepay, money=b.money, owned=false, payed=b.payed})
            end
        end
    end
    SendNUIMessage({
        type = "myStorage",
        myStorageData = myStorages,
        city = city,
    })
end)


RegisterNetEvent("gum_storage:updateSharedBankTable")
AddEventHandler("gum_storage:updateSharedBankTable", function(shared, bankId)
    local sharedListForJs = {}
    for c,d in pairs(json.decode(shared)) do
        table.insert(sharedListForJs, {charid=d.charid, firstname=d.firstname, lastname=d.lastname})
    end
    SendNUIMessage({
        type = "accessListBank",
        sharedBankData = sharedListForJs,
        id = bankId,
    })
end)

RegisterNetEvent("gum_storage:updateSharedTable")
AddEventHandler("gum_storage:updateSharedTable", function(shared, storageId)
    local sharedListForJs = {}
    for c,d in pairs(json.decode(shared)) do
        table.insert(sharedListForJs, {charid=d.charid, firstname=d.firstname, lastname=d.lastname})
    end
    SendNUIMessage({
        type = "manipulationSharedStorage",
        myStorageData = sharedListForJs,
        id = storageId,
    })
end)


RegisterNUICallback('addOnList', function(data, cb)
    TriggerEvent("guminputs:getInput", "Confirm", "What ID to add?", function(cb)
        local charId = tostring(cb)
        if charId ~= nil and charId ~= 'close' then
            TriggerServerEvent("gum_storage:addUserToShared", data.id, charId)
        end
    end)
end)

RegisterNUICallback('removeFromList', function(data, cb)
    TriggerServerEvent("gum_storage:removeUserFromShared", data.id, data.charid)
end)

RegisterNUICallback('prepayStorage', function(data, cb)
    TriggerEvent("guminputs:getInput", "Confirm", "How much do you want to subscribe?", function(cb)
        local howMuch = tonumber(cb)
        if howMuch ~= nil and howMuch ~= 'close' then
            TriggerServerEvent("gum_storage:prepayStorage", data.id, howMuch)
        end
    end)
end)

RegisterNUICallback('openStorage', function(data, cb)
    local upgradeSize = 0
    for k,v in pairs(Config.StorageLevels) do
        if k == tonumber(data.upgrade) then
            upgradeSize = v[1]
        end
    end
    print(data.payed)
    if tonumber(data.payed) == 1 then
        exports['gum_notify']:DisplayLeftNotification("Warehouse", "You don't have to pay to rent a warehouse. Pay it and wait for the billing period.", "money", 2000)
        return false
    end
    if data.city ~= data.cityNow then
        exports['gum_notify']:DisplayLeftNotification("Warehouse", "You can't open a warehouse halfway across the state.", "money", 2000)
        return false
    end
    TriggerServerEvent("gumCore:registerstorage", GetPlayerServerId(PlayerId()), "storage_"..data.id, upgradeSize)
    Citizen.Wait(100)
    TriggerServerEvent("gumCore:openstorage", GetPlayerServerId(PlayerId()), "storage_"..data.id)
end)

function createPrompt(text, key, promptHash)
	buttonPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
	PromptSetControlAction(buttonPrompt, key)
	PromptSetText(buttonPrompt, CreateVarString(10, 'LITERAL_STRING', text))
	PromptSetEnabled(buttonPrompt, true)
	PromptSetVisible(buttonPrompt, true)
    PromptSetStandardizedHoldMode(buttonPrompt, GetHashKey("MEDIUM_TIMED_EVENT"))
	PromptSetGroup(buttonPrompt, promptHash)
	PromptRegisterEnd(buttonPrompt)
    buttons[text] = buttonPrompt
end


RegisterNUICallback('buyLevel', function(data, cb)
    TriggerEvent("guminputs:getInput", "Confirm", "What Telegram number do you want to set up a warehouse on?", function(cb)
        local charId = tostring(cb)
        if charId ~= nil and charId ~= 'close' then
            TriggerEvent("guminputs:getInput", "Confirm", "Repository name?", function(cb)
                local nameStorage = tostring(cb)
                if nameStorage ~= nil and nameStorage ~= 'close' then
                    for k,v in pairs(Config.StorageLevels) do
                        if k == tonumber(data.level) then
                            TriggerEvent("guminputs:getAnswer", "Buy in "..data.location.." "..Config.StorageLevels[k][1].."kg za "..Config.StorageLevels[k][2].."$", "Ano", "Ne", function(cb)
                                local answer = cb
                                if answer == true then
                                    print("Purchase "..nameStorage.." in "..data.location.." | "..Config.StorageLevels[k][1].." for "..Config.StorageLevels[k][2].." $ pour ", charId)
                                    TriggerServerEvent("gum_storage:createStorage", nameStorage, charId, data.location, tonumber(data.level))
                                end
                            end)
                        end
                    end
                end
            end)
        end
    end)
end)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
end)
