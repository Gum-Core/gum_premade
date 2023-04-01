local gumCore = {}
TriggerEvent("getCore",function(core)
	gumCore = core
end)
	
Inventory = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()

local itemTableForData = {}
local weaponTableForData = {}
local itm_table = {}
local wpn_table = {}
local inv_table = {}
local usableItemsFunctions = {}
local in_inventory_weapons = {}
local new_table = {}
local searched = {}
local inventory_table_sended = {}
local in_inventory = {}
local weapon_table = {}
local in_inventory_count = {}
local count_calc = {}
local lastUsedItemId = {}
local openstorages = {}
local canSaveInventory = {}

RegisterServerEvent('gumCore:registerUsableItem')
AddEventHandler('gumCore:registerUsableItem', function(name, cb)
	usableItemsFunctions[name] = cb
	print("^2 Registered Items : "..name.."^0")
end)

Inventory.RegisterUsableItem("cleanshort", function(data)
	local _source = source
	TriggerClientEvent('gum_inventory:cleaning_weapons', data.source)
	Inventory.subItem(data.source, "cleanshort", 1)
end)

Inventory.RegisterUsableItem("Tallowcloth", function(data)
	local _source = source
	TriggerClientEvent('gum_inventory:cleaning_weapons', data.source)
	Inventory.subItem(data.source, "Tallowcloth", 1)
end)


RegisterServerEvent('gum_inventory:clear_inventory')
AddEventHandler('gum_inventory:clear_inventory', function()
	local _source = source
	in_inventory[tonumber(_source)] = 0
	in_inventory_count[tonumber(_source)] = 0
	inv_table[tonumber(_source)] = {}
	inventory_table_sended[tonumber(_source)] = {}
	new_table[tonumber(_source)] = {}
end)

RegisterServerEvent('gumCore:getItemCount')
AddEventHandler('gumCore:getItemCount', function(source, item, cb)
	local _source = source
	for k,v in pairs(inv_table[tonumber(_source)]) do
		if v.item == item then
			cb(v.count)
		end
	end
end)

RegisterServerEvent('gumCore:getUserInventory')
AddEventHandler('gumCore:getUserInventory', function(source, cb)
	local _source = source
	cb(inv_table[tonumber(_source)])
end)

RegisterServerEvent('gumCore:canCarryItem')
AddEventHandler('gumCore:canCarryItem', function(source, name, count, cb)
	local _source = source
	in_inventory[tonumber(_source)] = 0
	in_inventory_count[tonumber(_source)] = 0
	for k,v in pairs(inv_table[tonumber(_source)]) do
		for k2,v2 in pairs(itm_table) do
			if v.item == v2.item then
				in_inventory[tonumber(_source)] = v.count*tonumber(v2.limit)+tonumber(in_inventory[tonumber(_source)])
			end
		end
	end
	for k2,v2 in pairs(itm_table) do
		if v2.item == name then
			in_inventory_count[tonumber(_source)] = tonumber(count)*tonumber(v2.limit)
		end
	end
	if in_inventory[tonumber(_source)] == nil then
		in_inventory[tonumber(_source)] = 0
	end
	if tonumber(in_inventory[tonumber(_source)])+tonumber(in_inventory_count[tonumber(_source)]) >= Config.Max_Items then
		cb(false)
	else
		cb(true)
	end
end)

RegisterServerEvent('gumCore:registerstorage')
AddEventHandler('gumCore:registerstorage', function(source, id, size)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	if id == 0 then
		exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@id' , {["id"]=id}, function(result)
			if result[1] == nil then
				local Parameters = { ['identifier'] = identifier, ['charid'] = charid, ['size']=tonumber(size)}
				exports.ghmattimysql:execute("INSERT INTO inventory_storage ( `identifier`,`charid`,`size`) VALUES (@identifier,@charid,@size)", Parameters)
			end
		end)
	else
		exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@id' , {["id"]=id}, function(result)
			if result[1] == nil then
				exports.ghmattimysql:execute("INSERT inventory_storage SET identifier=@identifier, charid=@charid, size=@size", {['identifier']= id, ['charid']= 0, ['size']=tonumber(size)},
				function (result)
				end)
			end
		end)
	end
end)

RegisterServerEvent('gumCore:openstorage')
AddEventHandler('gumCore:openstorage', function(source, id)
	local _source = source
	for a,b in pairs(openstorages) do
		for c,d in pairs(b) do
			if d == id then
				if playerIsActive(a) == true then
					TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('39'), 'bag', 2500)
				else
					for k,v in pairs(openstorages[a]) do
						table.remove(openstorages[a], k)
					end
					TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('46'), 'bag', 2500)
				end
				return false
			end
		end
	end
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	exports.ghmattimysql:execute('SELECT items,size FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(resultStorage)
		if resultStorage[1] ~= nil then
			table.insert(openstorages[_source], id)
			TriggerClientEvent("gum_inventory:get_storage", tonumber(_source), json.decode(resultStorage[1].items), itm_table, wpn_table, id, resultStorage[1].size)
		else
			TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('38'), 'bag', 2500)
		end
	end)

end)

function playerIsActive(playerId)
	local returnCheck = false
	for a,b in pairs(GetPlayers()) do
		if tonumber(b) == tonumber(playerId) then
			returnCheck = true
		end
	end
	if returnCheck == true then
		return true
	else
		return false
	end
end

RegisterServerEvent('gumCore:closestorage')
AddEventHandler('gumCore:closestorage', function(id)
	local _source = source
	for a,b in pairs(openstorages[_source]) do
		table.remove(openstorages[_source], a)
	end
end)

AddEventHandler('playerDropped', function(reason)
	local _source = source
	if openstorages[source] ~= nil then
		for a,b in pairs(openstorages[source]) do
			table.remove(openstorages[source], a)
		end
	end
end)


RegisterServerEvent('gumCore:updatestorage')
AddEventHandler('gumCore:updatestorage', function(source, id, size)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier

	exports.ghmattimysql:execute("UPDATE inventory_storage SET size = @size WHERE identifier = @identifier", {['identifier'] = id, ['size'] = size},
		function (result)
		
		gumCore.Debug("CharIdentifier : "..charid.." \nUpdated storage to "..size)

	end)
end)

