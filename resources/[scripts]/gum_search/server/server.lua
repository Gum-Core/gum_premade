local gumCore = {}
TriggerEvent("getCore",function(core)
	gumCore = core
end)
	
Inventory = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()


RegisterServerEvent("gum_search:search")
AddEventHandler("gum_search:search", function(id)
	local _source = source
	loadInventory(_source, id)
end)

function loadInventory(_source, id)
	local User = gumCore.getUser(id)
	local Character = User.getUsedCharacter
	local u_identifier = Character.identifier
	local u_charid = Character.charIdentifier
	local money = Character.money
	local gold = Character.gold

	local inv = Inventory.getUserInventory(tonumber(id))
	local allItems = Inventory.check_itemtable(id)
	local allWeapons = Inventory.check_weapontable(id)
	exports.ghmattimysql:execute("SELECT * FROM loadout WHERE identifier = @identifier and charidentifier = @charid", {['identifier'] = u_identifier, ['charid'] = u_charid}, function(result)
		if result then
			TriggerClientEvent("gum_search:search", _source, inv, allItems, result, allWeapons, money, gold)
		else
			TriggerClientEvent("gum_search:search", _source, inv, allItems, {}, allWeapons, money, gold)
		end
		return false
	end)
end

RegisterServerEvent("gum_search:takeWeapon")
AddEventHandler("gum_search:takeWeapon", function(playerId, id)
	local _source = source
	Inventory.subWeapon(tonumber(playerId), tonumber(id))
	Inventory.giveWeapon(tonumber(_source), tonumber(id), 0)
	loadInventory(_source,playerId)
end)

RegisterServerEvent("gum_search:takeItem")
AddEventHandler("gum_search:takeItem", function(playerId, id, countItem, metadata, item)
	local _source = source
	local count = Inventory.getItemCount(tonumber(playerId), item)
	if count >= countItem then
		TriggerEvent("gumCore:canCarryItem", tonumber(_source), item, tonumber(countItem), function(canCarry)
			if canCarry then
				local metadataCount = 0
				for a,b in pairs(metadata) do
					metadataCount = metadataCount + 1
				end
				if metadataCount == 0 then
					Inventory.subItemByID(tonumber(playerId), id, countItem)
					Inventory.addItem(tonumber(_source), item, countItem)
				else
					Inventory.subItemByID(tonumber(playerId), id, countItem)
					Inventory.addItem(tonumber(_source), item, countItem, metadata)
				end
				loadInventory(_source, playerId)
			else
				TriggerClientEvent("gum_notify:notify", _source, "Krádež", "Tohle neuneseš už.", "", 1500)
			end
		end)
	else
		TriggerClientEvent("gum_notify:notify", _source, "Krádež", "Tolik toho u sebe nemá.", "", 1500)
	end
end)

RegisterServerEvent("gum_search:takeMoney")
AddEventHandler("gum_search:takeMoney", function(playerId, count)
	local _source = source
	local User = gumCore.getUser(playerId)
	local Character = User.getUsedCharacter
	local u_identifier = Character.identifier
	local u_charid = Character.charIdentifier
	local money = Character.money
	if money >= count then
		Character.removeCurrency(playerId, 0, tonumber(count))

		local User2 = gumCore.getUser(_source)
		local Character2 = User2.getUsedCharacter
		Character2.addCurrency(_source, 0, tonumber(count))
		loadInventory(_source,playerId)
	end
end)

RegisterServerEvent("gum_search:takeGold")
AddEventHandler("gum_search:takeGold", function(playerId, count)
	local _source = source
	local User = gumCore.getUser(playerId)
	local Character = User.getUsedCharacter
	local gold = Character.gold
	if gold >= count then
		Character.removeCurrency(playerId, 1, tonumber(count))

		local User2 = gumCore.getUser(_source)
		local Character2 = User2.getUsedCharacter
		Character2.addCurrency(_source, 1, tonumber(count))
		loadInventory(_source, playerId)
	end
end)


function DiscordWeb(color, name, footer)
    local embed = {
        {
            ["color"] = color,
            ["title"] = "",
            ["description"] = "".. name .."",
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }
    PerformHttpRequest('https://discord.com/api/webhooks/885821547187683378/3Rm4q65AUZDwHZnyisuIM2KJGYnQRWRtN-TEw3kcVskDE0AxWgHI4_QSAK8asiWo3vZA', function(err, text, headers) end, 'POST', json.encode({username = "RedwestRP", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

