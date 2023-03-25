local eWeaponAttachPoint ={WEAPON_ATTACH_POINT_INVALID = -1,	WEAPON_ATTACH_POINT_HAND_PRIMARY = 0,    WEAPON_ATTACH_POINT_PISTOL_R = 2,    WEAPON_ATTACH_POINT_PISTOL_L = 3,    WEAPON_ATTACH_POINT_KNIFE = 4,    WEAPON_ATTACH_POINT_LASSO = 5,    WEAPON_ATTACH_POINT_THROWER = 6,    WEAPON_ATTACH_POINT_BOW = 7,    WEAPON_ATTACH_POINT_BOW_ALTERNATE = 8,    WEAPON_ATTACH_POINT_RIFLE = 9,    WEAPON_ATTACH_POINT_RIFLE_ALTERNATE = 10,    WEAPON_ATTACH_POINT_LANTERN = 11,    WEAPON_ATTACH_POINT_TEMP_LANTERN = 12,    WEAPON_ATTACH_POINT_MELEE = 13,    WEAPON_ATTACH_POINT_HIP = 14,    WEAPON_ATTACH_POINT_BOOT = 15,    WEAPON_ATTACH_POINT_BACK = 16,    WEAPON_ATTACH_POINT_FRONT = 17,    WEAPON_ATTACH_POINT_SHOULDERSLING = 18,    WEAPON_ATTACH_POINT_LEFTBREAST = 19,    WEAPON_ATTACH_POINT_RIGHTBREAST = 20,    WEAPON_ATTACH_POINT_LEFTARMPIT = 21,    WEAPON_ATTACH_POINT_RIGHTARMPIT = 22,    WEAPON_ATTACH_POINT_LEFTARMPIT_RIFLE = 23,    WEAPON_ATTACH_POINT_LEFTARMPIT_BOW = 25,    WEAPON_ATTACH_POINT_RIGHT_HAND_EXTRA = 26,    WEAPON_ATTACH_POINT_LEFT_HAND_EXTRA = 27,    WEAPON_ATTACH_POINT_RIGHT_HAND_AUX = 28,};
local ammo_list = {{0x38854A3B,"AMMO_MOONSHINEJUG"},{0x38854A3B,"AMMO_MOONSHINEJUG_MP"},{0x38854A3B,"AMMO_POISONBOTTLE"},{0x3854A3B, "AMMO_RIFLE_ELEPHANT"},{0x38854A3B,"AMMO_HATCHET"},{0x38854A3B,"AMMO_HATCHET_ANCIENT"},{0x38854A3B,"AMMO_HATCHET_CLEAVER"},{0x38854A3B,"AMMO_HATCHET_DOUBLE_BIT"},{0x38854A3B,"AMMO_HATCHET_DOUBLE_BIT_RUSTED"},{0x38854A3B,"AMMO_HATCHET_DOUBLE_BIT_RUSTED"},{0x38854A3B,"AMMO_HATCHET_HEWING"},{0x38854A3B,"AMMO_HATCHET_HUNTER"},{0x38854A3B,"AMMO_HATCHET_HUNTER_RUSTED"},{0x38854A3B,"AMMO_HATCHET_VIKING"},	{0x38854A3B,"AMMO_ARROW"},	{0x38854A3B,"AMMO_22"},	{0x38854A3B,"AMMO_22_TRANQUILIZER"}, {0x38854A3B, "AMMO_REPEATER_SPLIT_POINT"}, {0x38854A3B,"AMMO_BOLAS"}, {0x5B6ABDF8,"AMMO_ARROW_DYNAMITE"},	{0xD19E0045,"AMMO_ARROW_FIRE"},	{0xD62A5A6C,"AMMO_ARROW_POISON"},	{0x3250353B,"AMMO_ARROW_IMPROVED"},	{0x9BD3BBB,"AMMO_ARROW_SMALL_GAME"},	{0xBB8A699D,"AMMO_DYNAMITE"},	{0xDC91634B,"AMMO_DYNAMITE_VOLATILE"},	{0x6AB063DE,"AMMO_MOLOTOV"},	{0xF8FB3AC1,"AMMO_MOLOTOV_VOLATILE"},	{0x80766738,"AMMO_PISTOL"},	{0xF1A91F32,"AMMO_PISTOL_EXPRESS"},	{0x331B008B,"AMMO_PISTOL_EXPRESS_EXPLOSIVE"},	{0x46F7AA64,"AMMO_PISTOL_HIGH_VELOCITY"},	{0xAD60BB5F,"AMMO_PISTOL_SPLIT_POINT"},	{0x5E490BAA,"AMMO_REPEATER"},	{0x197A9C10,"AMMO_REPEATER_EXPRESS"},	{0x2390F9C2,"AMMO_REPEATER_EXPRESS_EXPLOSIVE"},	{0x4FFBFA8C,"AMMO_REPEATER_HIGH_VELOCITY"},	{0x4CE87556,"AMMO_REVOLVER"},	{0x3C932F5C,"AMMO_REVOLVER_EXPRESS"},	{0xAFD00F7F,"AMMO_REVOLVER_EXPRESS_EXPLOSIVE"},	{0x129C46F,"AMMO_REVOLVER_HIGH_VELOCITY"},	{0x9C6310D4,"AMMO_REVOLVER_SPLIT_POINT"},	{0xBAFF5180,"AMMO_RIFLE"},	{0x2CE404A4,"AMMO_RIFLE_EXPRESS"},	{0x9116173,"AMMO_RIFLE_EXPRESS_EXPLOSIVE"},	{0xF76DC763,"AMMO_RIFLE_HIGH_VELOCITY"},	{0xC1711828,"AMMO_RIFLE_SPLIT_POINT"},	{0xB7DB96B8,"AMMO_RIFLE_VARMINT"},	{0x58B272F9,"AMMO_SHOTGUN"},	{0xC71EE56D,"AMMO_SHOTGUN_BUCKSHOT_INCENDIARY"},	{0x3450D03C,"AMMO_SHOTGUN_SLUG"},	{0x4BB641AD,"AMMO_SHOTGUN_EXPRESS_EXPLOSIVE"},	{0xCFE15715,"AMMO_THROWING_KNIVES"},	{0xB846FB5B,"AMMO_THROWING_KNIVES_IMPROVED"},	{0x9AE0598E,"AMMO_THROWING_KNIVES_POISON"},	{0xB09A8B19,"AMMO_TOMAHAWK"},	{0x7B87DF4F,"AMMO_TOMAHAWK_HOMING"},	{0x4F384312,"AMMO_TOMAHAWK_IMPROVED"}};
local inventory_table, weapon_table, dropped_items, dropped_items_entity = {}, {}, {}, {}
local weapon_first_used, weapon_second_used, rifle_first_used, rifle_second_used = false, false, false, false
local active = false
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local condition_level = {}
local money_state = 0
local gold_state = 0
local storage_table = {}
local size = 0
local backup_save_throw = 0
local is_last_ammo = false
local logged_true = true
local id_container = 0
local equip_spam = false
local speed, count_in_inventory, backupAmmo = 0, 0.0, 0
local can_save,attackUpdate, ignorMeForLoadThrow, ignorMeForLoadNormal = false, false, false, false
local slot1,slot2,slot3,slot4,slot5 = "", "", "", "", ""
local xRes,yRes = 0.0,0.0
local saveTableFilter, saveTableFilter2, backupAmmoNormal, ammoNormal, backupAmmoThrow, ammoThrow = {}, {}, {}, {}, {}, {}
local transferCount, waitForInteraction = 0, nil
local isAttachedToPlayer = false
local canSkipWeapon = false
local blockSpamming = false

function Button_Prompt()
	Citizen.CreateThread(function()
		local str = Config.Language[0].text
		PickItemGround = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(PickItemGround, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(PickItemGround, str)
		PromptSetEnabled(PickItemGround, true)
		PromptSetVisible(PickItemGround, true)
		PromptSetHoldMode(PickItemGround, true)
		PromptSetGroup(PickItemGround, buttons_prompt)
		PromptRegisterEnd(PickItemGround)
	end)
end

function Show_Items(bool)
    SetNuiFocus(bool, bool)
    guiEnabled = bool
    SendNUIMessage({
        type = "inventory_table",
        status = bool,
		table_for_json = inventory_table,
		wtable_for_json = weapon_table,
		max_limit_i = Config.Max_Items,
		max_limit_w = Config.Max_Weapons,
		money = money_state,
		gold = gold_state,
	})
end

function Show_Other(bool, open, storage)
	id_container = open
    SetNuiFocus(bool, bool)
    guiEnabled = bool
    SendNUIMessage({
        type = "container_table",
        status = bool,
		table_for_json = inventory_table,
		wtable_for_json = weapon_table,
		max_limit_i = Config.Max_Items,
		max_limit_w = Config.Max_Weapons,
		money = money_state,
		gold = gold_state,
		id_con = open,
		strg_tbl = storage,
		size = size,
	})
end

RegisterNetEvent('gum_inventory:reset_inventory')
AddEventHandler('gum_inventory:reset_inventory', function()
	inventory_table,weapon_table, dropped_items, dropped_items_entity, condition_level, storage_table = {}, {}, {}, {}, {}, {}
	weapon_first_used, weapon_second_used, rifle_first_used, rifle_second_used, is_last_ammo = false, false, false, false, false
	money_state, gold_state, size, backup_save_throw = 0, 0, 0, 0
	TriggerServerEvent("gum_inventory:clear_inventory")
	RemoveAllWeapons()
end)

RegisterNetEvent('gum_inventory:get_storage')
AddEventHandler('gum_inventory:get_storage', function(storage, itm, wpn, id, sizes)
	storage_table = {}
	Citizen.Wait(0)
	size = sizes
	for k,v in pairs(storage) do
		if v.item == 'gold' then
			if v.count == nil then
				table.insert(storage_table, {weapon=false, label=Config.Language[1].text, item="gold", count=0, limit=0.2})
			else
				table.insert(storage_table, {weapon=false, label=Config.Language[1].text, item="gold", count=(math.floor(v.count*10)/10), limit=0.2})
			end
		end
		if v.item == 'money' then
			if v.count == nil then
				table.insert(storage_table, {weapon=false, label=Config.Language[2].text, item="money", count=0, limit=0.2})
			else
				table.insert(storage_table, {weapon=false, label=Config.Language[2].text, item="money", count=(math.floor(v.count*10)/10), limit=0.2})
			end
		end
		if v.name == nil then
			for k2,v2 in pairs(itm) do
				if v.item == v2.item then
					table.insert(storage_table, {weapon=false, label=v2.label, item=v.item, count=v.count, limit=v2.limit, metaData=v.metaData, itemId=v.itemId})
				end
			end
		else
			for k2,v2 in pairs(wpn) do
				if v.name == v2.item then
					table.insert(storage_table, {weapon=true, label=v2.label, item=v.item, count=v.name, limit=1})
				end
			end
		end
	end
	Show_Other(true, id, storage_table, money_state, size, gold_state)
end)

RegisterNetEvent('gum_inventory:refresh_storage')
AddEventHandler('gum_inventory:refresh_storage', function(storage, itm, wpn,id)
	storage_table = {}
	for k,v in pairs(storage) do
		if v.item == 'gold' then
			if v.count == nil then
				table.insert(storage_table, {weapon=false, label=Config.Language[1].text, item="gold", count=0, limit=0.2})
			else
				table.insert(storage_table, {weapon=false, label=Config.Language[1].text, item="gold", count=(math.floor(v.count*10)/10), limit=0.2})
			end
		end
		if v.item == 'money' then
			if v.count == nil then
				table.insert(storage_table, {weapon=false, label=Config.Language[2].text, item="money", count=0, limit=0.2})
			else
				table.insert(storage_table, {weapon=false, label=Config.Language[2].text, item="money", count=(math.floor(v.count*10)/10), limit=0.2})
			end
		end
		if v.name == nil then
			for k2,v2 in pairs(itm) do
				if v.item == v2.item then
					table.insert(storage_table, {weapon=false, label=v2.label, item=v.item, count=v.count, limit=v2.limit, metaData=v.metaData, itemId=v.itemId})
				end
			end
		else
			for k2,v2 in pairs(wpn) do
				if v.name == v2.item then
					table.insert(storage_table, {weapon=true, label=v2.label, item=v.item, count=v.name, limit=1})
				end
			end
		end
	end
	Citizen.Wait(100)
	Show_Other(true, id, storage_table, money_state, size)
end)

RegisterNUICallback('cancelBlock', function(data, cb)
	blockSpamming = false
	SendNUIMessage({type = "cleanTransfer"})
end)

RegisterNUICallback('hotbar_set', function(data, cb)
	if (tonumber(data.slot) == 1) then
		slot1 = data.item
	elseif (tonumber(data.slot) == 2) then
		slot2 = data.item
	elseif (tonumber(data.slot) == 3) then
		slot3 = data.item
	elseif (tonumber(data.slot) == 4) then
		slot4 = data.item
	elseif (tonumber(data.slot) == 5) then
		slot5 = data.item
	end
end)

RegisterNUICallback('transfer_from_storage', function(data, cb)
	if blockSpamming == true then
		return false
	end
	waitForInteraction = nil
	if data.item == "money" then
		SendNUIMessage({type = "input_data", status=true, count=data.count})
		blockSpamming = true
		Citizen.CreateThread(function()
			while waitForInteraction == nil do
				if waitForInteraction == false then
					blockSpamming = false
					break 
				end
				Citizen.Wait(0)
			end
			if waitForInteraction == true then
				if transferCount ~= nil then
					if transferCount ~= 'close' and transferCount > 0 and tonumber(data.count) >= tonumber(transferCount) then
						TriggerServerEvent("gum_inventory:transfer_money_from_storage", data.item, transferCount, id_container)
					else
						Show_Other(true, id_container, storage_table, money_state, size)
						SendNUIMessage({type = "cleanTransfer"})
					end
				else
					Show_Other(true, id_container, storage_table, money_state, size)
					SendNUIMessage({type = "cleanTransfer"})
				end
			end
		end)
	elseif data.item == "gold" then
		Citizen.CreateThread(function()
			SendNUIMessage({type = "input_data", status=true, count=data.count})
			while waitForInteraction == nil do
				if waitForInteraction == false then
					blockSpamming = false
					break 
				end
				Citizen.Wait(0)
			end
			if waitForInteraction == true then
				if transferCount ~= nil then
					if transferCount ~= 'close' and transferCount > 0 and tonumber(data.count) >= tonumber(transferCount) then
						TriggerServerEvent("gum_inventory:transfer_gold_from_storage", data.item, transferCount, id_container)
					else
						Show_Other(true, id_container, storage_table, money_state, size)
						SendNUIMessage({type = "cleanTransfer"})
					end
				else
					Show_Other(true, id_container, storage_table, money_state, size)
					SendNUIMessage({type = "cleanTransfer"})
				end
			end
		end)
	else
		if data.weapon == false then
			if tonumber(data.countInInventory) == 1 then
				if tonumber(data.count) >= tonumber(1) and Config.Max_Items >= tonumber(count_in_inventory+1*data.limit) then
					local emptyMetadata = false
					if data.metaData ~= nil then
						for z,x in pairs(data.metaData) do
							emptyMetadata = true
						end
					end
					if emptyMetadata == true then
						TriggerServerEvent("gum_inventory:transfer_item_from_storage", data.item, 1, id_container, data.itemId, data.metaData)
					else
						TriggerServerEvent("gum_inventory:transfer_item_from_storage", data.item, 1, id_container, data.itemId, nil)
						SendNUIMessage({type = "cleanTransfer"})
					end
				else
					Show_Other(true, id_container, storage_table, money_state, size)
					SendNUIMessage({type = "cleanTransfer"})
				end
			else
				SendNUIMessage({type = "input_data", status=true, count=data.count})
				Citizen.CreateThread(function()
					while waitForInteraction == nil do
						if waitForInteraction == false then
							blockSpamming = false
							break 
						end
						Citizen.Wait(0)
					end
					if waitForInteraction == true then
						if transferCount ~= nil then
							if transferCount ~= 'close' and tonumber(transferCount) > 0 and tonumber(data.count) >= tonumber(transferCount) and Config.Max_Items >= tonumber(count_in_inventory+transferCount*data.limit) then
								local emptyMetadata = false
								if data.metaData ~= nil then
									for z,x in pairs(data.metaData) do
										emptyMetadata = true
									end
								end
								if math.type(tonumber(transferCount)) == "integer" then 
									if emptyMetadata == true then
										TriggerServerEvent("gum_inventory:transfer_item_from_storage", data.item, transferCount, id_container, data.itemId, data.metaData)
									else
										TriggerServerEvent("gum_inventory:transfer_item_from_storage", data.item, transferCount, id_container, data.itemId, nil)
									end
								else
									exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[47].text, 'money', 2000)
								end
							else
								Show_Other(true, id_container, storage_table, money_state, size)
								SendNUIMessage({type = "cleanTransfer"})
							end
						else
							Show_Other(true, id_container, storage_table, money_state, size)
							SendNUIMessage({type = "cleanTransfer"})
						end
					end
				end)
			end
		else
			if data.used == 1 then
				Show_Other(true, id_container, storage_table, money_state, size)
				SendNUIMessage({type = "cleanTransfer"})
				exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[7].text, 'pistol', 2000)
			else
				TriggerServerEvent("gum_inventory:transfer_weapon_from_storage", data.item, id_container)
			end
		end
	end