RegisterServerEvent('gumCore:canCarryItems')
AddEventHandler('gumCore:canCarryItems', function(source, count, cb)
	local _source = source
	local items_inventory = 0

	for k,v in pairs(inv_table[tonumber(_source)]) do
		items_inventory = items_inventory+v.count
	end
	if items_inventory+count <= Config.Max_Items then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('gumCore:canCarryWeapons')
AddEventHandler('gumCore:canCarryWeapons', function(source, count, cb)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	if in_inventory_weapons[tonumber(_source)] == nil then
		cb(true)
	end
	if in_inventory_weapons[tonumber(_source)] ~= nil then
		if in_inventory_weapons[tonumber(_source)] >= Config.Max_Weapons then
			cb(false)
		else
			cb(true)
		end
	end
end)

RegisterNetEvent('gum:use')
AddEventHandler('gum:use', function(name, id, args)
	local _source = source
	for k2,v2 in pairs(itm_table) do
		if name == v2.item then
			if v2.usable == true then
				local arguments = {source = _source, item=v2.item, label=v2.label, limit=v2.limit}, {item = {item=v2.item, label=v2.label, limit=v2.limit}}, {"args", args}
				if (usableItemsFunctions[name]) ~= nil then
					if tonumber(v2.metadata) == 1 then
						lastUsedItemId[tonumber(_source)] = id
					end
					usableItemsFunctions[name](arguments);
				else
					gumCore.Error(""..v2.item.." : item is usable and without any function")
				end
			end
		end
	end
end)

RegisterServerEvent('gumCore:getLastUsedId')
AddEventHandler('gumCore:getLastUsedId', function(source, cb)
	local _source = source
	cb(lastUsedItemId[tonumber(_source)])
end)

RegisterServerEvent('gum_inventory:get_storage_srv')
AddEventHandler('gum_inventory:get_storage_srv', function(source, id)
	local _source = source
	exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
		if result[1] ~= nil then
			TriggerClientEvent("gum_inventory:refresh_storage", tonumber(_source), json.decode(result[1].items), itm_table, wpn_table, id, result[1].size)
		end
	end)
end)

RegisterServerEvent('gum_inventory:transfer_item_to_storage')
AddEventHandler('gum_inventory:transfer_item_to_storage', function(item, count, id, itemId, metaData)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	if tostring(id) ~= '0' or tostring(id) ~= '' or tostring(id) ~= nil then
		exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
			if result[1] ~= nil then
				new_table[tonumber(_source)] = {}
				new_table[tonumber(_source)] = json.decode(result[1].items)
				searched[tonumber(_source)] = false
				for a,b in pairs(new_table[tonumber(_source)]) do
					if item == b.item and metaData == nil then
						searched[tonumber(_source)] = true
					end
				end
				if searched[tonumber(_source)] == true then
					for a,b in pairs(new_table[tonumber(_source)]) do
						if item == b.item then
							if metaData == nil then
								table.remove(new_table[tonumber(_source)], a)
								table.insert(new_table[tonumber(_source)], {item=item, count=math.floor(count+b.count), metaData={}, itemId=itemId})
								exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
								function (result)
									gumCore.Debug("Player with CharID : "..charid.." Transfer item to storage : "..id)
									Inventory.subItemByID(tonumber(_source), itemId, count)
									TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
								end)
								return false
							end
						end
					end
				else
					if metaData == nil then
						table.insert(new_table[tonumber(_source)], {item=item, count=math.floor(count), metaData={}, itemId=itemId})
					else
						table.insert(new_table[tonumber(_source)], {item=item, count=math.floor(count), metaData=metaData, itemId=itemId})
					end
					exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
					function (result)
						gumCore.Debug("Player with CharID : "..charid.." Transfer item to storage : "..id)
						Inventory.subItemByID(tonumber(_source), itemId, count)
						TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
					end)
					return false
				end
			end
		end)
	else
		gumCore.Error("Player with CharID : "..charid.." \nSometing is wrong : "..id.." with transfering item to storage")
	end
end)


RegisterServerEvent('gum_inventory:transfer_item_from_storage')
AddEventHandler('gum_inventory:transfer_item_from_storage', function(item, count, id, itemId, metaData)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	if tostring(id) ~= '0' or tostring(id) ~= '' or tostring(id) ~= nil then
		exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
			if result ~= nil then
				TriggerEvent("gumCore:canCarryItem", tonumber(_source), item, math.floor(tonumber(count)), function(canCarry2)
					if canCarry2 then
						new_table[tonumber(_source)] = {}
						new_table[tonumber(_source)] = json.decode(result[1].items)
						for a,b in pairs(new_table[tonumber(_source)]) do
							if tonumber(itemId) == tonumber(b.itemId) and item == b.item then
								if metaData == nil then
									table.remove(new_table[tonumber(_source)], a)
									if math.floor(b.count-tonumber(count)) ~= 0 then
										table.insert(new_table[tonumber(_source)], {item=item, count=math.floor(b.count-tonumber(count)), metaData={}, itemId=itemId})
									end
									Inventory.addItem(tonumber(_source), item, math.floor(tonumber(count)))
									exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
									function (result)
									end)
									gumCore.Debug("Player with CharID : "..charid.." Trasnfer item from storage : "..id)
									Citizen.Wait(100)
									TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
									return false
								end
								if metaData ~= nil then
									table.remove(new_table[tonumber(_source)], a)
									if math.floor(b.count-tonumber(count)) ~= 0 then
										table.insert(new_table[tonumber(_source)], {item=item, count=math.floor(b.count-tonumber(count)), metaData=metaData, itemId=itemId})
									end
									Inventory.addItem(tonumber(_source), item, math.floor(tonumber(count)), metaData)
									exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
									function (result)
									end)
									gumCore.Debug("Player with CharID : "..charid.." Trasnfer item from storage : "..id)
									Citizen.Wait(100)
									TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
									return false
								end
							end
						end

					else
						TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
						TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('41'), 'bag', 2500)
					end
				end)
			end
		end)
	else
		gumCore.Error("Player with CharID : "..charid.." \nSometing is wrong with takeing item from storage "..id)
	end
end)

