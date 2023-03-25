local lootNow = false
local promptData1 = GetRandomIntInRange(0, 0xffffff)
local newTableWithItems = {}
local lootedId = 0
local gum
TriggerEvent("getApi",function(gumApi)
    gum = gumApi
end)
Citizen.CreateThread(function()
	gum.createPrompt("Prohledat", 0x27D1C284, promptData1, "SHORT_TIMED_EVENT_MP")
end)

Citizen.CreateThread(function()
	while true do
		local optimalization_fix = 250
		local closestPlayer, closestDistance, playerid, tgt = GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 0.5  then
			optimalization_fix = 5
			local player = PlayerPedId()
			local isDead = GetEntityHealth(player) == 0
			local isDead2 = GetEntityHealth(tgt1) == 0
			local vehicle = GetVehiclePedIsIn(player, false) == 0
			local mount = GetMount(player) == 0
			local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, tgt1)
			local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
			if (hogtied or isDead2) and not holding and mount and vehicle and not isDead then
				gum.getPrompt(promptData1, "Svázaný hráč")
				if gum.getPromptButton("Prohledat", promptData1) then
					lootedId = playerid
					playCustomAnim("mech_pickup@loot@body@long","l_neck_loot", 6100, 1)
					TriggerServerEvent("gum_search:search", playerid)
					Citizen.Wait(1000)
				end
			end
		end
		Citizen.Wait(optimalization_fix)
	end
end)

Citizen.CreateThread(function()
	while true do
		if lootNow then
			playCustomAnim("mech_pickup@loot@body@long","l_neck_loot", 6000, 1)
		end
		Citizen.Wait(6000)
	end
end)

RegisterNuiCallback("transferItem", function(data, cb)
	local id = data.id
	local count = data.count
	local weapon = data.weapon
	local item = data.item
	if weapon then
		SendNuiMessage(json.encode({type = "close"}))
		TriggerEvent("guminputs:getAnswer", "Přeješ si vzít zbraň?", "Ano", "Ne", function(cb)
			local answer = cb
			if answer == true then
				TriggerServerEvent("gum_search:takeWeapon", lootedId, id)
			end
		end)
	else
		SendNuiMessage(json.encode({type = "close"}))
		TriggerEvent("guminputs:getInput", "Potvrdit", "Kolik jich z "..count.." chceš vzít?", function(cb)
			local count = tonumber(cb)
			if count ~= 'close' and count ~= nil and count > 0 then
				local metadata = {}
				for a,b in pairs(newTableWithItems) do
					if tonumber(data.id) == b.id then
						metadata = b.metadata
					end
				end
				TriggerServerEvent("gum_search:takeItem", lootedId, id, count, metadata, item)
			end
		end)
	end
end)

RegisterNuiCallback("transferMoney", function(data, cb)
	local count = data.count
	SendNuiMessage(json.encode({type = "close"}))
	TriggerEvent("guminputs:getInput", "Potvrdit", "Kolik jich z "..count.."$ chceš vzít?", function(cb)
		local count = tonumber(cb)
		if count ~= 'close' and count ~= nil and count > 0 then
			TriggerServerEvent("gum_search:takeMoney", lootedId, count)
		end
	end)
end)
RegisterNuiCallback("transferGold", function(data, cb)
	local count = data.count
	SendNuiMessage(json.encode({type = "close"}))
	TriggerEvent("guminputs:getInput", "Potvrdit", "Kolik jich z "..count.."G chceš vzít?", function(cb)
		local count = tonumber(cb)
		if count ~= 'close' and count ~= nil and count > 0 then
			TriggerServerEvent("gum_search:takeGold", lootedId, count)
		end
	end)
end)


RegisterNuiCallback("close", function(data, cb)
	SetNuiFocus(false, false)
	ClearPedTasks(PlayerPedId())
	lootNow = false
end)

RegisterNetEvent("gum_search:search")
AddEventHandler("gum_search:search", function(inv, allItems, wep, allWeapons, money, gold)
	newTableWithItems = {}
	local newFilterInv = {}
	local newFilterWeap = {}
	for a,b in pairs(allItems) do
		newFilterInv[b.item] = b.label
	end
	for a,b in pairs(allWeapons) do
		newFilterWeap[b.item] = b.label
	end
	for a,b in pairs(inv) do
		if newFilterInv[b.item] ~= nil then
			table.insert(newTableWithItems, {id=b.itemId, item = b.item, metadata=b.metaData, count=b.count, label=newFilterInv[b.item], weapon=false})
		end
	end
	for a,b in pairs(wep) do
		if newFilterWeap[b.name] ~= nil then
			table.insert(newTableWithItems, {id=b.id, item = b.name, label=newFilterWeap[b.name], weapon=true})
		end
	end
	SetNuiFocus(true, true)
	SendNuiMessage(json.encode({type = "open", inventory = newTableWithItems, money=money, gold=gold}))
	lootNow = true
end)

function playCustomAnim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
	TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end

function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
    
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
                playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance, playerid, tgt1
end