end)

RegisterNUICallback('transfer_to_storage', function(data, cb)
	waitForInteraction = nil
	if data.item == "money" then
		SendNUIMessage({type = "input_data", status=true, count=data.count})
		Citizen.CreateThread(function()
			while waitForInteraction == nil do
				if waitForInteraction == false then
					break 
				end
				Citizen.Wait(0)
			end
			if waitForInteraction == true then
				if transferCount ~= nil then
					if transferCount ~= 'close' and tonumber(transferCount) > 0 and tonumber(data.count) >= tonumber(transferCount) and tonumber(size) >= (data.size+transferCount*0.2) then
						TriggerServerEvent("gum_inventory:transfer_money_to_storage", "money", transferCount, id_container)
					else
						Show_Other(true, id_container, storage_table, money_state, size)
					end
				else
					Show_Other(true, id_container, storage_table, money_state, size)
				end
			end
		end)
	elseif data.item == "gold" then
		SendNUIMessage({type = "input_data", status=true, count=data.count})
		Citizen.CreateThread(function()
			while waitForInteraction == nil do
				if waitForInteraction == false then
					break 
				end
				Citizen.Wait(0)
			end
			if waitForInteraction == true then
				if transferCount ~= nil then
					if transferCount ~= 'close' and tonumber(transferCount) > 0 and tonumber(data.count) >= tonumber(transferCount) then
						TriggerServerEvent("gum_inventory:transfer_gold_to_storage", "gold", transferCount, id_container)
					else
						Show_Other(true, id_container, storage_table, money_state, size)
					end
				else
					Show_Other(true, id_container, storage_table, money_state, size)
				end
			end
		end)
	else
		if data.weapon == false then
			if tonumber(data.countInInventory) == 1 then
				if tonumber(size) >= tonumber(data.size)+tonumber(1*data.limit) then
					local emptyMetadata = false
					if data.metaData ~= nil then
						for z,x in pairs(data.metaData) do
							emptyMetadata = true
						end
					end
					if emptyMetadata == true then
						TriggerServerEvent("gum_inventory:transfer_item_to_storage", data.item, 1, id_container, data.itemId, data.metaData)
					else
						TriggerServerEvent("gum_inventory:transfer_item_to_storage", data.item, 1, id_container, data.itemId, nil)
					end
				else
					Show_Other(true, id_container, storage_table, money_state, size)
					exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[8].text, 'pistol', 2000)
				end
			else
				SendNUIMessage({type = "input_data", status=true, data.item, count=data.count})
				Citizen.CreateThread(function()
					while waitForInteraction == nil do
						if waitForInteraction == false then
							break 
						end
						Citizen.Wait(0)
					end
					if waitForInteraction == true then
						if data.size <= data.size+size then
							if data.weapon == false then
								if tonumber(data.countInInventory) == 1 then
									if tonumber(size) >= tonumber(data.size)+tonumber(1*data.limit) then
										local emptyMetadata = false
										if data.metaData ~= nil then
											for z,x in pairs(data.metaData) do
												emptyMetadata = true
											end
										end
										if emptyMetadata == true then
											TriggerServerEvent("gum_inventory:transfer_item_to_storage", data.item, 1, id_container, data.itemId, data.metaData)
										else
											TriggerServerEvent("gum_inventory:transfer_item_to_storage", data.item, 1, id_container, data.itemId, nil)
										end
									else
										Show_Other(true, id_container, storage_table, money_state, size)
										exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[8].text, 'pistol', 2000)
									end
								else
							
									if data ~= nil then
										if transferCount ~= nil then
											if transferCount ~= 'close' and transferCount > 0 and data.count >= transferCount then
												if tonumber(size) >= tonumber(data.size)+tonumber(transferCount*data.limit) then
													local emptyMetadata = false
													if data.metaData ~= nil then
														for z,x in pairs(data.metaData) do
															emptyMetadata = true
														end
													end
													if math.type(tonumber(transferCount)) == "integer" then 
														if emptyMetadata == true then
															TriggerServerEvent("gum_inventory:transfer_item_to_storage", data.item, transferCount, id_container, data.itemId, data.metaData)
														else
															TriggerServerEvent("gum_inventory:transfer_item_to_storage", data.item, transferCount, id_container, data.itemId, nil)
														end
													else
														exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[47].text, 'money', 2000)
													end
												else
													Show_Other(true, id_container, storage_table, money_state, size)
													exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[8].text, 'pistol', 2000)
												end
											else
												Show_Other(true, id_container, storage_table, money_state, size)
											end
										else
											Show_Other(true, id_container, storage_table, money_state, size)
										end
									else
										Show_Other(true, id_container, storage_table, money_state, size)
									end
								end
							end
						end
					end
				end)
			end
		else
			if data.used == 1 then
				Show_Other(true, id_container, storage_table, money_state, size)
				exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[7].text, 'pistol', 2000)
			else
				TriggerServerEvent("gum_inventory:transfer_weapon_to_storage", data.id, data.item, id_container)
			end
		end
	end
end)
RegisterNUICallback('transferAcceptItem', function(data, cb)
	transferCount = tonumber(data.count)
	waitForInteraction = true
end)
RegisterNUICallback('transferLeaveItem', function(data, cb)
	waitForInteraction = false
end)

RegisterCommand("inv", function(source, args, rawCommand)
	Show_Items(true)
end)

-- RegisterCommand("locker_update", function(source, args, rawCommand)
-- 	TriggerServerEvent("gumCore:updatestorage", GetPlayerServerId(PlayerId()), args[1], args[2])
-- end)

-- RegisterCommand("locker_open", function(source, args, rawCommand)
--  	TriggerServerEvent("gumCore:openstorage", GetPlayerServerId(PlayerId()), args[1])
-- end)

-- RegisterCommand("locker_create", function(source, args, rawCommand)
-- 	TriggerServerEvent("gumCore:registerstorage", GetPlayerServerId(PlayerId()), args[1], args[2])
-- end)

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
	Citizen.CreateThread(function() 
		Citizen.Wait(5000)
		TriggerServerEvent("gum_inventory:get_items")
		Citizen.Wait(500)
		TriggerServerEvent("gum_inventory:get_money")
		Citizen.Wait(1000)
		equip_weapon_login()
		Citizen.Wait(500)
        TriggerEvent("gum_inventory:reload_weap")
		Button_Prompt()
	end)
	Citizen.CreateThread(function()
		while true do
			if can_save then
				saveThrowAmmo()
				saveWeaponAmmo()
			end
            for _, player in ipairs(GetActivePlayers()) do
                SetPedPromptName(GetPlayerPed(player), "Občan (" .. tostring(GetPlayerServerId(player))..")")
			end
			Citizen.Wait(5000)
		end
	end)
end)