RegisterServerEvent('gum_inventory:transfer_money_to_storage')
AddEventHandler('gum_inventory:transfer_money_to_storage', function(item, count, id)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local user_money = Character.money
	if tostring(id) ~= '0' then
		if user_money >= count then
			exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
				if result ~= nil then
					for k,v in pairs(result) do
						for k2,v2 in pairs(v) do
							searched[tonumber(_source)] = false
							new_table[tonumber(_source)] = {}
							new_table[tonumber(_source)] = json.decode(v2)
							for k3,v3 in pairs(new_table[tonumber(_source)]) do
								if v3.item == item then
									if searched[tonumber(_source)] == false then
										searched[tonumber(_source)] = true
										table.remove(new_table[tonumber(_source)], k3)
										table.insert(new_table[tonumber(_source)], {item="money", count=tonumber(count)+tonumber(v3.count)})
									end
								end
							end
							if searched[tonumber(_source)] == false then
								table.insert(new_table[tonumber(_source)], {item="money", count=count})
							end
							Character.removeCurrency(tonumber(_source), 0, tonumber(count))

							if tostring(id) ~= '0' then
								gumCore.Debug("Player with CharID : "..charid.." Transfer money to storage : "..id)
								exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
								function (result)
									TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
								end)
							end
						end
					end
				end
			end)
		else
			TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
			TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('40'), 'bag', 2500)
		end
	else
		gumCore.Error("Player with CharID : "..charid.." \nSometing is wrong : "..id.." with transfering money to storage")
	end
end)

RegisterServerEvent('gum_inventory:transfer_gold_to_storage')
AddEventHandler('gum_inventory:transfer_gold_to_storage', function(item, count, id)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local user_money = Character.gold
	if tostring(id) ~= '0' then
		if user_money >= count then
			exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
				if result ~= nil then
					for k,v in pairs(result) do
						for k2,v2 in pairs(v) do
							searched[tonumber(_source)] = false
							new_table[tonumber(_source)] = {}
							new_table[tonumber(_source)] = json.decode(v2)
							for k3,v3 in pairs(new_table[tonumber(_source)]) do
								if v3.item == item then
									if searched[tonumber(_source)] == false then
										searched[tonumber(_source)] = true
										table.insert(new_table[tonumber(_source)], {item="gold", count=count+v3.count})
										table.remove(new_table[tonumber(_source)], k3)
									end
								end
							end
							if searched[tonumber(_source)] == false then
								table.insert(new_table[tonumber(_source)], {item="gold", count=count})
							end
							Character.removeCurrency(tonumber(_source), 1, tonumber(count))

							if tostring(id) ~= '0' then
								gumCore.Debug("Player with CharID : "..charid.." Transfer gold to storage : "..id)
								exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
								function (result)
									TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
								end)
							end
						end
					end
				end
			end)
		else
			TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
			TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('40'), 'bag', 2500)
		end
	else
		gumCore.Error("Player with CharID : "..charid.." \nSometing is wrong : "..id.." with transfering gold to storage")
	end
end)

RegisterServerEvent('gum_inventory:transfer_money_from_storage')
AddEventHandler('gum_inventory:transfer_money_from_storage', function(item, count, id)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	if tostring(id) ~= '0' then
		exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
			if result ~= nil then
				for k,v in pairs(result) do
					for k2,v2 in pairs(v) do
						searched[tonumber(_source)] = false
						new_table[tonumber(_source)] = {}
						new_table[tonumber(_source)] = json.decode(v2)
						for k3,v3 in pairs(new_table[tonumber(_source)]) do
							if v3.item == item then
								if searched[tonumber(_source)] == false then
									searched[tonumber(_source)] = true
									if v3.count-tonumber(count) ~= 0 then
										table.insert(new_table[tonumber(_source)], {item=item, count=v3.count-tonumber(count)})
									end
									table.remove(new_table[tonumber(_source)], k3)
								end
							end
						end
						Character.addCurrency(tonumber(_source), 0, tonumber(count))

						if tostring(id) ~= '0' then
							gumCore.Debug("Player with CharID : "..charid.." Transfer money from storage : "..id)
							exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
							function (result)
								TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
							end)
						end
					end
				end
			end
		end)
	else
		gumCore.Error("Player with CharID : "..charid.." \nSometing is wrong : "..id.." with transfering money from storage")
	end
end)

RegisterServerEvent('gum_inventory:transfer_gold_from_storage')
AddEventHandler('gum_inventory:transfer_gold_from_storage', function(item, count, id)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	if tostring(id) ~= '0' then
		exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
			if result ~= nil then
				for k,v in pairs(result) do
					for k2,v2 in pairs(v) do
						searched[tonumber(_source)] = false
						new_table[tonumber(_source)] = {}
						new_table[tonumber(_source)] = json.decode(v2)
						for k3,v3 in pairs(new_table[tonumber(_source)]) do
							if v3.item == item then
								if searched[tonumber(_source)] == false then
									searched[tonumber(_source)] = true
									if v3.count-tonumber(count) ~= 0 then
										table.insert(new_table[tonumber(_source)], {item=item, count=v3.count-tonumber(count)})
									end
									table.remove(new_table[tonumber(_source)], k3)
								end
							end
						end
						Character.addCurrency(tonumber(_source), 1, tonumber(count))

						if tostring(id) ~= '0' then
							gumCore.Debug("Player with ID : ".._source.." Trasnfer gold from storage : "..id)
							exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
							function (result)
								TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
							end)
						end
					end
				end
			end
		end)
	else
		gumCore.Error("Player with CharID : "..charid.." \nSometing is wrong : "..id.." with transfering gold from storage")
	end
end)

RegisterServerEvent('gum_inventory:transfer_weapon_to_storage')
AddEventHandler('gum_inventory:transfer_weapon_to_storage', function(id_item, item, id)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	Inventory.subWeapon(tonumber(_source), id_item)
	if tostring(id) ~= '0' then
		exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
			if result ~= nil then
				for k,v in pairs(result) do
					for k2,v2 in pairs(v) do
						new_table[tonumber(_source)] = {}
						new_table[tonumber(_source)] = json.decode(v2)
						table.insert(new_table[tonumber(_source)], {item=id_item, name=item})
						if tostring(id) ~= '0' then
							gumCore.Debug("Player with ID : "..charid.." Transfer weapon to storage : "..id)
							exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
							function (result)
								TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
							end)
						end
					end
				end
			end
		end)
	else
		gumCore.Debug("Player with : "..charid.." \nSomething is wrong with transfering weapon to storage "..id)
	end
end)

