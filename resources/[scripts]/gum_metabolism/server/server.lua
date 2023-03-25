local gumCore = {}

TriggerEvent("getCore",function(core)
	gumCore = core
end)
gum = exports.gum_core:gumAPI()

	
Inventory = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()
local blockSpamItems = {}
local metaDataCache = {}
for a,b in pairs(Config.Metabolism) do
    Inventory.RegisterUsableItem(b.idItem, function(data)
        if blockSpamItems[data.source] == nil then
            blockSpamItems[data.source] = true
            Inventory.subItem(data.source, b.idItem, 1)
            TriggerClientEvent("gum_metabolism:eatIt", data.source, b)
            local User = gumCore.getUser(data.source)
            local Character = User.getUsedCharacter
            if metaDataCache[tonumber(data.source)].hunger+b.hunger >= 100 then
                metaDataCache[tonumber(data.source)].hunger = 100
            else
                metaDataCache[tonumber(data.source)].hunger = metaDataCache[tonumber(data.source)].hunger+b.hunger
            end
            if metaDataCache[tonumber(data.source)].thirst+b.thirst >= 100 then
                metaDataCache[tonumber(data.source)].thirst = 100
            else
                metaDataCache[tonumber(data.source)].thirst = metaDataCache[tonumber(data.source)].thirst+b.thirst
            end
            metaDataCache[tonumber(data.source)] = {hunger=metaDataCache[tonumber(data.source)].hunger, thirst=metaDataCache[tonumber(data.source)].thirst}
        end
    end)
end

AddEventHandler('playerDropped', function (reason)
    local _source = source
    local User = gumCore.getUser(_source)
	if User ~= nil then
		local Character = User.getUsedCharacter
		if metaDataCache[tonumber(_source)] ~= nil then
			local meta_table = {Thirst=metaDataCache[tonumber(_source)].thirst, Hunger=metaDataCache[tonumber(_source)].hunger}
			Character.setMeta(tonumber(_source), meta_table)
		end
	end
end)

RegisterServerEvent('gum_metabolism:updateMeta')
AddEventHandler( 'gum_metabolism:updateMeta', function(food, water)
    local _source = source
    metaDataCache[tonumber(_source)].hunger = food
    metaDataCache[tonumber(_source)].thirst = water
end)
RegisterServerEvent('gum_metabolism:deBlockSpam')
AddEventHandler( 'gum_metabolism:deBlockSpam', function()
    local _source = source
    blockSpamItems[_source] = nil
end)

gum.addNewCallBack("gum_metabolism:getStatus", function(source, hunger,thirst)
    local _source = source
    local User = gumCore.getUser(_source)
    local Character = User.getUsedCharacter
    metaDataCache[_source] = {hunger=json.decode(Character.meta).Hunger, thirst=json.decode(Character.meta).Thirst}
	return json.decode(Character.meta).Hunger, json.decode(Character.meta).Thirst
end)