function saveWeaponAmmo()
	saveTableFilter = {}
	local saveWhat = {}
	local saveItNow, haveDualSame = false, false
	local _1, rightHand = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
	local _2, leftHand = GetCurrentPedWeapon(PlayerPedId(), true, 1, true)
	local _3, rightHolster = GetCurrentPedWeapon(PlayerPedId(), true, 2, true)
	local _4, leftHolster = GetCurrentPedWeapon(PlayerPedId(), true, 3, true)
	local weaponCounter, firstWeapon, secondWeapon = 0, 0, 0
	if rightHand ~= -1569615261 and rightHand ~= 0 then
		weaponCounter = weaponCounter+1
		firstWeapon = rightHand
	end
	if leftHand ~= -1569615261 and rightHand ~= 0 then
		weaponCounter = weaponCounter+1
		secondWeapon = leftHand
	end
	if rightHolster ~= -1569615261 and rightHand ~= 0 then
		weaponCounter = weaponCounter+1
		firstWeapon = rightHolster
	end
	if leftHolster ~= -1569615261 and rightHand ~= 0 then
		weaponCounter = weaponCounter+1
		secondWeapon = leftHolster
	end
	if Citizen.InvokeNative(0xDDC64F5E31EEDAB6, GetHashKey(weapon_first_used)) and Citizen.InvokeNative(0xDDC64F5E31EEDAB6, GetHashKey(weapon_second_used)) then
		haveDualSame = true
	end
	if Citizen.InvokeNative(0xC212F1D05A8232BB, GetHashKey(weapon_first_used)) and Citizen.InvokeNative(0xC212F1D05A8232BB, GetHashKey(weapon_second_used)) then
		haveDualSame = true
	end
	for a,b in pairs(ammo_list) do
		if string.match(b[2], "revolver") or string.match(b[2], "REVOLVER") and not string.match(b[2], "AMMO_22") then
			ammoNormal[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoNormal[b[2]] ~= backupAmmoNormal[b[2]] then
				backupAmmoNormal[b[2]] = ammoNormal[b[2]]
				if ignorMeForLoadNormal == true then
					saveItNow = true
					saveWhat[1] = "revolver"
				end
			end
		elseif string.match(b[2], "pistol") or string.match(b[2], "PISTOL") and not string.match(b[2], "AMMO_22") then
			ammoNormal[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoNormal[b[2]] ~= backupAmmoNormal[b[2]] then
				backupAmmoNormal[b[2]] = ammoNormal[b[2]]
				if ignorMeForLoadNormal == true then
					saveItNow = true
					saveWhat[2] = "pistol"
				end
			end
		elseif string.match(b[2], "repeater") or string.match(b[2], "REPEATER") and not string.match(b[2], "AMMO_22") then
			ammoNormal[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoNormal[b[2]] ~= backupAmmoNormal[b[2]] then
				backupAmmoNormal[b[2]] = ammoNormal[b[2]]
				if ignorMeForLoadNormal == true then
					saveItNow = true
					saveWhat[1] = "repeater"
				end
			end
		elseif string.match(b[2], "shotgun") or string.match(b[2], "SHOTGUN") and not string.match(b[2], "AMMO_22") then
			ammoNormal[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoNormal[b[2]] ~= backupAmmoNormal[b[2]] then
				backupAmmoNormal[b[2]] = ammoNormal[b[2]]
				if ignorMeForLoadNormal == true then
					saveItNow = true
					if weaponCounter >= 2 then
						saveWhat[2] = "shotgun"
					else
						saveWhat[1] = "shotgun"
					end
				end
			end
		elseif string.match(b[2], "rifle") or string.match(b[2], "RIFLE") and not string.match(b[2], "AMMO_22") then
			ammoNormal[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoNormal[b[2]] ~= backupAmmoNormal[b[2]] then
				backupAmmoNormal[b[2]] = ammoNormal[b[2]]
				if ignorMeForLoadNormal == true then
					saveItNow = true
					saveWhat[1] = "rifle"
				end
			end
		elseif string.match(b[2], "arrow") or string.match(b[2], "ARROW") and not string.match(b[2], "AMMO_22") then
			ammoNormal[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoNormal[b[2]] ~= backupAmmoNormal[b[2]] then
				backupAmmoNormal[b[2]] = ammoNormal[b[2]]
				if ignorMeForLoadNormal == true then
					saveItNow = true
					saveWhat[1] = "arrow"
				end
			end
		elseif (not string.match(b[2], "rifle") or not string.match(b[2], "RIFLE")) and string.match(b[2], "AMMO_22") then
			ammoNormal[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoNormal[b[2]] ~= backupAmmoNormal[b[2]] then
				backupAmmoNormal[b[2]] = ammoNormal[b[2]]
				if ignorMeForLoadNormal == true then
					saveItNow = true
					saveWhat[1] = "varmint"
				end
			end
		else
		end
	end
	if saveItNow == true and saveWhat ~= nil then
		if saveWhat[1] =="revolver" then
			local weaponId = 0
			for a,b in pairs(ammoNormal) do
				if string.match(a, "revolver") or string.match(a, "REVOLVER") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			if weaponCounter == 2 and haveDualSame ~= false then
				for k,v in pairs(weapon_table) do
					if v.used == 1 then
						if string.match(v.name, "revolver") or string.match(v.name, "REVOLVER") then
							weaponId = v.id
							if v.conditionlevel == nil then
								v.conditionlevel = 0.0
							end
							if condition_level[v.id] == nil then
								condition_level[v.id] = 0.0
							end
							if v.conditionlevel+0.01 <= 1.0 then
								v.conditionlevel = condition_level[v.id]+0.01
								condition_level[v.id] = v.conditionlevel
								local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
								Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
								Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
								condition_level[v.id] = tonumber(v.conditionlevel)
							else
								v.conditionlevel = 1.0
								condition_level[v.id] = 1.0
								local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
								Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
								Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
								condition_level[v.id] = tonumber(v.conditionlevel)
							end
						end
					end
				end
				Citizen.Wait(0)
				TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId, saveTableFilter, condition_level[weaponId])
			else
				for k,v in pairs(weapon_table) do
					if v.used == 1 then
						if string.match(v.name, "revolver") or string.match(v.name, "REVOLVER") then
							weaponId = v.id
							if v.conditionlevel == nil then
								v.conditionlevel = 0.0
							end
							if condition_level[v.id] == nil then
								condition_level[v.id] = 0.0
							end
							if v.conditionlevel+0.01 <= 1.0 then
								v.conditionlevel = condition_level[v.id]+0.01
								condition_level[v.id] = v.conditionlevel
								local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
								Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
								Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
								condition_level[v.id] = tonumber(v.conditionlevel)
							else
								v.conditionlevel = 1.0
								condition_level[v.id] = 1.0
								local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
								Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
								Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
								condition_level[v.id] = tonumber(v.conditionlevel)
							end
						end
					end
				end
				Citizen.Wait(0)
				TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId, saveTableFilter, condition_level[weaponId])
			end
		end
		if saveWhat[2] == "pistol" then
			local weaponId2 = 0
			for a,b in pairs(ammoNormal) do
				if string.match(a, "pistol") or string.match(a, "PISTOL") then
					saveTableFilter2[a] = b
				end
			end
			Citizen.Wait(0)
			if weaponCounter == 2 and haveDualSame ~= false then
				for k,v in pairs(weapon_table) do
					if v.used == 1 then
						if string.match(v.name, "pistol") or string.match(v.name, "PISTOL") then
							weaponId2 = v.id
							if v.conditionlevel == nil then
								v.conditionlevel = 0.0
							end
							if condition_level[v.id] == nil then
								condition_level[v.id] = 0.0
							end
							if v.conditionlevel+0.01 <= 1.0 then
								v.conditionlevel = condition_level[v.id]+0.01
								condition_level[v.id] = v.conditionlevel
								local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
								Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
								Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
								condition_level[v.id] = tonumber(v.conditionlevel)
							else
								v.conditionlevel = 1.0
								condition_level[v.id] = 1.0
								local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
								Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
								Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
								condition_level[v.id] = tonumber(v.conditionlevel)
							end
						end
					end
				end
				Citizen.Wait(0)
				TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId2, saveTableFilter2, condition_level[weaponId2])
			else
				for k,v in pairs(weapon_table) do
					if v.used == 1 then
						if string.match(v.name, "pistol") or string.match(v.name, "PISTOL") then
							weaponId = v.id
							if v.conditionlevel == nil then
								v.conditionlevel = 0.0
							end
							if condition_level[v.id] == nil then
								condition_level[v.id] = 0.0
							end
							if v.conditionlevel+0.01 <= 1.0 then
								v.conditionlevel = condition_level[v.id]+0.01
								condition_level[v.id] = v.conditionlevel
								local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
								Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
								Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
								condition_level[v.id] = tonumber(v.conditionlevel)
							else
								v.conditionlevel = 1.0
								condition_level[v.id] = 1.0
								local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
								Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
								Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
								condition_level[v.id] = tonumber(v.conditionlevel)
							end
						end
					end
				end
				Citizen.Wait(0)
				TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId, saveTableFilter2, condition_level[weaponId])
			end
		end
		if saveWhat[1] =="repeater" then
			local weaponId = 0
			for a,b in pairs(ammoNormal) do
				if string.match(a, "repeater") or string.match(a, "REPEATER") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			for k,v in pairs(weapon_table) do
				if v.used == 1 then
					if string.match(v.name, "REPEATER") or string.match(v.name, "repeater") then
						weaponId = v.id
						if v.conditionlevel == nil then
							v.conditionlevel = 0.0
						end
						if condition_level[v.id] == nil then
							condition_level[v.id] = 0.0
						end
						if v.conditionlevel+0.01 <= 1.0 then
							v.conditionlevel = condition_level[v.id]+0.01
							condition_level[v.id] = v.conditionlevel
							local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
							Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
							Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
							condition_level[v.id] = tonumber(v.conditionlevel)
						else
							v.conditionlevel = 1.0
							condition_level[v.id] = 1.0
							local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
							Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
							Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
							condition_level[v.id] = tonumber(v.conditionlevel)
						end
					end
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId, saveTableFilter, condition_level[weaponId])
		end
		if saveWhat[1] =="shotgun" or saveWhat[2] == "shotgun" then
			local weaponId = 0
			for a,b in pairs(ammoNormal) do
				if string.match(a, "shotgun") or string.match(a, "SHOTGUN") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			for k,v in pairs(weapon_table) do
				if v.used == 1 then
					if string.match(v.name, "shotgun") or string.match(v.name, "SHOTGUN") then
						weaponId = v.id
						if v.conditionlevel == nil then
							v.conditionlevel = 0.0
						end
						if condition_level[v.id] == nil then
							condition_level[v.id] = 0.0
						end
						if v.conditionlevel+0.01 <= 1.0 then
							v.conditionlevel = condition_level[v.id]+0.01
							condition_level[v.id] = v.conditionlevel
							local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
							Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
							Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
							condition_level[v.id] = tonumber(v.conditionlevel)
						else
							v.conditionlevel = 1.0
							condition_level[v.id] = 1.0
							local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
							Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
							Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
							condition_level[v.id] = tonumber(v.conditionlevel)
						end
					end
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId, saveTableFilter, condition_level[weaponId])
		end
		if saveWhat[1] =="rifle" then
			local weaponId = 0
			for a,b in pairs(ammoNormal) do
				if string.match(a, "rifle") or string.match(a, "RIFLE") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			for k,v in pairs(weapon_table) do
				if v.used == 1 then
					if string.match(v.name, "rifle") or string.match(v.name, "RIFLE") then
						weaponId = v.id
						if v.conditionlevel == nil then
							v.conditionlevel = 0.0
						end
						if condition_level[v.id] == nil then
							condition_level[v.id] = 0.0
						end
						if v.conditionlevel+0.01 <= 1.0 then
							v.conditionlevel = condition_level[v.id]+0.01
							condition_level[v.id] = v.conditionlevel
							local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
							Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
							Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
							condition_level[v.id] = tonumber(v.conditionlevel)
						else
							v.conditionlevel = 1.0
							condition_level[v.id] = 1.0
							local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
							Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
							Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
							condition_level[v.id] = tonumber(v.conditionlevel)
						end
					end
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId, saveTableFilter, condition_level[weaponId])
		end
		if saveWhat[1] =="arrow" then
			local weaponId = 0
			for a,b in pairs(ammoNormal) do
				if string.match(a, "arrow") or string.match(a, "ARROW") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			for k,v in pairs(weapon_table) do
				if v.used == 1 then
					if "WEAPON_BOW" == v.name or "WEAPON_BOW_IMPROVED" == v.name then
						weaponId = v.id
					end
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId, saveTableFilter, 0.0)
		end
		if saveWhat[1] =="varmint" then
			local weaponId = 0
			for a,b in pairs(ammoNormal) do
				if string.match(a, "AMMO_22") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			for k,v in pairs(weapon_table) do
				if v.used == 1 then
					if rightHand == GetHashKey(v.name) then
						weaponId = v.id
						if v.conditionlevel+0.01 <= 1.0 then
							v.conditionlevel = condition_level[v.id]+0.01
							condition_level[v.id] = v.conditionlevel
							local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
							Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
							Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
							condition_level[v.id] = tonumber(v.conditionlevel)
						else
							v.conditionlevel = 1.0
							condition_level[v.id] = 1.0
							local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
							Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(v.conditionlevel))
							Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(v.conditionlevel), 0)
							condition_level[v.id] = tonumber(v.conditionlevel)
						end
					end
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoNormal", weaponId, saveTableFilter, condition_level[weaponId])
		end
	end
	ignorMeForLoadNormal = true
end

function saveThrowAmmo()
	local saveWhatThrow = nil
	local saveItNowThrow = false
	for a,b in pairs(ammo_list) do
		if string.match(b[2], "throw") or string.match(b[2], "THROW") then
			ammoThrow[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoThrow[b[2]] ~= backupAmmoThrow[b[2]] then
				backupAmmoThrow[b[2]] = ammoThrow[b[2]]
				if ignorMeForLoadThrow == true then
					saveItNowThrow = true
					saveWhatThrow = "knive"
				end
			end
		 end
		 if string.match(b[2], "bola") or string.match(b[2], "BOLA") then
			ammoThrow[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoThrow[b[2]] ~= backupAmmoThrow[b[2]] then
				backupAmmoThrow[b[2]] = ammoThrow[b[2]]
				if ignorMeForLoadThrow == true then
					saveItNowThrow = true
					saveWhatThrow = "bola"
				end
			end
		end
		if string.match(b[2], "dynamite") or string.match(b[2], "DYNAMITE") then
			ammoThrow[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoThrow[b[2]] ~= backupAmmoThrow[b[2]] then
				backupAmmoThrow[b[2]] = ammoThrow[b[2]]
				if ignorMeForLoadThrow == true then
					saveItNowThrow = true
					saveWhatThrow = "dynamite"
				end
			end
		end
		if string.match(b[2], "hatchet_cleaver") or string.match(b[2], "HATCHET_CLEAVER") then
			ammoThrow[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoThrow[b[2]] ~= backupAmmoThrow[b[2]] then
				backupAmmoThrow[b[2]] = ammoThrow[b[2]]
				if ignorMeForLoadThrow == true then
					saveItNowThrow = true
					saveWhatThrow = "hatchet_cleaver"
				end
			end
		end
		if string.match(b[2], "hatchet_hunter") or string.match(b[2], "HATCHET_HUNTER") then
			ammoThrow[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoThrow[b[2]] ~= backupAmmoThrow[b[2]] then
				backupAmmoThrow[b[2]] = ammoThrow[b[2]]
				if ignorMeForLoadThrow == true then
					saveItNowThrow = true
					saveWhatThrow = "hatchet_hunter"
				end
			end
		end
		if string.match(b[2], "HATCHET") and not string.match(b[2], "HATCHET_HUNTER") and not string.match(b[2], "HATCHET_CLEAVER") then
			ammoThrow[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoThrow[b[2]] ~= backupAmmoThrow[b[2]] then
				backupAmmoThrow[b[2]] = ammoThrow[b[2]]
				if ignorMeForLoadThrow == true then
					saveItNowThrow = true
					saveWhatThrow = "hatchet"
				end
			end
		end
		if string.match(b[2], "molotov") or string.match(b[2], "MOLOTOV") then
			ammoThrow[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoThrow[b[2]] ~= backupAmmoThrow[b[2]] then
				backupAmmoThrow[b[2]] = ammoThrow[b[2]]
				if ignorMeForLoadThrow == true then
					saveItNowThrow = true
					saveWhatThrow = "molotov"
				end
			end
		end
		if string.match(b[2], "tomahawk") or string.match(b[2], "TOMAHAWK") then
			ammoThrow[b[2]] = Citizen.InvokeNative(0x39D22031557946C1, PlayerPedId(), GetHashKey(b[2]))
			if ammoThrow[b[2]] ~= backupAmmoThrow[b[2]] then
				backupAmmoThrow[b[2]] = ammoThrow[b[2]]
				if ignorMeForLoadThrow == true then
					saveItNowThrow = true
					saveWhatThrow = "tomahawk"
				end
			end
		end
	end
	if saveItNowThrow == true and saveWhatThrow ~= nil then
		if saveWhatThrow =="knive" then
			local saveTableFilter = {}
			for a,b in pairs(ammoThrow) do
				if string.match(a, "knive") or string.match(a, "KNIVE") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoThrow", "WEAPON_THROWN_THROWING_KNIVES", saveTableFilter, 0.0)
		elseif saveWhatThrow =="bola" then
			local saveTableFilter = {}
			for a,b in pairs(ammoThrow) do
				if string.match(a, "bola") or string.match(a, "BOLA") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoThrow", "weapon_thrown_bolas", saveTableFilter, 0.0)
		elseif saveWhatThrow =="dynamite" then
			local saveTableFilter = {}
			for a,b in pairs(ammoThrow) do
				if string.match(a, "dynamite") or string.match(a, "DYNAMITE") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoThrow", "weapon_thrown_dynamite", saveTableFilter, 0.0)
		elseif saveWhatThrow =="hatchet" then
			local saveTableFilter = {}
			for a,b in pairs(ammoThrow) do
				if string.match(a, "HATCHET") and not string.match(a, "HATCHET_CLEAVER") and not string.match(a, "HATCHET_HUNTER")  then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoThrow", "WEAPON_MELEE_HATCHET", saveTableFilter, 0.0)
		elseif saveWhatThrow =="hatchet_hunter" then
			local saveTableFilter = {}
			for a,b in pairs(ammoThrow) do
				if string.match(a, "hatchet_hunter") or string.match(a, "HATCHET_HUNTER") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoThrow", "WEAPON_MELEE_HATCHET_HUNTER", saveTableFilter, 0.0)
		elseif saveWhatThrow =="hatchet_cleaver" then
			local saveTableFilter = {}
			for a,b in pairs(ammoThrow) do
				if string.match(a, "hatchet_cleaver") or string.match(a, "HATCHET_CLEAVER") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoThrow", "WEAPON_MELEE_CLEAVER", saveTableFilter, 0.0)
		elseif saveWhatThrow =="molotov" then
			local saveTableFilter = {}
			for a,b in pairs(ammoThrow) do
				if string.match(a, "molotov") or string.match(a, "MOLOTOV") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoThrow", "weapon_thrown_molotov", saveTableFilter, 0.0)
		elseif saveWhatThrow =="tomahawk" then
			local saveTableFilter = {}
			for a,b in pairs(ammoThrow) do
				if string.match(a, "tomahawk") or string.match(a, "TOMAHAWK") then
					saveTableFilter[a] = b
				end
			end
			Citizen.Wait(0)
			TriggerServerEvent("gum_inventory:saveAmmoThrow", "WEAPON_THROWN_TOMAHAWK", saveTableFilter, 0.0)
		end
	end
	ignorMeForLoadThrow = true
end

RegisterNetEvent('gum_inventory:cleaning_weapons')
AddEventHandler('gum_inventory:cleaning_weapons', function()
    local ped = PlayerPedId()
    local cloth_clean = CreateObject(GetHashKey('s_balledragcloth01x'), GetEntityCoords(PlayerPedId()), false, true, false, false, true)
    local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), false, weaponHash, false)
    local model = GetWeapontypeGroup(weaponHash)
	local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
	local object = GetObjectIndexFromEntityIndex(GetCurrentPedWeaponEntityIndex(PlayerPedId(),0))
    if model == 416676503 or model == -1101297303 then
        TriggerEvent("gum_inventory:CloseInv");
        Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), 1242464081, cloth_clean, GetHashKey("CLOTH"), GetHashKey("SHORTARM_CLEAN_ENTER"), 1, 0, -1.0)   
		local weapon_table2 = weapon_table
		for key,value in pairs(weapon_table2) do
			if value.used == 1 then
				if weaponHash == GetHashKey(value.name)  then
					Citizen.Wait(5000)
					value.conditionlevel = 0.0
					condition_level[tonumber(value.id)] = 0.0
					Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(condition_level[value.id]))
					Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(condition_level[value.id]), 0)
					TriggerServerEvent("gum_inventory:save_cleaning", value.name, 0.0)
				end
			end
		end
		weapon_table = weapon_table2
    else
		local weapon_table2 = weapon_table
		TriggerEvent("gum_inventory:CloseInv");
        Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), 1242464081, cloth_clean, GetHashKey("CLOTH"), GetHashKey("LONGARM_CLEAN_ENTER"), 1, 0, -1.0)   
		for key,value in pairs(weapon_table2) do
			if value.used == 1 then
				if weaponHash == GetHashKey(value.name)  then
					Citizen.Wait(5000)
					value.conditionlevel = 0.0
					condition_level[tonumber(value.id)] = 0.0
					Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(condition_level[value.id]))
					Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(condition_level[value.id]), 0)
					TriggerServerEvent("gum_inventory:save_cleaning", value.name, 0.0)
				end
			end
		end
		weapon_table = weapon_table2
	end