RegisterServerEvent('gum_inventory:transfer_weapon_from_storage')
AddEventHandler('gum_inventory:transfer_weapon_from_storage', function(item, id)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	if tostring(id) ~= '0' then
		TriggerEvent("gumCore:canCarryWeapons", tonumber(_source), 1, function(canCarry)
			if canCarry then
				Inventory.giveWeapon(tonumber(_source), tonumber(item), 0)
				exports.ghmattimysql:execute('SELECT items FROM inventory_storage WHERE identifier=@identifier' , {["identifier"]=id}, function(result)
					if result ~= nil then
						for k,v in pairs(result) do
							for k2,v2 in pairs(v) do
								new_table[tonumber(_source)] = {}
								new_table[tonumber(_source)] = json.decode(v2)
								for k3,v3 in pairs(new_table[tonumber(_source)]) do
									if v3.item == tonumber(item) then
										table.remove(new_table[tonumber(_source)], k3)
									end
								end
								if tostring(id) ~= '0' then
									gumCore.Debug("Player with ID : ".._source.." Transfer weapon from storage : "..id)
									exports.ghmattimysql:execute("UPDATE inventory_storage SET items = @items WHERE identifier = @identifier", {['identifier'] = id, ['items'] = json.encode(new_table[tonumber(_source)])},
									function (result)
										TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
									end)
								end
							end
						end
					end
				end)
			else
				TriggerEvent("gum_inventory:get_storage_srv", tonumber(_source), id)
				TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('41'), 'bag', 2500)
			end
		end)
	else
		gumCore.Debug("Player with : "..charid.." \nSomething is wrong with transfering weapon from storage "..id)
	end
end)

RegisterServerEvent('gum_inventory:get_items')
AddEventHandler('gum_inventory:get_items', function()
	local _source = source
	local User = gumCore.getUser(_source)
	if User ~= nil then
		openstorages[_source] = {}
		local Character = User.getUsedCharacter
		local identifier = Character.identifier
		local charid = Character.charIdentifier
		exports.ghmattimysql:execute('SELECT inventory FROM characters WHERE identifier=@identifier and charidentifier=@charidentifier' , {["identifier"]=identifier,["charidentifier"]=charid}, function(resultInventory)
			if resultInventory[1] ~= nil then
				inv_table[tonumber(_source)] = json.decode(resultInventory[1].inventory)
				inventory_table_sended[tonumber(_source)] = {}
				for a,b in pairs(inv_table[tonumber(_source)]) do
					if itemTableForData[b.item] ~= nil then
						table.insert(inventory_table_sended[tonumber(_source)], {item=itemTableForData[b.item].item, label=itemTableForData[b.item].label, count=math.floor(b.count), description=itemTableForData[b.item].descriptions, usable=itemTableForData[b.item].usable, limit=itemTableForData[b.item].limit, metaData=b.metaData, itemId=tonumber(b.itemId), category=itemTableForData[b.item].category})
					end
				end
				exports.ghmattimysql:execute('SELECT id,identifier,name,ammo,used,comps,dirtlevel,conditionlevel FROM loadout WHERE charidentifier = @charidentifier AND identifier = @identifier' , {['charidentifier'] = charid, ['identifier'] = identifier}, function(result)
					if result ~= nil then
						weapon_table[tonumber(_source)]  = {}
						for a,b in pairs(result) do
							if weaponTableForData[b.name] ~= nil then
								table.insert(weapon_table[tonumber(_source)], {id=b.id, name=b.name, label=weaponTableForData[b.name].label, ammo=b.ammo, used=b.used, comps=b.comps, dirtlevel=b.dirtlevel, conditionlevel=b.conditionlevel, category=weaponTableForData[b.name].category})
							end
						end
						in_inventory_weapons[tonumber(_source)] = #weapon_table[tonumber(_source)]
						TriggerClientEvent("gum_inventory:send_list_inventory", tonumber(_source), inventory_table_sended[tonumber(_source)], weapon_table[tonumber(_source)], itm_table, wpn_table)
					else
						weapon_table[tonumber(_source)] = {}
						in_inventory_weapons[tonumber(_source)] = 0
						TriggerClientEvent("gum_inventory:send_list_inventory", tonumber(_source), inventory_table_sended[tonumber(_source)], weapon_table[tonumber(_source)], itm_table, wpn_table)
					end
				end)
			end
		end)
	end
end)

RegisterServerEvent('gum_inventory:get_money')
AddEventHandler('gum_inventory:get_money', function()
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	if User~= nil then
		local Character = User.getUsedCharacter
		local user_money = Character.money
		local user_gold = Character.gold
		TriggerClientEvent("gum_inventory:send_list_money", tonumber(_source), user_money, user_gold)
	end
end)

RegisterServerEvent('gum_inventory:get_money_sec')
AddEventHandler('gum_inventory:get_money_sec', function(source)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local user_money = Character.money
	local user_gold = Character.gold
	TriggerClientEvent("gum_inventory:send_list_money", tonumber(_source), user_money, user_gold)
end)

RegisterServerEvent('gum_inventory:get_items_sec')
AddEventHandler('gum_inventory:get_items_sec', function(source)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier

	exports.ghmattimysql:execute('SELECT id,identifier,name,ammo,used,comps,dirtlevel,conditionlevel FROM loadout WHERE charidentifier = @charidentifier AND identifier = @identifier' , {['charidentifier'] = charid, ['identifier'] = identifier}, function(result2)
		if result2[1] ~= nil then
			in_inventory_weapons[tonumber(_source)] = 0
			weapon_table[tonumber(_source)]  = {}
			inventory_table_sended[tonumber(_source)] = {}
			for a,b in pairs(result2) do
				if weaponTableForData[b.name] ~= nil then
					table.insert(weapon_table[tonumber(_source)], {id=b.id, name=b.name, label=weaponTableForData[b.name].label, ammo=b.ammo, used=b.used, comps=b.comps, dirtlevel=b.dirtlevel, conditionlevel=b.conditionlevel})
				end
			end
			in_inventory_weapons[tonumber(_source)] = #weapon_table[tonumber(_source)]
			updateItemsInventory(tonumber(_source))
		else
			weapon_table[tonumber(_source)] = {}
			inventory_table_sended[tonumber(_source)] = {}
			updateItemsInventory(tonumber(_source))
		end
	end)

end)

