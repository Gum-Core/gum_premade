inv = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()
local gumCore = {}
TriggerEvent("getCore",function(core)
    gumCore = core
end)

RegisterNetEvent('dvr_cotonjob:getitem', function()
    local _source = source
    local user = gumCore.getUser(tonumber(_source))
    if user == nil then return end 
    local char = user.getUsedCharacter
    local count = math.random(2, 4)
    if char.job == "coton" or user.group == 'admin' then
        if inv.canCarryItem(tonumber(_source), 'flowercotton', tonumber(count)) then
            inv.addItem(tonumber(_source), 'flowercotton', tonumber(count))
            TriggerClientEvent('dvr_cotonjob:activefalse', _source)
        else
            TriggerClientEvent('gum_notify:notify', tonumber(_source), 'coton', 'You have no more room!', 'bag', 3000)
            TriggerClientEvent('dvr_cotonjob:activefalse', _source)
        end
    end
end)

RegisterNetEvent('dvr_cotonjob:givecotonsac', function()
    local _source = source
    local user = gumCore.getUser(tonumber(_source))
    if user == nil then return end 
    local char = user.getUsedCharacter
    if char.job == "coton" or user.group == 'admin' then
        if inv.canCarryItem(tonumber(_source), 'bag_of_cotton', 2) then
            inv.addItem(tonumber(_source), 'bag_of_cotton', 2)
            TriggerClientEvent('dvr_cotonjob:activefalse', tonumber(_source))
        else
            TriggerClientEvent('gum_notify:notify', tonumber(_source), 'coton', 'You have no more room!', 'bag', 3000)
            TriggerClientEvent('dvr_cotonjob:activefalse', tonumber(_source))
        end
    end
end)

RegisterNetEvent("dvr_cotonjob:server:Bell", function()
    TriggerClientEvent('dvr_cotonjob:client:Bell', -1)
end)

gum.addNewCallBack('getItem:coton', function(source, item)
    local count = inv.getItemCount(source, 'flowercotton')
    local user = gumCore.getUser(tonumber(source))
    local char = user.getUsedCharacter

    if char.job == "coton" or user.group == 'admin' then
        if count >= 2 then 
            inv.subItem(source, 'flowercotton', 2)
            return true
        else
            return false
        end
    end
end)

gum.addNewCallBack('getJobCoton', function(source, job)
    local _source = source
    local user = gumCore.getUser(_source)
    local char = user.getUsedCharacter
    return char.job
end)