end)

RegisterNetEvent('gum_inventory:CloseInv')
AddEventHandler('gum_inventory:CloseInv', function()
	Show_Items(false, false)
	SetNuiFocus(false, false)
	guiEnabled = false
	giveItemEnable = false
end)

function LoadModel(model)
	local timer = 0
	if not IsModelInCdimage(model) then
		return false
	end
	RequestModel(model)
	while not HasModelLoaded(model) and timer > 300 do
		timer = timer+1
		Wait(0)
	end
	return true
end


RegisterNetEvent('gum_inventory:reload_weap')
AddEventHandler('gum_inventory:reload_weap', function()
	RemoveAllWeapons()
	Citizen.Wait(1000)
	for k,v in pairs(weapon_table) do
		if v.used == 1 then
			if Citizen.InvokeNative(0xD955FEE4B87AFA07, GetHashKey(v.name)) then
				if Citizen.InvokeNative(0xDDC64F5E31EEDAB6, GetHashKey(v.name)) or Citizen.InvokeNative(0xC212F1D05A8232BB, GetHashKey(v.name)) or v.name == "WEAPON_SHOTGUN_SAWEDOFF" then
					if weapon_first_used ~= false and weapon_second_used == false then
						LoadWeaponChar(v.name, false)
						LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
						SetDirtToWeapon(v.id, v.conditionlevel)
						weapon_second_used = v.name
					end
					if weapon_first_used == false and weapon_second_used == false then
						LoadWeaponChar(v.name, true)
						LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
						SetDirtToWeapon(v.id, v.conditionlevel)
						weapon_first_used = v.name
					end
				end
			else
				if not Citizen.InvokeNative(0x0556E9D2ECF39D01, GetHashKey(v.name)) then
					if not Citizen.InvokeNative(0x30E7C16B12DA8211, GetHashKey(v.name)) then
						LoadWeaponChar(v.name)
					else
						Citizen.InvokeNative(0x5E3BDDBCB83F3D84, PlayerPedId(), GetHashKey(v.name), 0, false, true, true, 1.0)
						SetCurrentPedWeapon(PlayerPedId(),GetHashKey(v.name), true)
					end
					LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
					SetDirtToWeapon(v.id, v.conditionlevel)
					if "weapon_melee_davy_lantern" == v.name then
						Citizen.InvokeNative(0xADF692B254977C0C, PlayerPedId(), GetHashKey('weapon_melee_davy_lantern'), 0, 12, 0, 0);
					else
					end
				end
			end
			if Citizen.InvokeNative(0x0556E9D2ECF39D01, GetHashKey(v.name)) then
				if rifle_first_used ~= false and rifle_second_used == false then
					LoadWeaponChar(v.name)
					LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
					SetDirtToWeapon(v.id, v.conditionlevel)
					rifle_second_used = v.name
				end
				if rifle_first_used == false and rifle_second_used == false then
					LoadWeaponChar(v.name)
					LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
					SetDirtToWeapon(v.id, v.conditionlevel)
					rifle_first_used = v.name
				end
			end
		end
	end
	Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, false, false)
end)

function equip_weapon_login()
	local login_continue = false
	RemoveAllWeapons()
	Citizen.Wait(5)
	addWardrobeInventoryItem("CLOTHING_ITEM_M_OFFHAND_000_TINT_004", 0xF20B6B4A);
	addWardrobeInventoryItem("UPGRADE_OFFHAND_HOLSTER", 0x39E57B01);
	for k,v in pairs(weapon_table) do
		if v.used == 1 then
			if Citizen.InvokeNative(0xD955FEE4B87AFA07, GetHashKey(v.name)) then
				if Citizen.InvokeNative(0xDDC64F5E31EEDAB6, GetHashKey(v.name)) or Citizen.InvokeNative(0xC212F1D05A8232BB, GetHashKey(v.name)) or v.name == "WEAPON_SHOTGUN_SAWEDOFF" then
					if weapon_first_used ~= false and weapon_second_used == false then
						LoadWeaponChar(v.name, true)
						LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
						SetDirtToWeapon(v.id, v.conditionlevel)
						weapon_second_used = v.name
					end
					if weapon_first_used == false and weapon_second_used == false then
						LoadWeaponChar(v.name, false)
						LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
						SetDirtToWeapon(v.id, v.conditionlevel)
						weapon_first_used = v.name
					end
				end
			else
				if not Citizen.InvokeNative(0x0556E9D2ECF39D01, GetHashKey(v.name)) then
					if not Citizen.InvokeNative(0x30E7C16B12DA8211, GetHashKey(v.name)) then
						LoadWeaponChar(v.name)
					else
						Citizen.InvokeNative(0x5E3BDDBCB83F3D84, PlayerPedId(), GetHashKey(v.name), 0, false, true, true, 1.0)
						SetCurrentPedWeapon(PlayerPedId(),GetHashKey(v.name), true)
					end
					LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
					SetDirtToWeapon(v.id, v.conditionlevel)
					if "weapon_melee_davy_lantern" == v.name then
						Citizen.InvokeNative(0xADF692B254977C0C, PlayerPedId(), GetHashKey('weapon_melee_davy_lantern'), 0, 12, 0, 0);
					else
					end
				end
			end
			if Citizen.InvokeNative(0x0556E9D2ECF39D01, GetHashKey(v.name)) then
				if rifle_first_used ~= false and rifle_second_used == false then
					LoadWeaponChar(v.name)
					LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
					SetDirtToWeapon(v.id, v.conditionlevel)
					rifle_second_used = v.name
				end
				if rifle_first_used == false and rifle_second_used == false then
					LoadWeaponChar(v.name)
					LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
					SetDirtToWeapon(v.id, v.conditionlevel)
					rifle_first_used = v.name
				end
			end
		end
	end
	login_continue = true
	while login_continue == false do
		Citizen.Wait(10)
	end
	Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, false, false)
	if weapon_second_used ~= false and weapon_first_used ~= false then
		GiveWeaponToPed_2(PlayerPedId(), GetHashKey(weapon_second_used), 0, true,true, 3, false, 0.5, 1.0, 752097756, false,0, false);
		GiveWeaponToPed_2(PlayerPedId(), GetHashKey(weapon_first_used), 0, true, true, 2, false, 0.5, 1.0, 752097756, false, 0, false);
	end
	Citizen.Wait(0)
	TriggerEvent("gum_character:selected_char")
	logged_true = true
	can_save = true
end

RegisterNUICallback('showSkills', function(data, cb)
	TriggerEvent("gum_inventory:CloseInv")
	ExecuteCommand("skills")
end)

RegisterNUICallback('show_weapon', function(data, cb)
  local ped = PlayerPedId()
  local weapon_type = ""
  local _, weapon_hash = GetCurrentPedWeapon(ped, true, 0, true)
  if GetHashKey('GROUP_REPEATER') == GetWeapontypeGroup(weapon_hash) then
		weapon_type = "LONGARM"
	elseif GetHashKey('GROUP_SHOTGUN') == GetWeapontypeGroup(weapon_hash) then
		weapon_type = "LONGARM"
	elseif GetHashKey('GROUP_HEAVY') == GetWeapontypeGroup(weapon_hash) then
		weapon_type = "LONGARM"
	elseif GetHashKey('GROUP_RIFLE') == GetWeapontypeGroup(weapon_hash) then
		weapon_type = "LONGARM"
	elseif GetHashKey('GROUP_SNIPER') == GetWeapontypeGroup(weapon_hash) then
		weapon_type = "LONGARM"
	elseif GetHashKey('GROUP_REVOLVER') == GetWeapontypeGroup(weapon_hash) then
		weapon_type = "SHORTARM"
	elseif GetHashKey('GROUP_PISTOL') == GetWeapontypeGroup(weapon_hash) then
		weapon_type = "SHORTARM"
	end

	if weapon_type ~= "" then
  		TaskItemInteraction(PlayerPedId(), weapon_hash, GetHashKey(""..weapon_type.."_HOLD"), 1, 0, 0)
		  Show_Items(false, false)
		  SetNuiFocus(false, false)
		  guiEnabled = false
	else
		exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[11].text, 'pistol', 2000)
	end
end)

RegisterNUICallback('put_clothe', function(data, cb)
	if tonumber(data.clothe) == 1 then--Klobouk
		ExecuteCommand("klobouk")
	elseif tonumber(data.clothe) == 2 then--Brýle
		ExecuteCommand("bryle")
	elseif tonumber(data.clothe) == 3 then--Masku
		ExecuteCommand("maska")
	elseif tonumber(data.clothe) == 4 then--Bandana
		ExecuteCommand("bandana")
	elseif tonumber(data.clothe) == 5 then--Kravata,šátek
		ExecuteCommand("satek")
		ExecuteCommand("kravata")
	elseif tonumber(data.clothe) == 6 then--Plášť pončo
		ExecuteCommand("plast")
		ExecuteCommand("poncho")
	elseif tonumber(data.clothe) == 7 then--Košile
		ExecuteCommand("kosile")
	elseif tonumber(data.clothe) == 8 then--Vesta
		ExecuteCommand("vesta")
	elseif tonumber(data.clothe) == 9 then--kabát
		ExecuteCommand("kabat")
	elseif tonumber(data.clothe) == 10 then--Pásy,Doplnky,Brašny
		ExecuteCommand("brasny")
		ExecuteCommand("pasy")
	elseif tonumber(data.clothe) == 11 then--Prsteny
		ExecuteCommand("prsteny")
	elseif tonumber(data.clothe) == 12 then--Rukavice
		ExecuteCommand("rukavice")
	elseif tonumber(data.clothe) == 13 then--Nátepníky
		ExecuteCommand("natepniky")
	elseif tonumber(data.clothe) == 14 then--Belt
		ExecuteCommand("opasek")
		ExecuteCommand("pdoplnek")
		ExecuteCommand("pouzdro")
		ExecuteCommand("druhepouzdro")
	elseif tonumber(data.clothe) == 15 then--Kšandy
		ExecuteCommand("ksandy")
	elseif tonumber(data.clothe) == 16 then--Kalhoty,Chaps,Kšandy
		ExecuteCommand("kalhoty")
		ExecuteCommand("chaps")
		ExecuteCommand("kamase")
		ExecuteCommand("sukne")
	elseif tonumber(data.clothe) == 17 then--Boty
		ExecuteCommand("boty")
		ExecuteCommand("ostruhy")
	end
end)

function RemoveAllWeapons()
	for k,v in pairs(weapon_table) do
		RemoveWeaponFromPed(PlayerPedId(), GetHashKey(v.name))
	end
	weapon_first_used = false
	weapon_second_used = false
	rifle_first_used = false
	rifle_second_used = false
end