RegisterServerEvent('gumCore:addItem')
AddEventHandler('gumCore:addItem', function(source, name, count, metaDataData, playerBackup)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local CharIdentifier = Character.charIdentifier
	local randomId = math.random(1,99999999999999)
	local metaData = {}
	local counter = 0
	count_calc[_source] = 0
	in_inventory[tonumber(_source)] = 0
	in_inventory_count[tonumber(_source)] = 0
	for k,v in pairs(inv_table[tonumber(_source)]) do
		if v.item == name then
			counter = k
			in_inventory[tonumber(_source)] = v.count*itemTableForData[name].limit+in_inventory[tonumber(_source)]
			in_inventory_count[tonumber(_source)] = count*itemTableForData[name].limit
		end
	end
	count_calc[_source] = count*itemTableForData[name].limit
	if in_inventory[tonumber(_source)] == nil then
		in_inventory[tonumber(_source)] = 0
	end
	if playerBackup ~= nil then
		if tonumber(in_inventory[tonumber(_source)]+in_inventory_count[tonumber(_source)]) >= Config.Max_Items then
			Inventory.addItem(tonumber(playerBackup), name, tonumber(count))
			TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('41'), 'bag', 2500)
			TriggerClientEvent("gum_notify:notify", tonumber(playerBackup), _U('10'), _U('42'), 'bag', 2500)
			return false
		end
		if metaDataData ~= nil then
			metaData = metaDataData
			for i=1, count do
				local randomId = math.random(1,99999999999999)
				table.insert(inv_table[tonumber(_source)], {itemId=randomId, item=name, count=1, metaData=metaData})
			end
			updateItemsInventory(_source)
		else
			if counter == 0 then
				table.insert(inv_table[tonumber(_source)], {itemId=randomId, item=name, count=math.floor(count), metaData={}})
				updateItemsInventory(_source)
			else
				inv_table[tonumber(_source)][counter].count = math.floor(inv_table[tonumber(_source)][counter].count+count)
				updateItemsInventory(_source)
			end
		end
	else
		if tonumber(in_inventory[tonumber(_source)]+count_calc[_source]) >= Config.Max_Items then
			TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('41'), 'bag', 2500)
			return false
		end
		if metaDataData ~= nil then
			metaData = metaDataData
			for i=1, count do
				local randomId = math.random(1,99999999999999)
				table.insert(inv_table[tonumber(_source)], {itemId=randomId, item=name, count=1, metaData=metaData})
			end
			updateItemsInventory(_source)
		else
			if counter == 0 then
				table.insert(inv_table[tonumber(_source)], {itemId=randomId, item=name, count=math.floor(count), metaData={}})
				updateItemsInventory(_source)
			else
				inv_table[tonumber(_source)][counter].count = math.floor(inv_table[tonumber(_source)][counter].count+count)
				updateItemsInventory(_source)
			end
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(2000)
	loadPreTable()
	while true do
		for _, playerId in ipairs(GetPlayers()) do
			local _source = playerId
			if canSaveInventory[tonumber(_source)] == true then
				local User = gumCore.getUser(tonumber(_source))
				local Character = User.getUsedCharacter
				local identifier = Character.identifier
				local CharIdentifier = Character.charIdentifier
				exports.ghmattimysql:execute("UPDATE characters SET inventory = @inventory WHERE identifier = @identifier and charidentifier = @charidentifier", {['identifier'] = identifier, ['charidentifier']=CharIdentifier, ['inventory'] = json.encode(inv_table[tonumber(_source)])},
				function (result)
					canSaveInventory[tonumber(_source)] = false
					gumCore.Debug("[Inventory] CharIdentifier : "..CharIdentifier.." inventory has been saved!")
				end)
				Citizen.Wait(100)
			end
		end
		Citizen.Wait(10000)
	end
end)

function loadPreTable()
	itm_table = Inventory.preload_itemtable()
	wpn_table = Inventory.preload_weapontable()
	for a,b in pairs(itm_table) do
		itemTableForData[b.item] = {item=b.item, label=b.label, limit=b.limit, can_remove=b.can_remove, type=b.type, usable=b.usable, descriptions=b.descriptions, metadata=b.metadata, category=b.category}
	end
	for a,b in pairs(wpn_table) do
		weaponTableForData[b.item] = {item=b.item, label=b.label, category="weapon"}
	end
end

function updateItemsInventory(_source)
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local CharIdentifier = Character.charIdentifier

	inventory_table_sended[tonumber(_source)] = {}
	for a,b in pairs(inv_table[tonumber(_source)]) do
		if itemTableForData[b.item] ~= nil then
			table.insert(inventory_table_sended[tonumber(_source)], {item=itemTableForData[b.item].item, label=itemTableForData[b.item].label, count=math.floor(b.count), description=itemTableForData[b.item].descriptions, usable=itemTableForData[b.item].usable, limit=itemTableForData[b.item].limit, metaData=b.metaData, itemId=tonumber(b.itemId), category=itemTableForData[b.item].category})
		end
	end
	Citizen.Wait(50)
	TriggerClientEvent("gum_inventory:send_list_inventory", tonumber(_source), inventory_table_sended[tonumber(_source)], weapon_table[tonumber(_source)], itm_table, wpn_table)
	canSaveInventory[tonumber(_source)] = true
end

AddEventHandler('playerDropped', function (reason)
	local _source = source
	if canSaveInventory[tonumber(_source)] == true then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		exports.ghmattimysql:execute("UPDATE characters SET inventory = @inventory WHERE identifier = @identifier and charidentifier = @charidentifier", {['identifier'] = identifier, ['charidentifier']=CharIdentifier, ['inventory'] = json.encode(inv_table[tonumber(_source)])},
		function (result)
			gumCore.Debug("[Inventory] Player drop and CharIdentifier : "..CharIdentifier.." inventory has been saved!")
		end)
	end
end)

RegisterServerEvent('gumCore:subItem')
AddEventHandler('gumCore:subItem', function(source, name, count)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	for k,v in pairs(inv_table[tonumber(_source)]) do
		if v.item == name then
			counter = k
		end
	end
	if inv_table[tonumber(_source)][counter] ~= nil and count ~= nil then
		if inv_table[tonumber(_source)][counter].count-tonumber(count) < 1 then
			table.remove(inv_table[tonumber(_source)], tonumber(counter))
			updateItemsInventory(_source)
		else
			inv_table[tonumber(_source)][counter].count = inv_table[tonumber(_source)][counter].count-tonumber(count)
			updateItemsInventory(_source)
		end
	else
		gumCore.Error("Someting is wrong with items.")
	end
end)


