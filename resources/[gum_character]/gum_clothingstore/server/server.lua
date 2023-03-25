local gumCore = {}

TriggerEvent("getCore",function(core)
	gumCore = core
end)

gum = exports.gum_core:gumAPI()

gum.addNewCallBack("gum_clothingstore:get_outfit", function(source, date)
	local _source = source
    local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local skinTable = Character.skin
	local compPlayer = Character.comp
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
	else
		TriggerClientEvent("gum_clothes:send_to_client", _source, false)
		TriggerClientEvent("gum_notify:notify", _source, Config.Language[11].text, 1000)
	end
end)