RegisterNUICallback('use_UseWeapon', function(data, cb)
	if equip_spam == false then
		can_save = false
		equip_spam = true
		for k,v in pairs(weapon_table) do
			if v.used == 1 and tonumber(data.id) == v.id then
				if v.name == weapon_first_used and data.model == weapon_first_used then
					if weapon_second_used == false then
						for a,b in pairs(ammo_list) do
							if string.match(b[2], "revolver") or string.match(b[2], "REVOLVER") then
								Citizen.InvokeNative(0xB6CFEC32E3742779, PlayerPedId(),GetHashKey(b[2]), 999, 0x2188E0A3);
							end
							if string.match(b[2], "pistol") or string.match(b[2], "pistol") then
								Citizen.InvokeNative(0xB6CFEC32E3742779, PlayerPedId(),GetHashKey(b[2]), 999, 0x2188E0A3);
							end
						end
						TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 0)
						RemoveWeaponFromPed(PlayerPedId(), GetHashKey(data.model))
						weapon_first_used = false
						-- exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[20].text.."", 'bag', 1000)
						equip_spam = false
						can_save = true
						return false
					else
						-- exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[45].text.."", 'bag', 1000)
						equip_spam = false
						can_save = true
						return false
					end
				elseif v.name == weapon_second_used and data.model == weapon_second_used then
					for x,z in pairs(json.decode(v.ammo)) do
						if z ~= false then
							Citizen.InvokeNative(0xB6CFEC32E3742779, PlayerPedId(),GetHashKey(x), z, 0x2188E0A3);
						end
					end
					TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 0)
					RemoveWeaponFromPed(PlayerPedId(), GetHashKey(data.model))
					weapon_second_used = false
					--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[19].text.."", 'bag', 1000)
					can_save = true
					equip_spam = false
					return false
				elseif v.name == rifle_first_used and data.model == rifle_first_used then
					saveWeaponAmmo()
					for x,z in pairs(json.decode(v.ammo)) do
						if z ~= false then
							Citizen.InvokeNative(0xB6CFEC32E3742779, PlayerPedId(),GetHashKey(x), z, 0x2188E0A3);
						end
					end
					TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 0)
					RemoveWeaponFromPed(PlayerPedId(), GetHashKey(data.model))
					rifle_first_used = false
					--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[22].text.."", 'bag', 1000)
					can_save = true
					equip_spam = false
					return false
				elseif v.name == rifle_second_used and data.model == rifle_second_used then
					saveWeaponAmmo()
					for x,z in pairs(json.decode(v.ammo)) do
						if z ~= false then
							Citizen.InvokeNative(0xB6CFEC32E3742779, PlayerPedId(),GetHashKey(x), z, 0x2188E0A3);
						end
					end
					TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 0)
					RemoveWeaponFromPed(PlayerPedId(), GetHashKey(data.model))
					rifle_second_used = false
					--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[23].text.."", 'bag', 1000)
					can_save = true
					equip_spam = false
					return false
				else
					if data.model == v.name and tonumber(data.id) == v.id then
						for x,z in pairs(json.decode(v.ammo)) do
							if z ~= false then
								Citizen.InvokeNative(0xB6CFEC32E3742779, PlayerPedId(),GetHashKey(x), z, 0x2188E0A3);
							end
						end
						TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 0)
						RemoveWeaponFromPed(PlayerPedId(), GetHashKey(data.model))
						--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[21].text.."", 'bag', 1000)
						equip_spam = false
						can_save = true
						return false
					end
				end
			end
		end
		for k,v in pairs(weapon_table) do
			if v.name == data.model and v.used == 0 and tonumber(data.id) == v.id then
				if Citizen.InvokeNative(0xD955FEE4B87AFA07, GetHashKey(v.name)) then
					if Citizen.InvokeNative(0xDDC64F5E31EEDAB6, GetHashKey(v.name)) or Citizen.InvokeNative(0xC212F1D05A8232BB, GetHashKey(v.name)) or Citizen.InvokeNative(0xC75386174ECE95D5, GetHashKey(v.name)) then
						if weapon_first_used == false then
							LoadWeaponChar(v.name, false)
							LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
							SetDirtToWeapon(v.id, v.conditionlevel)
							Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, false, false)
							TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 1)
							weapon_first_used = v.name
							--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[12].text.."", 'bag', 1000)
							can_save = true
							equip_spam = false
						elseif weapon_second_used == false then
							if weapon_first_used == data.model then
								return false
							end
							LoadWeaponChar(v.name, true)
							LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
							SetDirtToWeapon(v.id, v.conditionlevel)
							Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, false, false)
							TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 1)
							weapon_second_used = v.name
							--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[13].text.."", 'bag', 1000)
							can_save = true
							equip_spam = false
						end
					end
				else
					if not Citizen.InvokeNative(0x0556E9D2ECF39D01, GetHashKey(v.name)) then
						if not Citizen.InvokeNative(0x30E7C16B12DA8211, GetHashKey(v.name)) then
							LoadWeaponChar(v.name)
						else
							Citizen.InvokeNative(0x5E3BDDBCB83F3D84, PlayerPedId(), GetHashKey(v.name), 0, false, true, true, 1.0)
							SetCurrentPedWeapon(PlayerPedId(),GetHashKey(v.name), true)
						end
						LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
						SetDirtToWeapon(v.id, v.conditionlevel)
						Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, false, false)
						TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 1)
						--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[18].text.."", 'bag', 1000)
						can_save = true
						equip_spam = false
					end
				end
				if Citizen.InvokeNative(0x0556E9D2ECF39D01, GetHashKey(v.name)) then
					if rifle_first_used == false then
						LoadWeaponChar(v.name)
						LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
						SetDirtToWeapon(v.id, v.conditionlevel)
						Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, false, false)
						TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 1)
						rifle_first_used = v.name
						--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[15].text.."", 'bag', 1000)
						can_save = true
						equip_spam = false
					elseif rifle_second_used == false then
						LoadWeaponChar(v.name)
						LoadCompAndAmmo(json.decode(v.ammo), json.decode(v.comps))
						SetDirtToWeapon(v.id, v.conditionlevel)
						Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, false, false)
						TriggerServerEvent("gum_inventory:send_state_weapon", data.id, 1)
						rifle_second_used = v.name
						--exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[16].text.."", 'bag', 1000)
						can_save = true
						equip_spam = false
					end
				end
			end
		end
	end
	Citizen.Wait(0)
	can_save = true
	equip_spam = false
end)


function LoadWeaponChar(name, dual)
	while wep_load ~= GetHashKey(name) do
		_, wep_load = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
		if dual == false then
			givePlayerWeapon(name, 2);
		end
		if dual == true then
			givePlayerWeapon(name, 3);
		end
		if dual == nil then
			Citizen.InvokeNative(0x5E3BDDBCB83F3D84, PlayerPedId(), GetHashKey(name), 0, false, true, true, 1.0)
		end
		SetCurrentPedWeapon(PlayerPedId(),GetHashKey(name), true)
		Citizen.Wait(5)
	end
	wep_load = nil
end

RegisterNetEvent('gum_inventory:sendOkLoading')
AddEventHandler('gum_inventory:sendOkLoading', function()
	canSkipWeapon = true
end)

function LoadCompAndAmmo(ammo, comps)
	canSkipWeapon = false
	TriggerEvent("gum_weapons:load_components", comps)
	for k2,v2 in pairs(ammo) do
		SetPedAmmoByType(PlayerPedId(), GetHashKey(k2), v2);
	end
	while canSkipWeapon == false do
		Wait(5)
	end
	return true
end

function SetDirtToWeapon(wpId, wpCondition)
	local weaponEntityIndex = GetCurrentPedWeaponEntityIndex(PlayerPedId())
	Citizen.InvokeNative(0xA7A57E89E965D839, weaponEntityIndex, tonumber(wpCondition))
	Citizen.InvokeNative(0x812CE61DEBCAB948, weaponEntityIndex, tonumber(wpCondition), 0)
	condition_level[wpId] = tonumber(wpCondition)
end

RegisterNetEvent('gum_inventory:remove_wepo')
AddEventHandler('gum_inventory:remove_wepo', function(model)
	if rifle_first_used == model then
		rifle_first_used = false
	end
	if rifle_second_used == model then
		rifle_second_used = false
	end
	if weapon_first_used == model then
		weapon_first_used = false
	end
	if weapon_second_used == model then
		weapon_second_used = false
	end
	RemoveWeaponFromPed(PlayerPedId(), GetHashKey(model))
end)

RegisterNetEvent('gum_inventory:send_list_money')
AddEventHandler('gum_inventory:send_list_money', function(money, gold)
	money_state = money
	gold_state = gold
end)

RegisterNetEvent('gum_inventory:send_list_inventory')
AddEventHandler('gum_inventory:send_list_inventory', function(table, wtable, ttable, wptable)
	count_in_inventory = 0.0
	for k,v in pairs(table) do
		count_in_inventory = v.count*v.limit+count_in_inventory
	end
	if count_in_inventory >= 45 then
		speed = 1.6
	elseif count_in_inventory >= 42 then
		speed = 1.7
	elseif count_in_inventory >= 39 then
		speed = 1.8
	elseif count_in_inventory >= 35 then
		speed = 1.9
	elseif count_in_inventory >= 30 then
		speed = 2.1
	elseif count_in_inventory >= 27 then
		speed = 2.2
	else
		speed = 0.0
	end

	inventory_table = table
	local isEmpty = false
	if wtable ~= nil then
		if next(wtable) == nil then
			isEmpty = true
		end
		if isEmpty == false then
			if wtable == nil then
				weapon_table = {}
			else
				weapon_table = wtable
			end
		else
			weapon_table = {}
		end
	end
	itm_table = ttable
	wp_table = wptable

	SendNUIMessage({type = "updateInventory", table_for_json = inventory_table,wtable_for_json = weapon_table,money = money_state,gold = gold_state,})
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		for k,v in pairs(dropped_items_entity) do
            DeleteEntity(v.entity)
        end
	end
end)

local _item = 0
local _count = 0
local _id = 0
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(dropped_items_entity) do
			local coords_p = GetEntityCoords(PlayerPedId())
			local coords_i = GetEntityCoords(v.entity)
			local distance = GetDistanceBetweenCoords(coords_p.x, coords_p.y, coords_p.z, coords_i.x, coords_i.y, coords_i.z, false)
			if (2.0 > distance) then
				if (v.item.."_"..v.count.."_"..v.id ~= _item.."_".._count.."_".._id) then
					for k,v in pairs(dropped_items_entity) do
						DeleteEntity(v.entity)
					end
					Citizen.Wait(500)
					_item = v.item 
					_count = v.count
					_id = v.id
					TriggerServerEvent("gum_inventory:check_drops_1")
				end
			end
		end
		Citizen.Wait(100)
	end
end)

Citizen.CreateThread(function()
	TriggerServerEvent("gum_inventory:check_drops_1")
	while true do
		is_last_ammo = false
		if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x4CC0E2FE) then
			Show_Items(true)
		end
		if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x52D29063) then
			if weapon_first_used ~= false and weapon_second_used ~= false then
				Citizen.InvokeNative(0x5E3BDDBCB83F3D84, PlayerPedId(), GetHashKey(weapon_first_used), 0, 1, 1, 2, 0, 0.5, 1.0, GetHashKey('ADD_REASON_DEFAULT'), 0, 0.0, false)
				Citizen.InvokeNative(0x5E3BDDBCB83F3D84, PlayerPedId(), GetHashKey(weapon_second_used), 0, 1, 1, 3, 1, 0.5, 1.0, GetHashKey('ADD_REASON_DEFAULT'), 1, 0.0, false)
				Citizen.InvokeNative(0xADF692B254977C0C, PlayerPedId(), GetHashKey(weapon_first_used), 0, 0, 0, 0);
				Citizen.InvokeNative(0xADF692B254977C0C, PlayerPedId(), GetHashKey(weapon_second_used), 0, 1, 0, 0);
			end
		end
		for k,v in pairs(dropped_items_entity) do
			local coords_p = GetEntityCoords(PlayerPedId())
			local coords_i = GetEntityCoords(v.entity)
			local distance = GetDistanceBetweenCoords(coords_p.x, coords_p.y, coords_p.z, coords_i.x, coords_i.y, coords_i.z, false)
			local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
			if (1.0 > distance) and (closestDistance >= 2.0 or closestDistance == -1) then
				if (v.item.."_"..v.count.."_".._id == _item.."_".._count.."_".._id) then
					if active == false then
						if v.weapon == false then 
							if v.item ~= "money" and v.item ~= "gold" then
								for key,value in pairs(itm_table) do
									if value.item == v.item then
										local item_name = CreateVarString(10, 'LITERAL_STRING', ""..Config.Language[24].text.." : "..v.count.."x "..value.label.."")
										PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
									end
								end
							else
								if v.item == "money" then
									local item_name = CreateVarString(10, 'LITERAL_STRING', ""..Config.Language[26].text.." : "..v.count.."$")
									PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
								else
									if v.item == "gold" then
										local item_name = CreateVarString(10, 'LITERAL_STRING', ""..Config.Language[25].text.." : "..v.count.."G")
										PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
									end
								end
							end
						else
							for key,value in pairs(wp_table) do
								if value.item == v.weapon_model then
									local item_name = CreateVarString(10, 'LITERAL_STRING', ""..Config.Language[27].text.." : "..value.label)
									PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
								end
							end
						end
						if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
							if v.weapon == false then 
								if v.item ~= "money" and v.item ~= "gold" then
									if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
										local table_pl = {}
										for k,v in pairs(GetPlayers()) do
											local mycoords = GetEntityCoords(PlayerPedId())
											local targetCoords = GetEntityCoords(GetPlayerPed(v))
											local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, false)
											if (20.0 > distance) then
												if GetPlayerServerId(PlayerId()) ~= GetPlayerServerId(v) then
													table.insert(table_pl, {name=GetPlayerName(v), id=GetPlayerServerId(v)})
												end
											end
										end
										Citizen.Wait(0)
										TriggerServerEvent("gum_inventory:drop_update", v.id, table_pl)
										playAnim("mech_pickup@fish_bag@pickup_handheld", "pickup", 2000, 1)
										RequestControl(v.entity)
										Citizen.Wait(500)
										DeleteEntity(v.entity)
										table.remove(dropped_items_entity, k)
										local emptyMetadata = false
										if v.metaData ~= nil then
											for z,x in pairs(v.metaData) do
												emptyMetadata = true
											end
										end
										if math.type(tonumber(v.count)) == "integer" then 
											if emptyMetadata == true then
												TriggerServerEvent("gumCore:addItem", GetPlayerServerId(PlayerId()), v.item, v.count, v.metaData)
											else
												TriggerServerEvent("gumCore:addItem", GetPlayerServerId(PlayerId()), v.item, v.count)
											end

											Citizen.Wait(1000)
										else
											exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[47].text, 'money', 2000)
										end
									end
								else
									if v.item == "money" then
										local table_pl = {}
										for k,v in pairs(GetPlayers()) do
											local mycoords = GetEntityCoords(PlayerPedId())
											local targetCoords = GetEntityCoords(GetPlayerPed(v))
											local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, false)
											if (20.0 > distance) then
												if GetPlayerServerId(PlayerId()) ~= GetPlayerServerId(v) then
													table.insert(table_pl, {name=GetPlayerName(v), id=GetPlayerServerId(v)})
												end
											end
										end
										Citizen.Wait(0)
										TriggerServerEvent("gum_inventory:drop_update", v.id, table_pl)
										playAnim("mech_pickup@fish_bag@pickup_handheld", "pickup", 2000, 1)
										RequestControl(v.entity)
										Citizen.Wait(500)
										DeleteEntity(v.entity)
										table.remove(dropped_items_entity, k)
										TriggerServerEvent("gum_inventory:drop_give_money", v.count)
										Citizen.Wait(1000)
									else
										local table_pl = {}
										for k,v in pairs(GetPlayers()) do
											local mycoords = GetEntityCoords(PlayerPedId())
											local targetCoords = GetEntityCoords(GetPlayerPed(v))
											local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, false)
											if (20.0 > distance) then
												if GetPlayerServerId(PlayerId()) ~= GetPlayerServerId(v) then
													table.insert(table_pl, {name=GetPlayerName(v), id=GetPlayerServerId(v)})
												end
											end
										end
										Citizen.Wait(0)
										TriggerServerEvent("gum_inventory:drop_update", v.id, table_pl)
										playAnim("mech_pickup@fish_bag@pickup_handheld", "pickup", 2000, 1)
										RequestControl(v.entity)
										Citizen.Wait(500)
										DeleteEntity(v.entity)
										table.remove(dropped_items_entity, k)
										TriggerServerEvent("gum_inventory:drop_give_gold", v.count)
										Citizen.Wait(1000)
									end
								end
							else
								local table_pl = {}
								for k,v in pairs(GetPlayers()) do
									local mycoords = GetEntityCoords(PlayerPedId())
									local targetCoords = GetEntityCoords(GetPlayerPed(v))
									local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, false)
									if (20.0 > distance) then
										if GetPlayerServerId(PlayerId()) ~= GetPlayerServerId(v) then
											table.insert(table_pl, {name=GetPlayerName(v), id=GetPlayerServerId(v)})
										end
									end
								end
								Citizen.Wait(0)
								TriggerServerEvent("gum_inventory:drop_update", v.id, table_pl)
								playAnim("mech_pickup@fish_bag@pickup_handheld", "pickup", 2000, 1)
								RequestControl(v.entity)
								Citizen.Wait(500)
								DeleteEntity(v.entity)
								table.remove(dropped_items_entity, k)
								TriggerServerEvent("gumCore:giveWeapon_dropped", GetPlayerServerId(PlayerId()), v.item)
								Show_Items(false, false)
								SetNuiFocus(false, false)
								guiEnabled = false
								Citizen.Wait(1000)
							end
						end
					end
				end
			end
		end
		local _, wepHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
		if GetHashKey('weapon_melee_davy_lantern') == wepHash  then
			if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x53296B75) then
				if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x53296B75) then
					GiveWeaponToPed_2(PlayerPedId(), GetHashKey('weapon_melee_davy_lantern'), 0, true,true, 12, false, 0.5, 1.0, 752097756, false,0, false);
					Citizen.InvokeNative(0xADF692B254977C0C, PlayerPedId(), GetHashKey('weapon_melee_davy_lantern'), 0, 12, 0, 0);
				end
			end
		end
		Citizen.Wait(5)
	end