RegisterServerEvent('gumCore:subItemByID')
AddEventHandler('gumCore:subItemByID', function(source, itemId, count)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	local positionId = 0
	for a,b in pairs(inv_table[tonumber(_source)]) do
		if tonumber(b.itemId) == tonumber(itemId) then
			positionId = a
		end
	end
	if positionId ~= 0 then
		if inv_table[tonumber(_source)][positionId].count-tonumber(count) < 1 then
			table.remove(inv_table[tonumber(_source)], tonumber(positionId))
			updateItemsInventory(_source)
		else
			inv_table[tonumber(_source)][positionId].count = inv_table[tonumber(_source)][positionId].count-tonumber(count)
			updateItemsInventory(_source)
		end
	else
		updateItemsInventory(_source)
	end
end)


RegisterServerEvent('gumCore:editMetaDataByItemName')
AddEventHandler('gumCore:editMetaDataByItemName', function(source, item, key, value, cb)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	for a,b in pairs(inv_table[tonumber(_source)]) do
		if b.item == item then
			b.metaData[key] = value
			updateItemsInventory(_source)
			return false
		end
	end
end)

RegisterServerEvent('gumCore:editMetaDataByID')
AddEventHandler('gumCore:editMetaDataByID', function(source, id, key, value, cb)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	for a,b in pairs(inv_table[tonumber(_source)]) do
		if tonumber(b.itemId) == tonumber(id) then
			b.metaData[key] = value
		end
	end
	updateItemsInventory(_source)
end)

RegisterServerEvent('gumCore:getMetadataValue')
AddEventHandler('gumCore:getMetadataValue', function(source, item, data, cb)
	local _source = source
	local metaData = {}
	for k,v in pairs(inv_table[tonumber(_source)]) do
		if tonumber(item) == tonumber(v.itemId) then
			metaData = v.metaData[data]
		end
	end
	cb(metaData)
end)

RegisterServerEvent('gumCore:getMetadata')
AddEventHandler('gumCore:getMetadata', function(source, item, cb)
	local _source = source
	local metaData = {}
	for k,v in pairs(inv_table[tonumber(_source)]) do
		if item == v.itemId then
			metaData = v.metaData
		end
	end
	cb(metaData)
end)

RegisterServerEvent('gumCore:getItemsIdData')
AddEventHandler('gumCore:getItemsIdData', function(source, item, cb)
	local _source = source
	local datas = {}
	for k,v in pairs(inv_table[tonumber(_source)]) do
		if v.item == item then
			table.insert(datas, {id=v.itemId, metaData=v.metaData, item=v.item})
		end
	end
	cb(datas)
end)

RegisterServerEvent('gum_inventory:give_slap')
AddEventHandler('gum_inventory:give_slap', function(target)
	local random = math.random(1, 7)
	TriggerClientEvent("gum_inventory:send_slap", tonumber(source), tonumber(target), random, true)
	TriggerClientEvent("gum_inventory:send_slap", tonumber(target), tonumber(source), random, false)
end)

RegisterServerEvent('gum_inventory:give_hand')
AddEventHandler('gum_inventory:give_hand', function(target)
	TriggerClientEvent("gum_inventory:send_hand", tonumber(source), tonumber(target), true)
	TriggerClientEvent("gum_inventory:send_hand", tonumber(target), tonumber(source), false)
end)

RegisterServerEvent('gum_inventory:hostage')
AddEventHandler('gum_inventory:hostage', function(target, ped)
	TriggerClientEvent("gum_inventory:hostage", tonumber(source), tonumber(target), true)
	TriggerClientEvent("gum_inventory:hostage", tonumber(target), tonumber(source), false)
end)

RegisterServerEvent('gum_inventory:clearHostage')
AddEventHandler('gum_inventory:clearHostage', function(target)
	TriggerClientEvent("gum_inventory:clearHostage", tonumber(target))
end)

RegisterServerEvent('gum_inventory:send_state_weapon')
AddEventHandler('gum_inventory:send_state_weapon', function(wepid, state)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier

	exports.ghmattimysql:execute("UPDATE loadout SET used = @used WHERE identifier = @identifier and charidentifier = @charidentifier and id = @id", {['identifier'] = identifier, ['charidentifier'] = charid, ['id'] = tonumber(wepid), ['used'] = tonumber(state)},
	function (result)
		TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
	end)
end)

RegisterServerEvent('gum_inventory:give_money')
AddEventHandler('gum_inventory:give_money', function(who_get, how_much, who_send)
	local User = gumCore.getUser(tonumber(who_send))
	local Character = User.getUsedCharacter
	local user_money = Character.money
	local charid = Character.charIdentifier
--
	local User2 = gumCore.getUser(tonumber(who_get))
	local Character2 = User2.getUsedCharacter
	local user_money2 = Character2.money
	local charid2 = Character2.charIdentifier
	if tonumber(user_money) >= tonumber(how_much) then
		Character.removeCurrency(tonumber(who_send), 0, tonumber(how_much))
		Character2.addCurrency(tonumber(who_get), 0, tonumber(how_much))
		Citizen.Wait(50)
		TriggerEvent("gum_inventory:get_items_sec", tonumber(who_send))
		TriggerEvent("gum_inventory:get_items_sec", tonumber(who_get))
		gumCore.Debug("CharIdentifier : "..charid.." give money to "..charid2.." : "..how_much.."$")
		TriggerClientEvent("gum_notify:notify", tonumber(who_get), _U('10'), ": "..how_much.." $", 'bag', 3500)
	else
		TriggerClientEvent("gum_notify:notify", tonumber(source), _U('10'), _U('40'), 'bag', 2500)
	end
end)

RegisterServerEvent('gum_inventory:give_gold')
AddEventHandler('gum_inventory:give_gold', function(who_get, how_much, who_send)
	local User = gumCore.getUser(tonumber(who_send))
	local Character = User.getUsedCharacter
	local user_money = Character.gold
	local charid = Character.charIdentifier

	local User2 = gumCore.getUser(tonumber(who_get))
	local Character2 = User2.getUsedCharacter
	local user_money2 = Character2.gold
	local charid2 = Character2.charIdentifier
	if tonumber(user_money) >= tonumber(how_much) then
		Character.removeCurrency(tonumber(who_send), 1, tonumber(how_much))
		Character2.addCurrency(tonumber(who_get), 1, tonumber(how_much))
		Citizen.Wait(50)
		TriggerEvent("gum_inventory:get_items_sec", tonumber(who_send))
		TriggerEvent("gum_inventory:get_items_sec", tonumber(who_get))
		gumCore.Debug("CharIdentifier : "..charid.." give gold to "..charid2.." : "..how_much.."$")
	else
		TriggerClientEvent("gum_notify:notify", tonumber(source), _U('10'), _U('40'), 'bag', 2500)
	end
end)

