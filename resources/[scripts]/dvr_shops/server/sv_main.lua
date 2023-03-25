local gumCore = {}

TriggerEvent("getCore",function(core)
    gumCore = core
end)

inv = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()

local Shops = {}

CreateThread(function()
    local s = LoadResourceFile(GetCurrentResourceName(), "ShopsData.json") or ""
    if s ~= "" then

        Shops = json.decode(s)
    else
        for k, v in pairs(Config.ShopInfo) do
            Shops[k] = v.Items
        end
    end
    for k, v in pairs(Config.ShopInfo) do
        if Shops[k] == nil then
            Shops[k] = v.Items
        end
        for m, l in pairs(Shops[k]) do
            if v.Items[m].amount > 0 then
                l.amount = Config.ShopInfo[k].Items[m].amount
            end
        end
    end
    Save()
end)


RegisterNetEvent('dvr_shops:RequireAccess', function(shopid, s)
    local _source = s or source

    if shopid == nil or Config.ShopInfo[shopid] == nil then
        return
    end
    
    local output = {}
    
    for k, v in pairs(Config.ShopInfo[shopid].Items) do
        table.insert(output, {
            label = v.label,
            name = k,
            price = v.price,
            img = v.imgsrc,
            print(Shops[shopid][k].amount),
            amount = Shops[shopid][k].amount,

    
        })
    end

    TriggerLatentClientEvent("dvr_shops:OpenShop", _source, 1024, output)
end)

RegisterNetEvent('dvr_shops:BuyItem', function(shopid, data)
    local _source = source
    if data.amount == 0 then
        return
    end

    local price
    if Shops[shopid][data.name].amount <= 0 then
        return
    end
    if Shops[shopid][data.name].amount < data.amount then
        return
    end
    
    price = Config.ShopInfo[shopid].Items[data.name].price * data.amount
   
    if not price then
        return
    end

    local user = gumCore.getUser(source)
    if user == nil then return end
    local char = user.getUsedCharacter
    if char.money >= price then
        if inv.canCarryItem(source, data.name, tonumber(data.amount)) then
            char.removeCurrency(source, 0, price)
            inv.addItem(source, data.name, data.amount)

            if Shops[shopid][data.name] then
                Shops[shopid][data.name].amount = Shops[shopid][data.name].amount - data.amount
            end

            TriggerClientEvent('gum_notify:notify', _source, "Shops", 'Vous avez acheté x'..data.amount.. '' ..data.label, "bag", 3000)
            TriggerEvent("dvr_shops:RequireAccess", shopid, _source)
        else
            TriggerClientEvent('gum_notify:notify', _source, "Shops", "Vous n'avez plus assez de place", "bag", 3000)
        end
    end
end)

function Save()
    SaveResourceFile(GetCurrentResourceName(), "ShopsData.json", json.encode(Shops), -1)
    SetTimeout(60000, Save)
end