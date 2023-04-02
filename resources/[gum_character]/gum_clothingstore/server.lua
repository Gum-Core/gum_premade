local gumCore = {}

TriggerEvent("getCore",function(core)
	gumCore = core
end)

gum = exports.gum_core:gumAPI()
local sharedDress = {}
gum.addNewCallBack("gum_clothingstore:get_outfit", function(source, date)
	local _source = source
    local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local skinTable = Character.skin
	local compPlayer = Character.comp
	local charid = Character.charIdentifier
	sharedDress[_source] = tonumber(charid)
	SetPlayerRoutingBucket(tonumber(_source), tonumber(charid))
	return skinTable, compPlayer
end)

gum.addNewCallBack("gum_clothingstore:get_only_outfit", function(source, date)
	local _source = source
    local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local skinTable = Character.skin
	local compPlayer = Character.comp
	local charid = Character.charIdentifier
	sharedDress[_source] = tonumber(charid)
	return skinTable, compPlayer
end)

RegisterServerEvent('gum_clothes:save_clothes')
AddEventHandler( 'gum_clothes:save_clothes', function(table_cloth, full_price, name_outfit)
	local _source = source
	local User = gumCore.getUser(source)
	local Character = User.getUsedCharacter
	local u_identifier = Character.identifier
	local u_charid = Character.charIdentifier
	local money = Character.money
	if full_price <= money then
		Character.removeCurrency(_source, 0, full_price)
		Character.buySkin(_source, name_outfit, table_cloth)
		Citizen.Wait(500)
		local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid, ['title'] = name_outfit, ['comps'] = json.encode(table_cloth) }
		exports.ghmattimysql:execute("INSERT INTO outfits ( `identifier`,`charidentifier`,`title`,`comps` ) VALUES ( @identifier,@charidentifier,@title,@comps )", Parameters)
		TriggerEvent("gum_clothing:clearSeasonServer", _source)
	else
		TriggerClientEvent("gum_clothes:send_to_client", _source, false)
		TriggerEvent("gum_clothing:clearSeasonServer", _source)
		TriggerClientEvent("gum_notify:notify", _source, Config.Language[11].text, 1000)
	end
end)

RegisterServerEvent("gum_clothing:clearSeason")
AddEventHandler("gum_clothing:clearSeason", function()
	local _source = source
	SetPlayerRoutingBucket(tonumber(_source), 0)
end)
RegisterServerEvent("gum_clothing:clearSeasonServer")
AddEventHandler("gum_clothing:clearSeasonServer", function(source)
	local _source = source
	SetPlayerRoutingBucket(tonumber(_source), 0)
end)

RegisterServerEvent("gum_clothing:joinSeason")
AddEventHandler("gum_clothing:joinSeason", function(id, x, y, z)
	local _source = source
	for a,b in pairs(sharedDress) do
		if tonumber(a) == tonumber(id) then
			SetPlayerRoutingBucket(tonumber(_source), tonumber(b))
			TriggerClientEvent("gum_clothing:joinSeason", _source, x, y, z)
		end
	end
end)