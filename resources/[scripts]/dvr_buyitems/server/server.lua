local gumCore = {}

TriggerEvent("getCore",function(core)
    gumCore = core
end)

inv = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()
RegisterNetEvent('dvr_buyItems:trigger', function(item, label, price, job, amount, grade)
    local _source = source
    local user = gumCore.getUser(tonumber(_source))
    if user == nil then return end 
    local char = user.getUsedCharacter
    if amount ~= 0 then 
        if tonumber(char.jobgrade) >= tonumber(grade) then 
            if inv.canCarryItem(tonumber(_source), tostring(item), tonumber(amount)) then
                if char.money >= tonumber(price)*tonumber(amount) then 
                    inv.addItem(tonumber(_source), tostring(item), tonumber(amount))
                    char.removeCurrency(tonumber(_source), 0, tonumber(price)*amount)
                    TriggerClientEvent('dvr_buyItems:returnAnimation', tonumber(_source))
                    TriggerClientEvent('gum_notify:notify', tonumber(_source), "Shops", "You bought x"..tonumber(amount).. " de " ..tostring(label).. " For " ..tonumber(price)*tonumber(amount).. " $ - New amount : "..char.money-tonumber(price)*tonumber(amount).." $", 'bag', 5000)
                end
            else
                TriggerClientEvent('gum_notify:notify', tonumber(_source), "Shops", "You have no more room", 'bag', 5000)
            end
        else
            TriggerClientEvent('gum_notify:notify', tonumber(_source), "Shops", "You do not have permission to buy " ..tostring(label), 'bag', 5000)
        end
    end
end)

RegisterNetEvent('dvr_buyItems:trigger:sell', function(item, label, price, job, amount, grade)
    local _source = source
    local user = gumCore.getUser(tonumber(_source))
    if user == nil then return end 
    local char = user.getUsedCharacter
    if amount ~= 0 then 
        if tonumber(char.jobgrade) >= tonumber(grade) then 
            local count = inv.getItemCount(tonumber(_source), tostring(item))
            if tonumber(count) >= tonumber(amount) then 
                inv.subItem(tonumber(_source), tostring(item), tonumber(amount))
                TriggerClientEvent('dvr_buyItems:returnAnimation', tonumber(_source))
                TriggerClientEvent('gum_notify:notify', tonumber(_source), "Shops", "[company] You have sold x"..tonumber(amount).. " of " ..tostring(label).. " For " ..tonumber(price)*tonumber(amount).. " $", 'bag', 5000)
            else
                TriggerClientEvent('gum_notify:notify', tonumber(_source), "Shops", "You don't have this item", 'bag', 5000)
            end
        else
            TriggerClientEvent('gum_notify:notify', tonumber(_source), "Shops", "You do not have permission to buy " ..tostring(label), 'bag', 5000)
        end
    end
end)

gum.addNewCallBack('getJobitems', function(source, job)
    local _source = source
    local user = gumCore.getUser(_source)
    local char = user.getUsedCharacter
    return char.job
end)