end)

Citizen.CreateThread(function()
	local player_prompt
	local player_prompt2
	local player_prompt3
	while true do
		local combat_stance = IsPedInMeleeCombat(PlayerPedId())
		if slot1 ~= "" then
			DisableControlAction(0, 0x1CE6D9EB, true)
			if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x1CE6D9EB) then
				for k,v in pairs(inventory_table) do
					if v.item == slot1 then
						TriggerServerEvent("gum:use", slot1)
					end
				end
			end
		end
		if slot2 ~= "" then
			DisableControlAction(0, 0x4F49CC4C, true)
			if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x4F49CC4C) then
				for k,v in pairs(inventory_table) do
					if v.item == slot2 then
						TriggerServerEvent("gum:use", slot2)
					end
				end
			end
		end
		if slot3 ~= "" then
			DisableControlAction(0, 0x8F9F9E58, true)
			if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x8F9F9E58) then
				for k,v in pairs(inventory_table) do
					if v.item == slot3 then
						TriggerServerEvent("gum:use", slot3)
					end
				end
			end
		end
		if slot4 ~= "" then
			DisableControlAction(0, 0xAB62E997, true)
			if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0xAB62E997) then
				for k,v in pairs(inventory_table) do
					if v.item == slot4 then
						TriggerServerEvent("gum:use", slot4)
					end
				end
			end
		end
		if slot5 ~= "" then
			DisableControlAction(0, 0xA1FDE2A6, true)
			if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0xA1FDE2A6) then
				for k,v in pairs(inventory_table) do
					if v.item == slot5 then
						TriggerServerEvent("gum:use", slot5)
					end
				end
			end
		end
		DisableControlAction(0, 0xE2B557A3, true)
		DisableControlAction(0, 0x1C826362, true)
		DisableControlAction(0, 0x7E75F4DC, true)
		cant_target = false
		local isTargetting, targetEntity = GetPlayerTargetEntity(PlayerId())
		local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
		local coords = GetEntityCoords(tgt1, true)
		local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
		if isTargetting and tgt1 == targetEntity and cant_target == false and holding == false then
			if player_prompt then				player_prompt:delete()			end
			if player_prompt2 then				player_prompt2:delete()			end
			if player_prompt3 then				player_prompt3:delete()			end

			local mycoords = GetEntityCoords(PlayerPedId())
			local targetCoords = GetEntityCoords(tgt1)
			local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, false)
			if distance < 2 then
				if combat_stance == false and not IsEntityDead(tgt1) and GetEntityHealth(PlayerPedId()) > 0 and GetMount(tgt1) == 0 and GetMount(PlayerPedId()) == 0 and GetVehiclePedIsUsing(tgt1) == 0 and GetEntityHealth(tgt1) >= 0.0 then
					local canHostage = false
					local _, wepHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
					if GetHashKey('GROUP_MELEE') == GetWeapontypeGroup(wepHash) then
						canHostage = true
					end

					local promptGroup = PromptGetGroupIdForTargetEntity(tgt1)
					player_prompt = Uiprompt:new(`INPUT_CONTEXT_X`, ""..Config.Language[28].text.."", promptGroup)
					player_prompt2 = Uiprompt:new(`INPUT_INTERACT_OPTION1`, ""..Config.Language[29].text.."", promptGroup)
					if canHostage ~= false then
						player_prompt3 = Uiprompt:new(`INPUT_PROMPT_PAGE_NEXT`, "Hostage", promptGroup)
						if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, `INPUT_PROMPT_PAGE_NEXT`) then
							TriggerServerEvent("gum_inventory:hostage", playerid)
							Citizen.Wait(1000)
						end
					end
					if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, `INPUT_INTERACT_OPTION1`) then
						TriggerServerEvent("gum_inventory:give_slap", playerid)
						Citizen.Wait(2000)
					end
					if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, `INPUT_CONTEXT_X`) then
						TriggerServerEvent("gum_inventory:give_hand", playerid)
						Citizen.Wait(2000)
					end
				end
			end
		end
		if tonumber(speed) ~= 0 then
			SetPedMaxMoveBlendRatio(PlayerPedId(), speed)
		end
		Citizen.Wait(5)
	end
end)
RegisterNetEvent('gum_inventory:hostage')
AddEventHandler('gum_inventory:hostage', function(who, arg)
	if arg == true then
		if isAttachedToPlayer == false then
			isAttachedToPlayer = true
			playAnim2("script_mp@bounty@legendary@lbnik@ig@lbnik_ig2_humanshield","loop_humanshield_yukon", -1, 25)
			Citizen.CreateThread(function()
				while isAttachedToPlayer == true do
					if IsEntityPlayingAnim(PlayerPedId(), "script_mp@bounty@legendary@lbnik@ig@lbnik_ig2_humanshield","loop_humanshield_yukon", 3) == false then
						playAnim2("script_mp@bounty@legendary@lbnik@ig@lbnik_ig2_humanshield","loop_humanshield_yukon", -1, 25)
						Citizen.Wait(100)					
					end
					if GetEntityHealth(PlayerPedId()) <= 0.0 then
						TriggerServerEvent("gum_inventory:clearHostage", who)
						isAttachedToPlayer = false
						ClearPedTasks(PlayerPedId())
						break
					end
					if Citizen.InvokeNative(0x9682F850056C9ADE, PlayerPedId()) ~= false then
						TriggerServerEvent("gum_inventory:clearHostage", who)
						isAttachedToPlayer = false
						ClearPedTasks(PlayerPedId())
						break
					end
					if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x07CE1E61) then
						TriggerServerEvent("gum_inventory:clearHostage", who)
						isAttachedToPlayer = false
						ClearPedTasks(PlayerPedId())
						break
					end
					Citizen.Wait(5)
				end
			end)
		else
			isAttachedToPlayer = false
			ClearPedTasks(PlayerPedId())
			Citizen.Wait(10)
			playAnim2("mech_grapple@pistol@_male@_ambient@_healthy@front@_streamed","release_att", 600, 25)
		end
	else
		if isAttachedToPlayer == false then
			isAttachedToPlayer = true
			playAnim2("script_mp@bounty@legendary@lbnik@ig@lbnik_ig2_humanshield","loop_humanshield_hostage", -1, 1)
			AttachEntityToEntity(PlayerPedId(), GetPlayerPed(GetPlayerFromServerId(who)), 0, -0.15, 0.28, 0.11, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
			Citizen.CreateThread(function()
				while isAttachedToPlayer == true do
					if IsEntityPlayingAnim(PlayerPedId(), "script_mp@bounty@legendary@lbnik@ig@lbnik_ig2_humanshield","loop_humanshield_hostage", 3)  == false then
						playAnim2("script_mp@bounty@legendary@lbnik@ig@lbnik_ig2_humanshield","loop_humanshield_hostage", -1, 25)
						Citizen.Wait(100)
					end
					Citizen.Wait(5)
				end
			end)
		else
			isAttachedToPlayer = false
			ClearPedTasks(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
		end
	end
end)
RegisterNetEvent('gum_inventory:clearHostage')
AddEventHandler('gum_inventory:clearHostage', function()
	isAttachedToPlayer = false
	ClearPedTasks(PlayerPedId())
	DetachEntity(PlayerPedId(), 1, 1)
end)


RegisterNetEvent('gum_inventory:send_slap')
AddEventHandler('gum_inventory:send_slap', function(who, random, take_or_give)
	local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 2.5 then
		if tonumber(who) == tonumber(playerid) then
			TaskTurnPedToFaceEntity(PlayerPedId(), tgt1, 2000)
			Citizen.Wait(2000)
			if tonumber(random) == 1 then
				if take_or_give then
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_drunk_vs_drunk_heavy_v1_att", 4000, 1)
				else
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_drunk_vs_drunk_heavy_v1_vic", 5500, 1)
				end
			elseif tonumber(random) == 2 then
				if take_or_give then
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_drunk_vs_drunk_medium_v1_att", 4000, 1)
				else
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_drunk_vs_drunk_medium_v1_vic", 6000, 1)
				end
			elseif tonumber(random) == 3 then
				if take_or_give then
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_sober_vs_drunk_heavy_v1_att", 4000, 1)
				else
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_sober_vs_drunk_heavy_v1_vic", 6000, 1)
				end
			elseif tonumber(random) == 4 then
				if take_or_give then
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_sober_vs_drunk_medium_v1_att", 4000, 1)
				else
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_sober_vs_drunk_medium_v1_vic", 5000, 1)
				end
			elseif tonumber(random) == 5 then
				if take_or_give then
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_drunk_vs_drunk_heavy_v3_att", 6000, 1)
				else
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_drunk_vs_drunk_heavy_v3_vic", 4000, 1)
				end
			elseif tonumber(random) == 6 then	
				if take_or_give then
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_sober_vs_drunk_light_v1_att", 3000, 1)
				else
					Citizen.Wait(100)
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_sober_vs_drunk_light_v1_vic", 4000, 1)
				end
			elseif tonumber(random) == 7 then
				if take_or_give then
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_sober_vs_drunk_light_v2_att", 4000, 1)
				else
					playAnim("mech_melee@unarmed@posse@ambient@healthy@noncombat", "slap_front_sober_vs_drunk_light_v2_vic", 4000, 1)
				end
			end
		end
	end
end)


RegisterNetEvent('gum_inventory:send_hand')
AddEventHandler('gum_inventory:send_hand', function(who, take_or_give)
	local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 2.5 then
		if tonumber(who) == tonumber(playerid) then
			TaskTurnPedToFaceEntity(PlayerPedId(), tgt1, 2000)
			Citizen.Wait(1500)
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(500)
			if take_or_give then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())-17.0)
				playAnim2("script_story@ind1@leadin@int", "greet_f_player", 800, 1)
			else
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())-17.0)
				playAnim2("script_story@ind1@leadin@int", "greet_f_player", 800, 1)
			end
			Citizen.Wait(100)
			FreezeEntityPosition(PlayerPedId(), false)
		end
	end
end)

RegisterNetEvent('gum_inventory:update_list_inventory')
AddEventHandler('gum_inventory:update_list_inventory', function(table, name, count, update_full,ttable,wptable)
	inventory_table = {}
	inventory_table = table
	itm_table = ttable
	wp_table = wptable
	count_in_inventory = 0.0
	for k,v in pairs(table) do
		count_in_inventory = v.count*v.limit+count_in_inventory
	end
	if count_in_inventory >= 45 then
		speed = 1.6
	elseif count_in_inventory >= 42 then
		speed = 1.7
	elseif count_in_inventory >= 39 then
		speed = 1.8
	elseif count_in_inventory >= 35 then
		speed = 1.9
	elseif count_in_inventory >= 30 then
		speed = 2.1
	elseif count_in_inventory >= 27 then
		speed = 2.2
	else
		speed = 0.0
	end
	if update_full == true then
		SendNUIMessage({
			type = "inventory_update",
			update = update_full,
			table_for_json = inventory_table,
			wtable_for_json = weapon_table,
			money = money_state,
			gold = gold_state,
		})
	else
		SendNUIMessage({
			type = "inventory_update",
			update = update_full,
			iditem = name,
			idcount = count,
			table_for_json = inventory_table,
			wtable_for_json = weapon_table,
			money = money_state,
			gold = gold_state,
		})
	end
end)

RegisterNUICallback('use_item', function(data, cb)
	if id_container == 0 then
		TriggerServerEvent("gum:use", data.item, data.id)
	end
end)

RegisterNUICallback('give_checked_item', function(data, cb)
	if data.is == "item" then
		if data.item ~= "money" and data.item ~= "gold" then
			if tonumber(data.count) >= 1 then
				for k,v in pairs(inventory_table) do
					if tonumber(v.itemId) == tonumber(data.item) then 
						if v.count >= tonumber(data.count) then
							Show_Items(false, false)
							SetNuiFocus(false, false)
							guiEnabled = false
							TriggerServerEvent("gum_inventory:turn_ped", data.id)
							TriggerServerEvent("gumCore:subItemByID", GetPlayerServerId(PlayerId()), data.item, data.count)
							local emptyMetadata = false
							if data.metaData ~= nil then
								for z,x in pairs(data.metaData) do
									emptyMetadata = true
								end
							end
							if emptyMetadata == true then
								TriggerServerEvent("gumCore:addItem", tonumber(data.id), data.itemName, data.count, data.metaData, GetPlayerServerId(PlayerId()))
							else
								TriggerServerEvent("gumCore:addItem", tonumber(data.id), data.itemName, data.count, nil, GetPlayerServerId(PlayerId()))
							end
							-- Citizen.Wait(1000)
							-- TriggerServerEvent("gumCore:giveItem", data.id, data.item, data.count, GetPlayerServerId(PlayerId()))
						else
							exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[30].text.."", 'bag', 2000)
						end
					end
				end
			else
				exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[31].text.."", 'bag', 2000)
			end
		else
			if data.item == "money" then
				TriggerServerEvent("gum_inventory:turn_ped", data.id)
				TriggerServerEvent("gum_inventory:give_money", data.id, data.count, GetPlayerServerId(PlayerId()))
				Show_Items(false, false)
				SetNuiFocus(false, false)
				guiEnabled = false
			else
				TriggerServerEvent("gum_inventory:turn_ped", data.id)
				TriggerServerEvent("gum_inventory:give_gold", data.id, data.count, GetPlayerServerId(PlayerId()))
				Show_Items(false, false)
				SetNuiFocus(false, false)
				guiEnabled = false
			end
		end
	else
		for k,v in pairs(weapon_table) do
			if tonumber(data.item) == tonumber(v.id) then
				if v.used == 0 then
					TriggerServerEvent("gum_inventory:turn_ped", data.id)
					TriggerServerEvent("gumCore:giveWeapon", GetPlayerServerId(PlayerId()), data.item, data.id)
					for c,d in pairs(json.decode(v.ammo)) do
						Citizen.InvokeNative(0xB6CFEC32E3742779, PlayerPedId(),GetHashKey(c), 999, 0x2188E0A3);
					end
					Show_Items(false, false)
					SetNuiFocus(false, false)
					guiEnabled = false
				else
					exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[32].text.."", 'bag', 2000)
				end
			end
		end

	end