RegisterServerEvent('gum_inventory:drop_money')
AddEventHandler('gum_inventory:drop_money', function(how_much)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local user_money = Character.money

	if how_much <= user_money then
		Character.removeCurrency(tonumber(_source), 0, tonumber(how_much))
		TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
	end
end)

RegisterServerEvent('gum_inventory:drop_gold')
AddEventHandler('gum_inventory:drop_gold', function(how_much)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local user_gold = Character.gold

	if how_much <= user_gold then
		Character.removeCurrency(tonumber(_source), 1, tonumber(how_much))
		TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
	end
end)

RegisterServerEvent('gum_inventory:drop_give_money')
AddEventHandler('gum_inventory:drop_give_money', function(how_much)
	local _source = source
	local User = gumCore.getUser(tonumber(source))
	local Character = User.getUsedCharacter

	Character.addCurrency(tonumber(_source), 0, tonumber(how_much))
	Citizen.Wait(50)
	TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
end)

RegisterServerEvent('gum_inventory:drop_give_gold')
AddEventHandler('gum_inventory:drop_give_gold', function(how_much)
	local _source = source
	local User = gumCore.getUser(tonumber(source))
	local Character = User.getUsedCharacter

	Character.addCurrency(tonumber(_source), 1, tonumber(how_much))
	Citizen.Wait(50)
	TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
end)

RegisterServerEvent('gum_inventory:turn_ped')
AddEventHandler('gum_inventory:turn_ped', function(target)
	local _source = source
	TriggerClientEvent("gum_inventory:turn_client", tonumber(_source), tonumber(target), 1)
	TriggerClientEvent("gum_inventory:turn_client", tonumber(target), tonumber(_source), 0)
end)

RegisterServerEvent('gumCore:registerWeapon')
AddEventHandler('gumCore:registerWeapon', function(target, name, ammo, comps)
	local User = gumCore.getUser(tonumber(target))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier

	exports.ghmattimysql:execute("INSERT loadout SET identifier=@identifier,  charidentifier=@charidentifier,  name=@name,  ammo=@ammo,  comps=@comps", {['identifier'] = identifier, ['charidentifier'] = charid, ['name'] = name, ['ammo'] = json.encode(ammo), ['comps']='{}'},
	function (result)
		TriggerEvent("gum_inventory:get_items_sec", tonumber(target))
	end)
end)



RegisterServerEvent('gum_inventory:upload_drops')
AddEventHandler('gum_inventory:upload_drops', function(dropped_items)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	local try_table = {}
	local send_table = {}
	local print_id = 0

	exports.ghmattimysql:execute("INSERT drops SET drop_list=@drop_list", {['drop_list']= json.encode(dropped_items)},
	function (result)
		exports.ghmattimysql:execute('SELECT * FROM drops' , {}, function(result)
			if result[1] ~= nil then
				for k,v in pairs(result) do
					for k2,v2 in pairs(v) do
						try_table = json.decode(v.drop_list)
						print_id = v.id
					end
					for k3,v3 in pairs(try_table) do
						table.insert(send_table, {id=print_id, x=v3.x ,y=v3.y, z=v3.z, item=v3.item, count=v3.count, weapon=v3.weapon})
					end
				end
				Citizen.Wait(500)
				TriggerClientEvent("gum_inventory:drop_list", -1, send_table)
			end
		end)
	end)
end)

RegisterServerEvent('gum_inventory:check_drops')
AddEventHandler('gum_inventory:check_drops', function(source)
	local _source = source
	local try_table = {}
	local send_table = {}
	local print_id = 0
	exports.ghmattimysql:execute('SELECT * FROM drops' , {}, function(result)
		if result[1] ~= nil then
			for k,v in pairs(result) do
				for k2,v2 in pairs(v) do
					try_table = json.decode(v.drop_list)
					print_id = v.id
				end
				for k3,v3 in pairs(try_table) do
					if v3.weapon_model == nil then
						table.insert(send_table, {id=print_id, metaData=v3.metaData, x=v3.x ,y=v3.y, z=v3.z, item=v3.item, count=v3.count, weapon=v3.weapon, weapon_model="none"})
					else
						table.insert(send_table, {id=print_id, x=v3.x ,y=v3.y, z=v3.z, item=v3.item, count=v3.count, weapon=v3.weapon, weapon_model=v3.weapon_model})
					end
				end
			end
			Citizen.Wait(500)
			TriggerClientEvent("gum_inventory:drop_list", tonumber(_source), send_table)
		else
			TriggerClientEvent("gum_inventory:drop_list", tonumber(_source), false)
		end
	end)
end)

RegisterServerEvent('gum_inventory:check_drops_1')
AddEventHandler('gum_inventory:check_drops_1', function()
	local _source = source
	local try_table = {}
	local send_table = {}
	local print_id = 0
	exports.ghmattimysql:execute('SELECT * FROM drops' , {}, function(result)
		if result[1] ~= nil then
			for k,v in pairs(result) do
				for k2,v2 in pairs(v) do
					try_table = json.decode(v.drop_list)
					print_id = v.id
				end
				for k3,v3 in pairs(try_table) do
					if v3.weapon_model == nil then
						table.insert(send_table, {id=print_id, metaData=v3.metaData, x=v3.x ,y=v3.y, z=v3.z, item=v3.item, count=v3.count, weapon=v3.weapon, weapon_model="none"})
					else
						table.insert(send_table, {id=print_id, x=v3.x ,y=v3.y, z=v3.z, item=v3.item, count=v3.count, weapon=v3.weapon, weapon_model=v3.weapon_model})
					end
				end
			end
			Citizen.Wait(200)
			TriggerClientEvent("gum_inventory:drop_list", tonumber(_source), send_table)
		end
	end)
end)

RegisterServerEvent('gum_inventory:drop_update')
AddEventHandler('gum_inventory:drop_update', function(id, playerlist)
	local _source = source

	exports.ghmattimysql:execute("DELETE FROM `drops` WHERE `id` = "..id.."", {},
	function (result)
		for k,v in pairs(playerlist) do
			TriggerEvent("gum_inventory:check_drops", tonumber(v.id))
		end
	end)
end)

