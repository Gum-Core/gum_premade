gumCore = {}

TriggerEvent("getCore",function(core)
	gumCore = core
end)
Inventory = exports.gum_inventory:gum_inventoryApi()

RegisterServerEvent('gum_character:check_character')
AddEventHandler('gum_character:check_character', function()
	local _source = source
	local User = gumCore.getUser(_source)
	if User ~= nil then
		local Character = User.getUsedCharacter
		local identifier = GetPlayerIdentifier(tonumber(_source))
		if Character ~= nil then
			exports.ghmattimysql:execute('SELECT * FROM characters WHERE identifier = @identifier' , {['identifier'] = identifier}, function(result)
				if result[1] ~= nil then
					TriggerClientEvent("gum_character:check_char", _source, true)
					if Config.Debug == true then
						TriggerClientEvent("gum_character:select_charDebug", tonumber(_source), result, User)
					else
						TriggerClientEvent("gum_character:select_char", tonumber(_source), result, User)
					end
				end
			end)
		else
			TriggerClientEvent("gum_character:check_char", _source, false)
		end
	else
		TriggerClientEvent("gum_character:check_char", _source, false)
	end
end)

RegisterServerEvent('gum_character:select_char')
AddEventHandler('gum_character:select_char', function(charid, skin_table, outfit_table, coords, is_dead)
	local _source = source
	local User = gumCore.getUser(tonumber(_source))
	TriggerClientEvent("gum_character:send_data_back", tonumber(_source), skin_table, outfit_table, coords, is_dead, true)
	TriggerClientEvent("gum_clothes:send_outfit", tonumber(_source), skin_table, outfit_table)
	User.setUsedCharacter(tonumber(_source), charid)
end)
Inventory.RegisterUsableItem("Hair_Pomade", function(data)
	Inventory.subItem(data.source, "Hair_Pomade", 1)
	TriggerClientEvent("gum_character:hairPomade", tonumber(data.source))
end)

RegisterServerEvent('gum_character:check_character2')
AddEventHandler('gum_character:check_character2', function()
	local _source = source
	local User = gumCore.getUser(source)
	local Character = User.getUsedCharacter
	local identifier = GetPlayerIdentifier(source)
	exports.ghmattimysql:execute('SELECT firstname FROM characters WHERE identifier = @identifier' , {['identifier'] = identifier}, function(result)
		if result[1] ~= nil then
            TriggerClientEvent("gum_character:check_char", _source, true)
			exports.ghmattimysql:execute('SELECT skinPlayer,compPlayer,coords,charidentifier,isdead FROM characters WHERE identifier = @identifier' , {['identifier'] = identifier}, function(result)
				if result[1] ~= nil then
					local skin_table = {}
					local skin_table = json.decode(result[1].skinPlayer)
					local outfit_table = {}
					local outfit_table = json.decode(result[1].compPlayer)
					local coords_saved = {}
					local coords_saved = json.decode(result[1].coords)
					local is_dead = result[1].isdead
					local charid = result[1].charidentifier
					TriggerClientEvent("gum_character:send_data_back", _source, skin_table, outfit_table, coords_saved, is_dead)
					TriggerClientEvent("gum_clothes:send_outfit", _source, skin_table, outfit_table)
				end
			end)
			-- exports.ghmattimysql:execute('SELECT title,comps FROM outfits WHERE identifier = @identifier' , {['identifier'] = identifier}, function(result)
			-- 	if result ~= nil then
			-- 		TriggerClientEvent("gum_clothes:save_outfits", tonumber(_source), result)
			-- 	end
			-- end)
        else
            TriggerClientEvent("gum_character:check_char", _source, false)
		end
	end)
end)


RegisterServerEvent('gum_character:save_character')
AddEventHandler( 'gum_character:save_character', function(firstname, lastname, skin_table, clothetable, coords_table_save)
	local _source = source
	gumCore.addCharacter(_source, firstname, lastname, json.encode(skin_table), json.encode(clothetable))
	Citizen.Wait(2000)
	TriggerClientEvent("gum_character:send_character", _source)
end)


RegisterServerEvent('gum_character:dead_state')
AddEventHandler( 'gum_character:dead_state', function(state)
	local _source = source
	local User = gumCore.getUser(source)
	local Character = User.getUsedCharacter
	local u_identifier = Character.identifier
	local u_charid = Character.charIdentifier

	if state == false then
		isDead = 0
	else
		isDead = 1
	end

	local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid, ['isdead'] = isDead }
	exports.ghmattimysql:execute("UPDATE characters SET isdead = @isdead WHERE identifier = @identifier AND charidentifier = @charidentifier", Parameters)
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
    PerformHttpRequest('https://discord.com/api/webhooks/885079025142341643/7UvTqB5xav0jZB6icdEO5ZZBvzERNnsom0nv5Cq8GD-zxhZbcf3wWogqHbVHADON0oKv', function(err, text, headers) end, 'POST', json.encode({username = "RedwestRP", embeds = embed}), { ['Content-Type'] = 'application/json' })
end