end)

RegisterNetEvent('gum_inventory:turn_client')
AddEventHandler('gum_inventory:turn_client', function(who, manipulation)
	if tonumber(manipulation) == 1 then
		local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 5.0 then
			if tonumber(who) == tonumber(playerid) then
				TaskTurnPedToFaceEntity(PlayerPedId(), tgt1, 3000)
				Citizen.Wait(2000)
				playAnim("mech_butcher", "small_rat_give_player", 2500, 25)
			end
		end
	else
		local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 5.0 then
			if tonumber(who) == tonumber(playerid) then
				TaskTurnPedToFaceEntity(PlayerPedId(), tgt1, 2500)
				Citizen.Wait(3200)
				playAnim("mech_inventory@item@pocketwatch@unarmed@base", "holster", 1500, 25)
			end
		end
	end
end)

RegisterNUICallback('give_item', function(data, cb)
	Citizen.Wait(50)
	local player_table = {}
	for k,v in pairs(GetPlayers()) do
		local mycoords = GetEntityCoords(PlayerPedId())
		local targetCoords = GetEntityCoords(GetPlayerPed(v))
		local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, false)
		if (5.0 > distance) then
			if GetPlayerServerId(PlayerId()) ~= GetPlayerServerId(v) then
				table.insert(player_table, {name=GetPlayerName(v), id=GetPlayerServerId(v)})
			end
		end
	end
	Citizen.Wait(0)
	SendNUIMessage({type = "playertable", table_p_for_json = player_table, item = data.item, count = data.count, itemName=data.itemName})
end)


RegisterNetEvent('gum_inventory:drop_list')
AddEventHandler('gum_inventory:drop_list', function(drop_list)
	for k,v in pairs(dropped_items_entity) do
		DeleteEntity(v.entity)
	end
	Citizen.Wait(500)
	if drop_list ~= false then
		dropped_items_entity = {}
		dropped_items = {}
		Citizen.Wait(5)
		for k,v in pairs(drop_list) do
			if v.weapon == true then
				dropped_item = CreateObject("mp005_s_posse_weaponslocker01x", v.x, v.y, v.z, false, false, false)
				PlaceObjectOnGroundProperly(dropped_item)
				FreezeEntityPosition(dropped_item, true)
				Citizen.InvokeNative(0x7DFB49BCDB73089A, dropped_item, true)
				table.insert(dropped_items_entity, {id=v.id, entity=dropped_item, x=v.x ,y=v.y, z=v.z, item=v.item, count=v.count, weapon=v.weapon, weapon_model=v.weapon_model})
				SetEntityCollision(dropped_item, false, false)
			elseif v.weapon == false then
				if v.item == "money" then
					dropped_item = CreateObject("p_moneystack01x", v.x, v.y, v.z, false, false, false)
					PlaceObjectOnGroundProperly(dropped_item)
					FreezeEntityPosition(dropped_item, true)
					Citizen.InvokeNative(0x7DFB49BCDB73089A, dropped_item, true)
					table.insert(dropped_items_entity, {id=v.id, entity=dropped_item, x=v.x ,y=v.y, z=v.z, item=v.item, count=v.count, weapon=v.weapon, weapon_model=v.weapon_model})
					SetEntityCollision(dropped_item, false, false)
				else
					if v.item == "gold" then
						dropped_item = CreateObject("p_goldstack01x", v.x, v.y, v.z, false, false, false)
						PlaceObjectOnGroundProperly(dropped_item)
						FreezeEntityPosition(dropped_item, true)
						Citizen.InvokeNative(0x7DFB49BCDB73089A, dropped_item, true)
						table.insert(dropped_items_entity, {id=v.id, entity=dropped_item, x=v.x ,y=v.y, z=v.z, item=v.item, count=v.count, weapon=v.weapon, weapon_model=v.weapon_model})
						SetEntityCollision(dropped_item, false, false)
					else
						dropped_item = CreateObject("p_cs_dirtybag01x", v.x, v.y, v.z, false, false, false)
						PlaceObjectOnGroundProperly(dropped_item)
						FreezeEntityPosition(dropped_item, true)
						Citizen.InvokeNative(0x7DFB49BCDB73089A, dropped_item, true)
						table.insert(dropped_items_entity, {id=v.id, metaData=v.metaData, itemId=v.itemid, entity=dropped_item, x=v.x ,y=v.y, z=v.z, item=v.item, count=v.count, weapon=v.weapon, weapon_model=v.weapon_model})
						SetEntityCollision(dropped_item, false, false)
					end
				end
			end
		end
	end
end)


RegisterNUICallback('drop_item', function(data, cb)
	can_drop_near = false
	for k,v in pairs(dropped_items_entity) do
		local coords_p = GetEntityCoords(PlayerPedId())
		local coords_i = GetEntityCoords(v.entity)
		local distance = GetDistanceBetweenCoords(coords_p.x, coords_p.y, coords_p.z, coords_i.x, coords_i.y, coords_i.z, false)
		if (3.0 > distance) then
			can_drop_near = true
		end
	end
	Citizen.Wait(0)
	if can_drop_near == false then
		if data.is_weapon =="item" then
			if tonumber(data.count) >= 1 then
				if data.item ~= "money" and data.item ~= "gold" then
					for k,v in pairs(inventory_table) do
						if tonumber(v.itemId) == tonumber(data.item) then 
							if v.count >= tonumber(data.count) then
								TriggerServerEvent("gumCore:subItemByID", GetPlayerServerId(PlayerId()), data.item, data.count)
								local coords = GetEntityCoords(PlayerPedId(), true)
								table.insert(dropped_items, {x=coords.x ,y=coords.y, z=coords.z, itemid=v.itemId, item=v.item, count=data.count, metaData=data.metaData, weapon=false})
								playAnim("mech_pickup@firewood", "putdown", 3000, 1)
								Citizen.Wait(0)
								TriggerServerEvent("gum_inventory:upload_drops", dropped_items)
								dropped_items = {}
								Show_Items(false, false)
								SetNuiFocus(false, false)
								guiEnabled = false
							else
								exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[33].text.."", 'bag', 2000)
							end
						end
					end
				else
					if data.item == "money" then
						if tonumber(money_state) >= tonumber(data.count) then
							TriggerServerEvent("gum_inventory:drop_money", data.count)
							local coords = GetEntityCoords(PlayerPedId(), true)
							table.insert(dropped_items, {x=coords.x ,y=coords.y, z=coords.z, item=data.item, count=data.count, weapon=false})
							playAnim("mech_pickup@firewood", "putdown", 3000, 1)
							Citizen.Wait(0)
							TriggerServerEvent("gum_inventory:upload_drops", dropped_items)
							dropped_items = {}
							Show_Items(false, false)
							SetNuiFocus(false, false)
							guiEnabled = false
						else
							exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[34].text.."", 'bag', 2000)
						end
					else
						if tonumber(gold_state) >= tonumber(data.count) then
							TriggerServerEvent("gum_inventory:drop_gold", data.count)
							local coords = GetEntityCoords(PlayerPedId(), true)
							table.insert(dropped_items, {x=coords.x ,y=coords.y, z=coords.z, item=data.item, count=data.count, weapon=false})
							playAnim("mech_pickup@firewood", "putdown", 3000, 1)
							Citizen.Wait(0)
							TriggerServerEvent("gum_inventory:upload_drops", dropped_items)
							dropped_items = {}
							Show_Items(false, false)
							SetNuiFocus(false, false)
							guiEnabled = false
						else
							exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[35].text.."", 'bag', 2000)
						end
					end
				end
			else
				exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[31].text.."", 'bag', 2000)
			end
		else
			if tonumber(data.count) == 1 then
				for k,v in pairs(weapon_table) do
					if v.id == data.item then 
						if v.used == 0 then
							TriggerServerEvent("gumCore:subWeapon", GetPlayerServerId(PlayerId()), tonumber(data.item))
							local coords = GetEntityCoords(PlayerPedId(), true)
							table.insert(dropped_items, {x=coords.x ,y=coords.y, z=coords.z, item=data.item, count=data.count, weapon=true, weapon_model=v.name})
							playAnim("mech_pickup@firewood", "putdown", 3000, 1)
							Citizen.Wait(0)
							TriggerServerEvent("gum_inventory:upload_drops", dropped_items)
							dropped_items = {}
							Show_Items(false, false)
							SetNuiFocus(false, false)
							guiEnabled = false
						else
							exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[36].text.."", 'bag', 2000)
						end
					end
				end
			else
				exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[37].text.."", 'bag', 2000)
			end
		end
	else
		exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, ""..Config.Language[37].text.."", 'bag', 2000)
	end
end)
local giveItemEnable = false


RegisterNUICallback('exit', function(data, cb)
	if id_container ~= 0 then
		TriggerServerEvent("gumCore:closestorage", id_container)
		Citizen.Wait(0)
		id_container = 0
	end
	Show_Items(false, false)
    SetNuiFocus(false, false)
    guiEnabled = false
end)
RegisterNUICallback('exit2', function(data, cb)
	giveItemEnable = false
end)

RegisterNetEvent('gum_inventory:close_storage')
AddEventHandler('gum_inventory:close_storage', function(id)
	TriggerServerEvent("gumCore:closestorage", id)
end)

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
    return closestPlayer, closestDistance,  playerid, tgt1
end

function GetPlayers()
	local players = {}
	for i = 0, 32 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end
	return players
end


function GetPlayersClick()
	local players = {}
	for i = 0, 32 do
		if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
		end
	end
	return players
end

function RequestControl(entity)
	local type = GetEntityType(entity)

	if type < 1 or type > 3 then
		return
	end

	NetworkRequestControlOfEntity(entity)
