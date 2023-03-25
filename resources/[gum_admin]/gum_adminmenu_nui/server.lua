local gumCore = {}
local first_check = false

TriggerEvent("getCore",function(core)
    gumCore = core
end)
inv = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()


local reportTable = {}

RegisterCommand('report', function(source, args, rawCommand)
    local _source = source
    local splitArgs = table.concat(args, ' ')
    local user = gumCore.getUser(_source)
    local char = user.getUsedCharacter
    local charIdentifier = char.charIdentifier
    local steamIdentifier = char.identifier
    local date=os.date("%d.%m %I:%M")
    table.insert(reportTable, {title=args[1], text=splitArgs,steamid=steamIdentifier,charid=charIdentifier,source=_source,date=date})
    for a,b in pairs(GetPlayers()) do
        local user = gumCore.getUser(b)
        for c,d in pairs(Config.Permissions) do
            if c == user.group then
                if d.supportSys == true then
                    TriggerEvent("gum_adminmenu_nui:resendToAdmin", b, _source, args[1], splitArgs)
                end
            end
        end
        Citizen.Wait(50)
    end
end, false)

RegisterServerEvent('gum_adminmenu_nui:resendToAdmin')
AddEventHandler('gum_adminmenu_nui:resendToAdmin', function(source, idPlayer, title, text)
    local _source = source
    gumCore.Report(idPlayer, title, text)
    TriggerClientEvent("gum_adminmenu_nui:printMe", _source, idPlayer, title, text)
end)

RegisterCommand('admin', function(source, args, rawCommand)
    local _source = source
    local user = gumCore.getUser(_source)
    local canOpen = false
    local cleanTable = {}
    for k,v in pairs(Config.Permissions) do
        if k == user.group then
            canOpen = true
        end
    end
    Citizen.Wait(0)
    for a, b in pairs(GetPlayers()) do
        local user2 = gumCore.getUser(b)
        if user2 ~= nil then
            local char2 = user2.getUsedCharacter
            local charIdentifier = char2.charIdentifier
            table.insert(cleanTable, {source=b,playerName=GetPlayerName(b),playerHex=GetPlayerIdentifier(b), charId=charIdentifier})
        end
        Citizen.Wait(0)
    end
    Citizen.Wait(0)
    if canOpen == true then
        exports.ghmattimysql:execute('SELECT item,label,`limit` FROM items' , {}, function(result)
            print("OPEN ME")
            TriggerClientEvent("gum_adminmenu_nui:open", _source, user.group, result, cleanTable, reportTable)
        end)
    else
        gumCore.Error("You dont have permissions")
    end
end)
RegisterCommand('spectate', function(source, args, rawCommand)
    local _source = source
    local user = gumCore.getUser(_source)
    local canOpen = false
    for k,v in pairs(Config.Permissions) do
        if k == user.group then
            canOpen = true
        end
    end
    if canOpen == true then
        if Config.OneSync == false then
            TriggerClientEvent("gum_adminmenu_nui:spectate", _source, args[1])
        else
            TriggerClientEvent("gum_adminmenu_nui:spectateOS", _source, args[1], GetEntityCoords(GetPlayerPed(args[1])))
        end
    else
        gumCore.Error("You dont have permissions")
    end
end)
RegisterCommand("revive", function(source, args)
    if args ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            local id =  args[1]
            if id ~= nil then
                TriggerClientEvent('gum_character:revive_player', id, 1)
            else
                TriggerClientEvent('gum_character:revive_player', _source, 1)
            end
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)

RegisterCommand("n", function(source, args)
    local _source = source
    local user = gumCore.getUser(_source)
    local canOpen = false
    for k,v in pairs(Config.Permissions) do
        if k == user.group then
            canOpen = true
        end
    end
    if canOpen == true then
        TriggerClientEvent('gum_adminmenu_nui:noClip', _source)
    else
        gumCore.Error("You dont have permissions")
    end
end)

RegisterCommand("tpw", function(source, args)
    local _source = source
    local user = gumCore.getUser(_source)
    local canOpen = false
    for k,v in pairs(Config.Permissions) do
        if k == user.group then
            canOpen = true
        end
    end
    if canOpen == true then
        TriggerClientEvent('gum_adminmenu_nui:tpw', _source)
    else
        gumCore.Error("You dont have permissions")
    end
end)


RegisterCommand("tpc", function(source, args)
    if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            TriggerClientEvent('gum_adminmenu_nui:tpc', _source, args[1], args[2], args[3])
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)