RegisterServerEvent('gumCore:giveWeapon')
AddEventHandler('gumCore:giveWeapon', function(source, weaponid, target)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	exports.ghmattimysql:execute('SELECT id,identifier,name,ammo,used,comps,dirtlevel,conditionlevel FROM loadout WHERE charidentifier = @charidentifier AND identifier = @identifier' , {['charidentifier'] = charid, ['identifier'] = identifier}, function(result)
		if result ~= nil then
			if in_inventory_weapons[tonumber(_source)] >= Config.Max_Weapons and tonumber(target) == 0 then
				TriggerClientEvent("gum_notify:notify", tonumber(_source), _U('10'), _U('44'), 'bag', 2500)
				return false
			end
			if target ~= nil then
				if tonumber(target) ~= 0 then
					local User2 = gumCore.getUser(tonumber(target))
					local Character_t = User2.getUsedCharacter
					local identifier_t = Character_t.identifier
					local charid_t = Character_t.charIdentifier
					in_inventory_weapons[tonumber(target)] = tonumber(in_inventory_weapons[tonumber(target)])+1

					exports.ghmattimysql:execute("UPDATE loadout SET identifier=@identifier_t, charidentifier=@charidentifier_t WHERE id = @id", {['identifier_t'] = identifier_t, ['charidentifier_t'] = charid_t, ['id'] = weaponid},
					function (result)
						TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
						Citizen.Wait(200)
						TriggerEvent("gum_inventory:get_items_sec", tonumber(target))
					end)
				else
					exports.ghmattimysql:execute("UPDATE loadout SET identifier=@identifier, charidentifier=@charid WHERE id = @id", {['identifier'] = identifier, ['charid'] = charid, ['id'] = weaponid},
					function (result)
						TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
					end)
				end
			end
		else
			exports.ghmattimysql:execute("UPDATE loadout SET identifier=@identifier, charidentifier=@charid WHERE id = @id", {['identifier'] = identifier, ['charid'] = charid, ['id'] = weaponid},
			function (result)
				TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
			end)
		end
	end)
end)

RegisterServerEvent('gumCore:getWeaponBullets')
AddEventHandler('gumCore:getWeaponBullets', function(source, weaponid)
	local _source = source
	
end)

RegisterServerEvent('gumCore:addBullets')
AddEventHandler('gumCore:addBullets', function(source, weaponid)
	local _source = source
end)

RegisterServerEvent('gumCore:giveWeapon_dropped')
AddEventHandler('gumCore:giveWeapon_dropped', function(target, id_weapon)
	local User = gumCore.getUser(tonumber(target))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier

	exports.ghmattimysql:execute("UPDATE loadout SET identifier=@identifier, charidentifier=@charidentifier WHERE id = @id", {['identifier'] = identifier, ['charidentifier'] = charid, ['id'] = id_weapon},
	function (result)
		TriggerEvent("gum_inventory:get_items_sec", tonumber(target))
	end)
end)


RegisterServerEvent('gumCore:subWeapon')
AddEventHandler('gumCore:subWeapon', function(source, weaponid)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier

	exports.ghmattimysql:execute('SELECT name FROM loadout WHERE id=@id' , {["id"]=weaponid}, function(result)
		if result ~= nil then
			TriggerClientEvent("gum_inventory:remove_wepo", tonumber(_source), result[1].name)
			exports.ghmattimysql:execute("UPDATE loadout SET identifier='', charidentifier=0, used=0 WHERE id = @id", {["@id"] = weaponid},
				function (result)
				TriggerEvent("gum_inventory:get_items_sec", tonumber(_source))
			end)
		end
	end)
end)

RegisterServerEvent('gum_inventory:saveAmmoThrow')
AddEventHandler('gum_inventory:saveAmmoThrow', function(wepName, ammoTable, wepCond)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	if User ~= nil then
		local identifier = Character.identifier
	 	local charid = Character.charIdentifier
		local newTableForSave = {}
		for k,v in pairs(ammoTable) do
			if v ~= false then
				newTableForSave[k] = v
			end
		end
		local Parameters = {['identifier'] = identifier, ['charidentifier'] = charid, ['name']=wepName, ['dirtlevel'] = tonumber(wepCond), ['conditionlevel'] = tonumber(wepCond), ['ammo'] = json.encode(newTableForSave)}
		exports.ghmattimysql:execute("UPDATE loadout SET dirtlevel=@dirtlevel, ammo=@ammo, conditionlevel=@conditionlevel WHERE identifier = @identifier AND charidentifier = @charidentifier AND name = @name AND used = 1", Parameters)
	end
end)

RegisterServerEvent('gum_inventory:saveAmmoNormal')
AddEventHandler('gum_inventory:saveAmmoNormal', function(wepName, ammoTable, wepCond)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	if User ~= nil then
		local identifier = Character.identifier
	 	local charid = Character.charIdentifier
		local newTableForSave = {}
		if ammoTable ~= nil then
			for k,v in pairs(ammoTable) do
				if v ~= false then
					newTableForSave[k] = v
				end
			end
			local Parameters = {['identifier'] = identifier, ['charidentifier'] = charid, ['id']=wepName, ['dirtlevel'] = tonumber(wepCond), ['conditionlevel'] = tonumber(wepCond), ['ammo'] = json.encode(newTableForSave)}
			exports.ghmattimysql:execute("UPDATE loadout SET dirtlevel=@dirtlevel, ammo=@ammo, conditionlevel=@conditionlevel WHERE identifier = @identifier AND charidentifier = @charidentifier AND id = @id AND used = 1", Parameters)
		end
	end
end)

RegisterServerEvent('gum_inventory:save_cleaning')
AddEventHandler('gum_inventory:save_cleaning', function(name, cleaning)
	local User = gumCore.getUser(tonumber(source))
	local Character = User.getUsedCharacter
	local identifier = Character.identifier
	local charid = Character.charIdentifier
	local Parameters = {['identifier'] = identifier, ['charidentifier'] = charid, ['name'] = name, ['dirtlevel'] = tonumber(cleaning), ['conditionlevel'] = tonumber(cleaning) }
	exports.ghmattimysql:execute("UPDATE loadout SET dirtlevel=@dirtlevel, conditionlevel=@conditionlevel WHERE identifier = @identifier AND charidentifier=@charidentifier AND name=@name AND used = 1", Parameters)
end)