end
function playAnim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 8.0, 8.0, time, flag, 0, true, 0, false, 0, false)  
end
function playAnim2(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
		SetTextScale(0.30, 0.30)
		SetTextFontForCurrentCommand(0)
		SetTextColor(255, 255, 255, 255)
		SetTextCentre(1)
		SetTextDropshadow(1, 1, 0, 0, 200)
		DisplayText(str,_x,_y)
		local factor = (string.len(text)) / 225
		--DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
		--DrawSprite("feeds", "toast_bg", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
	end
end

function getGuidFromItemId(inventoryId, itemData, category, slotId) 
    local outItem = DataView.ArrayBuffer(8 * 13)
 
    if not itemData then
        itemData = 0
    end
 
    local success = Citizen.InvokeNative("0x886DFD3E185C8A89", inventoryId, itemData, category, slotId, outItem:Buffer()) --InventoryGetGuidFromItemid
    if success then
        return outItem:Buffer() --Seems to not return anythign diff. May need to pull from native above
    else
        return nil
    end
end
 
function addWardrobeInventoryItem(itemName, slotHash)
    local itemHash = GetHashKey(itemName)
    local addReason = GetHashKey("ADD_REASON_DEFAULT")
    local inventoryId = 1
 
    local isValid = Citizen.InvokeNative("0x6D5D51B188333FD1", itemHash, 0) --ItemdatabaseIsKeyValid
    if not isValid then
        return false
    end
 
    local characterItem = getGuidFromItemId(inventoryId, nil, GetHashKey("CHARACTER"), 0xA1212100)
    if not characterItem then
        return false
    end
 
    local wardrobeItem = getGuidFromItemId(inventoryId, characterItem, GetHashKey("WARDROBE"), 0x3DABBFA7)
    if not wardrobeItem then
        return false 
    end
 
    local itemData = DataView.ArrayBuffer(8 * 13)
 
    local isAdded = Citizen.InvokeNative("0xCB5D11F9508A928D", inventoryId, itemData:Buffer(), wardrobeItem, itemHash, slotHash, 1, addReason);
    if not isAdded then 
        return false
    end
 
    local equipped = Citizen.InvokeNative("0x734311E2852760D0", inventoryId, itemData:Buffer(), true);
    return equipped;
end
 
function givePlayerWeapon(weaponName, attachPoint)
    local addReason = GetHashKey("ADD_REASON_DEFAULT");
    local weaponHash = GetHashKey(weaponName);
 
    Citizen.InvokeNative("0x72D4CB5DB927009C", weaponHash, 0, true);
 
    Wait(1000)
    Citizen.InvokeNative("0x5E3BDDBCB83F3D84", PlayerPedId(), weaponHash, 0, true, false, attachPoint, true, 0.0, 0.0, addReason, true, 0.0, false);
end

--[[
    Default, and assumed, LUAI_MAXSHORTLEN is 40. To create a non internalized
    string always force the buffer to be greater than that value.
--]]
local _strblob = string.blob or function(length)
    return string.rep("\0", math.max(40 + 1, length))
end

--[[
    API:
        DataView::{Get | Set}Int8
        DataView::{Get | Set}Uint8
        DataView::{Get | Set}Int16
        DataView::{Get | Set}Uint16
        DataView::{Get | Set}Int32
        DataView::{Get | Set}Uint32
        DataView::{Get | Set}Int64
        DataView::{Get | Set}Uint64
        DataView::{Get | Set}LuaInt
        DataView::{Get | Set}UluaInt
        DataView::{Get | Set}LuaNum
        DataView::{Get | Set}Float32
        DataView::{Get | Set}Float64
        DataView::{Get | Set}String
            Parameters:
                Get: self, offset, endian (optional)
                Set: self, offset, value, endian (optional)
        DataView::{GetFixed | SetFixed}::Int
        DataView::{GetFixed | SetFixed}::Uint
        DataView::{GetFixed | SetFixed}::String
            Parameters:
                Get: offset, typelen, endian (optional)
                Set: offset, typelen, value, endian (optional)
    NOTES:
        (1) Endianness changed from JS API, defaults to little endian.
        (2) {Get|Set|Next} offsets are zero-based.
    EXAMPLES:
        local view = DataView.ArrayBuffer(512)
        if Citizen.InvokeNative(0x79923CD21BECE14E, 1, view:Buffer(), Citizen.ReturnResultAnyway()) then
            local dlc = {
                validCheck = view:GetInt64(0),
                weaponHash = view:GetInt32(8),
                val3 = view:GetInt64(16),
                weaponCost = view:GetInt64(24),
                ammoCost = view:GetInt64(32),
                ammoType = view:GetInt64(40),
                defaultClipSize = view:GetInt64(48),
                nameLabel = view:GetFixedString(56, 64),
                descLabel = view:GetFixedString(120, 64),
                simpleDesc = view:GetFixedString(184, 64),
                upperCaseName = view:GetFixedString(248, 64),
            }
        end
--]]
DataView = {
    EndBig = ">",
    EndLittle = "<",
    Types = {
        Int8 = { code = "i1", size = 1 },
        Uint8 = { code = "I1", size = 1 },
        Int16 = { code = "i2", size = 2 },
        Uint16 = { code = "I2", size = 2 },
        Int32 = { code = "i4", size = 4 },
        Uint32 = { code = "I4", size = 4 },
        Int64 = { code = "i8", size = 8 },
        Uint64 = { code = "I8", size = 8 },

        LuaInt = { code = "j", size = 8 }, -- a lua_Integer
        UluaInt = { code = "J", size = 8 }, -- a lua_Unsigned
        LuaNum = { code = "n", size = 8}, -- a lua_Number
        Float32 = { code = "f", size = 4 }, -- a float (native size)
        Float64 = { code = "d", size = 8 }, -- a double (native size)
        String = { code = "z", size = -1, }, -- zero terminated string
    },

    FixedTypes = {
        String = { code = "c", size = -1, }, -- a fixed-sized string with n bytes
        Int = { code = "i", size = -1, }, -- a signed int with n bytes
        Uint = { code = "I", size = -1, }, -- an unsigned int with n bytes
    },
}
DataView.__index = DataView

--[[ Is a dataview type at a specific offset still within buffer length --]]
local function _ib(o, l, t) return ((t.size < 0 and true) or (o + (t.size - 1) <= l)) end
local function _ef(big) return (big and DataView.EndBig) or DataView.EndLittle end

--[[ Helper function for setting fixed datatypes within a buffer --]]
local SetFixed = nil

--[[ Create an ArrayBuffer with a size in bytes --]]
function DataView.ArrayBuffer(length)
    return setmetatable({
        offset = 1, length = length, blob = _strblob(length)
    }, DataView)
end

--[[ Wrap a non-internalized string --]]
function DataView.Wrap(blob)
    return setmetatable({
        offset = 1, blob = blob, length = blob:len(),
    }, DataView)
end

function DataView:Buffer() return self.blob end
function DataView:ByteLength() return self.length end
function DataView:ByteOffset() return self.offset end
function DataView:SubView(offset)
    return setmetatable({
        offset = offset, blob = self.blob, length = self.length,
    }, DataView)
end

--[[ Create the API by using DataView.Types. --]]
for label,datatype in pairs(DataView.Types) do
    DataView["Get" .. label] = function(self, offset, endian)
        local o = self.offset + offset
        if _ib(o, self.length, datatype) then
            local v,_ = string.unpack(_ef(endian) .. datatype.code, self.blob, o)
            return v
        end
        return nil -- Out of bounds
    end

    DataView["Set" .. label] = function(self, offset, value, endian)
        local o = self.offset + offset
        if _ib(o, self.length, datatype) then
            return SetFixed(self, o, value, _ef(endian) .. datatype.code)
        end
        return self -- Out of bounds
    end

    -- Ensure cache is correct.
    if datatype.size >= 0 and string.packsize(datatype.code) ~= datatype.size then
        local msg = "Pack size of %s (%d) does not match cached length: (%d)"
        error(msg:format(label, string.packsize(fmt[#fmt]), datatype.size))
        return nil
    end
end

for label,datatype in pairs(DataView.FixedTypes) do
    DataView["GetFixed" .. label] = function(self, offset, typelen, endian)
        local o = self.offset + offset
        if o + (typelen - 1) <= self.length then
            local code = _ef(endian) .. "c" .. tostring(typelen)
            local v,_ = string.unpack(code, self.blob, o)
            return v
        end
        return nil -- Out of bounds
    end

    DataView["SetFixed" .. label] = function(self, offset, typelen, value, endian)
        local o = self.offset + offset
        if o + (typelen - 1) <= self.length then
            local code = _ef(endian) .. "c" .. tostring(typelen)
            return SetFixed(self, o, value, code)
        end
        return self
    end
end

--[[ Helper function for setting fixed datatypes within a buffer --]]
SetFixed = function(self, offset, value, code)
    local fmt = { }
    local values = { }

    -- All bytes prior to the offset
    if self.offset < offset then
        local size = offset - self.offset
        fmt[#fmt + 1] = "c" .. tostring(size)
        values[#values + 1] = self.blob:sub(self.offset, size)
    end

    fmt[#fmt + 1] = code
    values[#values + 1] = value

    -- All bytes after the value (offset + size) to the end of the buffer
    -- growing the buffer if needed.
    local ps = string.packsize(fmt[#fmt])
    if (offset + ps) <= self.length then
        local newoff = offset + ps
        local size = self.length - newoff + 1

        fmt[#fmt + 1] = "c" .. tostring(size)
        values[#values + 1] = self.blob:sub(newoff, self.length)
    end

    self.blob = string.pack(table.concat(fmt, ""), table.unpack(values))
    self.length = self.blob:len()
    return self
end



-------------------------------------------
local playerDragId = 0


RegisterNUICallback('transferItem', function(data, cb)
	TriggerEvent("gum_inventory:CloseInv2");
	giveItemEnable = true
end)

RegisterNetEvent('gum_inventory:CloseInv2')
AddEventHandler('gum_inventory:CloseInv2', function()
	Show_Items(false, false)
	SetNuiFocus(true, true)
end)

RegisterNUICallback('transferToPlayer', function(data, cb)
	giveItemEnable = false
	idPlayerForItem = playerDragId
	if idPlayerForItem ~= 0 then
		if data.item == "money" then
			TriggerEvent("guminputs:getInput", Config.Language[2].text, Config.Language[4].text, function(cb)
				local count_money = tonumber(cb)
				if count_money ~= nil then
					if count_money ~= 'close' and count_money > 0 and data.count >= count_money then
						TriggerServerEvent("gum_inventory:turn_ped", tonumber(idPlayerForItem))
						TriggerServerEvent("gum_inventory:give_money", tonumber(idPlayerForItem), count_money, GetPlayerServerId(PlayerId()))
						clearThisFunction()
					else
						clearThisFunction()
					end
				end
			end)
		elseif data.item == "gold" then
			TriggerEvent("guminputs:getInput", Config.Language[3].text, Config.Language[5].text, function(cb)
				local count_gold = tonumber(cb)
				if count_gold ~= nil then
					if count_gold ~= 'close' and count_gold > 0 and data.count >= count_gold then
						TriggerServerEvent("gum_inventory:turn_ped", tonumber(idPlayerForItem))
						TriggerServerEvent("gum_inventory:give_gold", tonumber(idPlayerForItem), count_gold, GetPlayerServerId(PlayerId()))
						clearThisFunction()
					else
						clearThisFunction()
					end
				end
			end)
		else
			if data.size <= data.size+size then
				if data.weapon == false then
					if tonumber(data.countInInventory) == 1 then
						TriggerServerEvent("gum_inventory:turn_ped", tonumber(idPlayerForItem))
						TriggerServerEvent("gumCore:subItemByID", GetPlayerServerId(PlayerId()), data.itemId, 1)
						local emptyMetadata = false
						if data.metaData ~= nil then
							for z,x in pairs(data.metaData) do
								emptyMetadata = true
							end
						end
						if emptyMetadata == true then
							TriggerServerEvent("gumCore:addItem", tonumber(idPlayerForItem), data.item, data.count, data.metaData, GetPlayerServerId(PlayerId()))
						else
							TriggerServerEvent("gumCore:addItem", tonumber(idPlayerForItem), data.item, data.count, nil, GetPlayerServerId(PlayerId()))
						end
						clearThisFunction()
					else
						TriggerEvent("guminputs:getInput", Config.Language[3].text, Config.Language[6].text, function(cb)
							local count_item = tonumber(cb)
							if count_item ~= nil then
								if count_item ~= 'close' and count_item > 0 and data.count >= count_item then
									SetNuiFocus(false, false)
									TriggerServerEvent("gum_inventory:turn_ped", tonumber(idPlayerForItem))
									TriggerServerEvent("gumCore:subItemByID", GetPlayerServerId(PlayerId()), data.itemId, count_item)
									local emptyMetadata = false
									if data.metaData ~= nil then
										for z,x in pairs(data.metaData) do
											emptyMetadata = true
										end
									end
									if emptyMetadata == true then
										TriggerServerEvent("gumCore:addItem", tonumber(idPlayerForItem), data.item, count_item, data.metaData, GetPlayerServerId(PlayerId()))
									else
										TriggerServerEvent("gumCore:addItem", tonumber(idPlayerForItem), data.item, count_item, nil, GetPlayerServerId(PlayerId()))
									end
									clearThisFunction()
								else
									clearThisFunction()
								end
							end
						end)
					end
				else
					if data.used == 1 then
						clearThisFunction()
						exports['gum_notify']:DisplayLeftNotification(Config.Language[10].text, Config.Language[7].text, 'pistol', 2000)
					else
						for k,v in pairs(weapon_table) do
							if tonumber(data.id) == tonumber(v.id) then
								TriggerServerEvent("gum_inventory:turn_ped", tonumber(idPlayerForItem))
								TriggerServerEvent("gumCore:giveWeapon", GetPlayerServerId(PlayerId()), data.id, tonumber(idPlayerForItem))
								for c,d in pairs(json.decode(v.ammo)) do
									Citizen.InvokeNative(0xB6CFEC32E3742779, PlayerPedId(),GetHashKey(c), 999, 0x2188E0A3);
								end
								clearThisFunction()
							end
						end
					end
				end
			end
		end
	end
end)
function clearThisFunction()
	giveItemEnable = false
	idPlayerForItem = 0
	playerDragId = 0
	SetNuiFocus(false, false)
end

Citizen.CreateThread(function()
	while true do
		local loop = 500
		if giveItemEnable then
			loop = 5
			local a,b,c,d = screenToWorld(-1, 0)
			local entity = GetEntityCoords(c)
			local pCoords = GetEntityCoords(PlayerPedId())
			playerDragId = 0
			for k,v in pairs(GetPlayersClick()) do
				if GetPlayerPed(GetPlayerFromServerId(v)) == c and PlayerPedId() ~= c then
					if GetDistanceBetweenCoords(entity.x, entity.y, entity.z, pCoords.x, pCoords.y, pCoords.z, true) < 7.0 then
						DisableControlAction(0, 0xB2F377E8, true)
						DisableControlAction(0, 0x07CE1E61, true)
						playerDragId = v
						DrawText3D(entity.x,entity.y,entity.z+1.0, "↓")
						Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, entity.x,entity.y,entity.z-1.0, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 1.0, 98, 146, 202, 80, 0, 0, 2, 0, 0, 0, 0)
					end
				end
			end
		end
		TriggerEvent("gum_meta_heal:resSetup", xRes, yRes)
		Citizen.Wait(loop)
	end
end)

RegisterNUICallback('screen', function(data, cb)
    xRes = tonumber(data.x)
    yRes = tonumber(data.y)
end)

function mulNumber(vector1, value)
    local result = {}
    result.x = vector1.x * value
    result.y = vector1.y * value
    result.z = vector1.z * value
    return result
end

-- Add one vector to another.
function addVector3(vector1, vector2) 
    return {x = vector1.x + vector2.x, y = vector1.y + vector2.y, z = vector1.z + vector2.z}   
end

-- Subtract one vector from another.
function subVector3(vector1, vector2) 
    return {x = vector1.x - vector2.x, y = vector1.y - vector2.y, z = vector1.z - vector2.z}
end

function rotationToDirection(rotation) 
    local z = degToRad(rotation.z)
    local x = degToRad(rotation.x)
    local num = math.abs(math.cos(x))

    local result = {}
    result.x = -math.sin(z) * num
    result.y = math.cos(z) * num
    result.z = math.sin(x)
    return result
end

function w2s(position)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(position.x, position.y, position.z)
    if not onScreen then
        return nil
    end

    local newPos = {}
    newPos.x = (_x - 0.5) * 2
    newPos.y = (_y - 0.5) * 2
    newPos.z = 0
    return newPos
end

function processCoordinates(x, y) 
    local screenX, screenY = xRes, yRes

    local relativeX = 1 - (x / screenX) * 1.0 * 2
    local relativeY = 1 - (y / screenY) * 1.0 * 2

    if relativeX > 0.0 then
        relativeX = -relativeX;
    else
        relativeX = math.abs(relativeX)
    end

    if relativeY > 0.0 then
        relativeY = -relativeY
    else
        relativeY = math.abs(relativeY)
    end

    return { x = relativeX, y = relativeY }
end

function s2w(camPos, relX, relY)
    local camRot = GetGameplayCamRot(0)
    local camForward = rotationToDirection(camRot)
    local rotUp = addVector3(camRot, { x = 10, y = 0, z = 0 })
    local rotDown = addVector3(camRot, { x = -10, y = 0, z = 0 })
    local rotLeft = addVector3(camRot, { x = 0, y = 0, z = -10 })
    local rotRight = addVector3(camRot, { x = 0, y = 0, z = 10 })

    local camRight = subVector3(rotationToDirection(rotRight), rotationToDirection(rotLeft))
    local camUp = subVector3(rotationToDirection(rotUp), rotationToDirection(rotDown))

    local rollRad = -degToRad(camRot.y)
    local camRightRoll = subVector3(mulNumber(camRight, math.cos(rollRad)), mulNumber(camUp, math.sin(rollRad)))
    local camUpRoll = addVector3(mulNumber(camRight, math.sin(rollRad)), mulNumber(camUp, math.cos(rollRad)))

    local point3D = addVector3(addVector3(addVector3(camPos, mulNumber(camForward, 10.0)), camRightRoll), camUpRoll)

    local point2D = w2s(point3D)

    if point2D == undefined then
        return addVector3(camPos, mulNumber(camForward, 10.0))
    end

    local point3DZero = addVector3(camPos, mulNumber(camForward, 10.0))
    local point2DZero = w2s(point3DZero)

    if point2DZero == nil then
        return addVector3(camPos, mulNumber(camForward, 10.0))
    end

    local eps = 0.001

    if math.abs(point2D.x - point2DZero.x) < eps or math.abs(point2D.y - point2DZero.y) < eps then
        return addVector3(camPos, mulNumber(camForward, 10.0))
    end

    local scaleX = (relX - point2DZero.x) / (point2D.x - point2DZero.x)
    local scaleY = (relY - point2DZero.y) / (point2D.y - point2DZero.y)
    local point3Dret = addVector3(addVector3(addVector3(camPos, mulNumber(camForward, 10.0)), mulNumber(camRightRoll, scaleX)), mulNumber(camUpRoll, scaleY))

    return point3Dret
end

function degToRad(deg)
    return (deg * math.pi) / 180.0
end

function screenToWorld(flags, ignore)
    local x, y = GetNuiCursorPosition()

    local absoluteX = x
    local absoluteY = y

    local camPos = GetGameplayCamCoord()
    local processedCoords = processCoordinates(absoluteX, absoluteY)
    local target = s2w(camPos, processedCoords.x, processedCoords.y)

    local dir = subVector3(target, camPos)
    local from = addVector3(camPos, mulNumber(dir, 0.05))
    local to = addVector3(camPos, mulNumber(dir, 300))

    local ray = StartShapeTestRay(from.x, from.y, from.z, to.x, to.y, to.z, flags, ignore, 0)
	local a, b, c, d, e = GetShapeTestResult(ray)
    return b, c, e, to
end