RegisterCommand("tpb", function(source, args)
    local _source = source
    local user = gumCore.getUser(_source)
    local canOpen = false
    for k,v in pairs(Config.Permissions) do
        if k == user.group then
            canOpen = true
        end
    end
    if canOpen == true then
        TriggerClientEvent('gum_adminmenu_nui:tpb', _source)
    else
        gumCore.Error("You dont have permissions")
    end
end)

RegisterCommand("giveitem", function(source, args)
    if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            inv.addItem(args[1], args[2], args[3])
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)

RegisterCommand("giveweapon", function(source, args)
    if args[1] ~= nil and args[2] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            inv.createWeapon(tonumber(args[1]), args[2],  {}, {})
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)

RegisterCommand("givemoney", function(source, args)
    if args[1] ~= nil and args[2] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            local char = user.getUsedCharacter
            char.addCurrency(args[1], 0, tonumber(args[2]))
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)
RegisterCommand("givegold", function(source, args)
    if args[1] ~= nil and args[2] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            local char = user.getUsedCharacter
            char.addCurrency(args[1], 1, tonumber(args[2]))
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)

RegisterCommand("changeped", function(source, args)
    if args[1] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            TriggerClientEvent('gum_adminmenu_nui:ped', _source, args[1])
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)


RegisterCommand("kick", function(source, args)
    if args[1] ~= nil and args[2] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            TriggerClientEvent('gum_adminmenu_nui:kick', _source, args[1], args[2])
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)


RegisterCommand("tpp", function(source, args)
    if args[1] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            if Config.OneSync == true then
                TriggerClientEvent('gum_adminmenu_nui:tppwo', _source, args[1], GetEntityCoords(GetPlayerPed(args[1])))
            else
                TriggerClientEvent('gum_adminmenu_nui:tpp', _source, args[1])
            end
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)

RegisterCommand("bring", function(source, args)
    if args[1] ~= nil then
        local _source = source
        local user = gumCore.getUser(_source)
        local canOpen = false
        for k,v in pairs(Config.Permissions) do
            if k == user.group then
                canOpen = true
            end
        end
        if canOpen == true then
            if Config.OneSync == true then
                TriggerClientEvent('gum_adminmenu_nui:bringOW', args[1], GetEntityCoords(GetPlayerPed(_source)))
            else
                TriggerClientEvent('gum_adminmenu_nui:bring', args[1], _source)
            end
        else
            gumCore.Error("You dont have permissions")
        end
    end
end)


RegisterServerEvent('gum_adminmenu_nui:giveItem')
AddEventHandler('gum_adminmenu_nui:giveItem', function(item)
    local _source = source
    inv.addItem(_source, item, 1)
end)
RegisterServerEvent('gum_adminmenu_nui:bringMe')
AddEventHandler('gum_adminmenu_nui:bringMe', function(id, Coords)
    TriggerClientEvent("gum_adminmenu_nui:bring", id, Coords)
end)

RegisterServerEvent('gum_adminmenu_nui:giveWeaponId')
AddEventHandler('gum_adminmenu_nui:giveWeaponId', function(id, weaponHash)
    inv.createWeapon(tonumber(id), weaponHash,  {}, {})
end)

RegisterServerEvent('gum_adminmenu_nui:tepOnPlayer')
AddEventHandler('gum_adminmenu_nui:tepOnPlayer', function(id)
    local _source = source
    local playerCoords = GetEntityCoords(GetPlayerPed(id))
	TriggerClientEvent("gum_adminmenu_nui:tepOnPlayer", _source, playerCoords)
end)

RegisterServerEvent("gum_adminmenu_nui:kickFromServer")
AddEventHandler("gum_adminmenu_nui:kickFromServer", function(target, why)
	DropPlayer(target, "\n\n You are kicked from server. \n\n Reason : \n "..why.."")
end)

RegisterServerEvent("gum_adminmenu_nui:banOnServer")
AddEventHandler("gum_adminmenu_nui:banOnServer", function(target, banreason, datetim)
    local identifier = GetPlayerIdentifier(target)
    local Parameters = { ['identifier'] = identifier, ['reason'] = banreason, ["date"] = datetim}
    exports.ghmattimysql:execute("INSERT INTO bans ( `identifier`,`reason`,`date`) VALUES (@identifier,@reason,@date)", Parameters)
	DropPlayer(target, "\n\n You are banned. \n\n Reason : \n "..banreason.." \n\n To date : "..datetim.."")
end)

Citizen.CreateThread(function()
    exports.ghmattimysql:execute("DELETE FROM bans WHERE date < now() - interval 1 HOUR;", {}, function()
        print("^2[Banneds] Database: ^0Checking and Deleting olds bans!")
    end)
end)