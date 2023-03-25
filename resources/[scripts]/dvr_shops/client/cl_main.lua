local CurrentShop
local PromptShop
local Open = false
local inZone = false
local OpenShopGroup = GetRandomIntInRange(0, 0xffffff)

function OpenShop()
    CreateThread(function()
        local str = Config.language[1].text
        PromptShop = PromptRegisterBegin()
        PromptSetControlAction(PromptShop, 0xD9D0E1C0)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(PromptShop, str)
        PromptSetEnabled(PromptShop, true)
        PromptSetVisible(PromptShop, true)
        PromptSetHoldMode(PromptShop, true)
        PromptSetGroup(PromptShop, OpenShopGroup)
        PromptRegisterEnd(PromptShop)
    end)
end

CreateThread(function()
    OpenShop()
    local ShopGroupName = CreateVarString(10, 'LITERAL_STRING', Config.language[2].text)
    
    while true do
        for k, v in pairs(Config.Shops) do
            local dist = #(GetEntityCoords(PlayerPedId()) - v)
            if dist < 1.5 then
                inZone = true
                repeat
                    dist = #(GetEntityCoords(PlayerPedId()) - v)
                    PromptSetActiveGroupThisFrame(OpenShopGroup, ShopGroupName)
                    if PromptHasHoldModeCompleted(PromptShop) then
                        CurrentShop = k
                        Open = true
                        TriggerServerEvent("dvr_shops:RequireAccess", k)
                        Wait(1000)
                    end 
                    Citizen.Wait(1)
                until dist > 1.5 
                inZone = false
            end
        end

        if inZone then 
            Wait(1)
        else
            Wait(200)
        end
    end
end)
RegisterNetEvent('dvr_shops:OpenShop', function(items)
    if Open then
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = 1,
            shopitems = items
        })
    end
end)

RegisterNUICallback('buyitem', function(data)
    TriggerLatentServerEvent("dvr_shops:BuyItem", 1024, CurrentShop, data.data)
end)

RegisterNUICallback('close', function(data)
    Open = false
    SetNuiFocus(false, false)
end)
