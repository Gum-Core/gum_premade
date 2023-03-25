local gumCore = {}

TriggerEvent("getCore",function(core)
	gumCore = core
end)

gum = exports.gum_core:gumAPI()

gum.addNewCallBack("gum_barberstore:get_outfit", function(source, date)
	local _source = source
    local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local skinTable = Character.skin
	local compPlayer = Character.comp
	return skinTable, compPlayer
end)

RegisterServerEvent('gum_barberstore:save_skin')
AddEventHandler( 'gum_barberstore:save_skin', function(table_skin, full_price)
	local _source = source
	local User = gumCore.getUser(source)
	local Character = User.getUsedCharacter
	local money = Character.money
	if full_price <= money then
		Character.removeCurrency(_source, 0, full_price)
		Character.buySkinPlayer(_source, table_skin)
		TriggerClientEvent('gum_character:saveBarberAction', _source, table_skin)
	end
end)
