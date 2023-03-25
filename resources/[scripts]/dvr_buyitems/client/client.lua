local InZone = false 
local Protect = {SpamEvent = false}
MenuData = {}
TriggerEvent("gum_menu:getData",function(call)
    MenuData = call
end)

local gum
TriggerEvent("getApi",function(gumData)
    gum = gumData
end)

local promptData = GetRandomIntInRange(0, 0xffffff)

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    TriggerEvent('gum:ExecuteServerCallBack','getJobitems', function(job)
        for k,v in pairs(Config.items) do 
            if job == k then  
                gum.createPrompt("Acheter", 0x339F3730, promptData, "SHORT_TIMED_EVENT_MP")
                gum.createPrompt("Vendre",  0x8AAA0AD4, promptData, "SHORT_TIMED_EVENT_MP")
                for kk,vv in pairs(Config.Coords) do 
                    gum.createBlip("Magasin pour entreprise", vv.x, vv.y, vv.z, 623155783)
                end
            end
        end
    end)
end)

CreateThread(function()
    gum.createPrompt("Acheter", 0x339F3730, promptData, "SHORT_TIMED_EVENT_MP")
    gum.createPrompt("Vendre",  0x8AAA0AD4, promptData, "SHORT_TIMED_EVENT_MP")
    for kk,vv in pairs(Config.Coords) do 
        gum.createBlip("Magasin pour entreprise", vv.x, vv.y, vv.z, 623155783)
    end
end)

function BuyMenu(result)
    MenuData.CloseAll()
    local elements = {}
    TriggerEvent('gum:ExecuteServerCallBack','getJobitems', function(job)
        print(job)
        if job ~= nil then 
            _job = job
        end
    end)

    exports.gum_status2:DisplayProgressBar(900)
    if result == 'buy' then 
        for k,v in pairs(Config.items) do 
            for k2, v2 in pairs(v) do 
                if v2.autorise == _job then 
                    if v2.value == 'buy' then 
                        BuyOrSell = "<span style='color:red;'> Acheter "..v2.price.." $ - x1</span>"

                        table.insert(elements, {
                            job         = k,
                            label       = v2.label,
                            value       = v2.value,
                            desc        = BuyOrSell,
                            price       = v2.price,
                            Itemlabel   = v2.label,
                            item        = v2.item,
                            grade        = v2.grade,
                        })
                    end
                end
            end
        end
    elseif result == 'sell' then
        for k,v in pairs(Config.items) do 
            for k2, v2 in pairs(v) do 
                if v2.autorise == _job then 
                    if v2.value == 'sell' then 
                        BuyOrSell = "<span style='color:green;'> Vendre "..v2.price.." $ - x1</span>"

                        table.insert(elements, {
                            job         = k,
                            label       = v2.label,
                            value       = v2.value,
                            desc        = BuyOrSell,
                            price       = v2.price,
                            Itemlabel   = v2.label,
                            item        = v2.item,
                            grade        = v2.grade,
                        })
                    end
                end
            end
        end
    end

    if json.encode(elements) == '[]' then 
        table.insert(elements, {
            label = "Aucun articles",
        })
    end

    MenuData.Open('default', GetCurrentResourceName(), 'menu', {
        title = "Magasin",
        subtext = 'achat',
        align = 'top-left',
        elements = elements

    }, function(data, menu)
        if data.current.value == "buy" then
            if data.current.item == 'Watering_Can' or data.current.item == 'Water_barrel' then 
                TriggerEvent('gum:ExecuteServerCallBack','getJobitems', function(job)
                    if job == data.current.job then  

                        exports.gum_status2:DisplayProgressBar(3000)
                        if not Protect.SpamEvent then 
                            Protect.SpamEvent = true 
                            TriggerServerEvent('dvr_buyItems:trigger', data.current.item, data.current.Itemlabel, data.current.price, data.current.job, 1, data.current.grade)
                            Wait(1000)
                            Protect.SpamEvent = false 
                        end
                    else
                        TriggerEvent('gum_notify:notify', "Shops", "You are not authorized to purchase this item ", 'bag', 6000)
                        menu.close()
                    end
                end)
            else
                TriggerEvent("guminputs:getInput", "Acheter", "Combien ?", function(count)
                    if math.type(tonumber(count)) == "integer" then  
                        if count ~= 'close' and count ~= "" then
                            local input = tonumber(count)
                            if type(input) == 'number' then 
                                TriggerEvent('gum:ExecuteServerCallBack','getJobitems', function(job)
                                    if job == data.current.job then  
                                        exports.gum_status2:DisplayProgressBar(3000)
                                        if not Protect.SpamEvent then 
                                            Protect.SpamEvent = true 
                                            TriggerServerEvent('dvr_buyItems:trigger', data.current.item, data.current.Itemlabel, data.current.price, data.current.job, input, data.current.grade)
                                            Wait(1000)
                                            Protect.SpamEvent = false 
                                        end
                                    else
                                        TriggerEvent('gum_notify:notify', "Shops", "You are not authorized to purchase this item ", 'bag', 6000)
                                        menu.close()
                                    end
                                end)
                            else
                                menu.close()
                            end
                        else
                            menu.close()
                        end
                    else
                        TriggerEvent('gum_notify:notify', "Shops", "Please add a valid value", 'bag', 6000)
                    end
                end)
            end
        elseif data.current.value == "sell" then
            TriggerEvent("guminputs:getInput", "Vendre", "Combien ?", function(count)
                if math.type(tonumber(count)) == "integer" then 
                    if count ~= 'close' and count ~= "" then
                        local input = tonumber(count)
                        if type(input) == 'number' then 
                            TriggerEvent('gum:ExecuteServerCallBack','getJobitems', function(job)
                                if job == data.current.job then  
                                    exports.gum_status2:DisplayProgressBar(3000)
                                    if not Protect.SpamEvent then 
                                        Protect.SpamEvent = true 
                                        TriggerServerEvent('dvr_buyItems:trigger:sell', data.current.item, data.current.Itemlabel, data.current.price, data.current.job, input, data.current.grade)
                                        Wait(1000)
                                        Protect.SpamEvent = false 
                                    end
                                else
                                    TriggerEvent('gum_notify:notify', "Shops", "You are not authorized to sell this item ", 'bag', 6000)
                                    menu.close()
                                end
                            end)
                        else
                            menu.close()
                        end
                    else
                        menu.close()
                    end
                else
                    TriggerEvent('gum_notify:notify', "Shops", "Please add a valid value", 'bag', 6000)
                end
            end)
        end
    end, function(data, menu) menu.close() end)
end

RegisterNetEvent('dvr_buyItems:returnAnimation', function()
    playAnim("script_proc@robberies@homestead@rocky@take_money","base_player")
end)

CreateThread(function()
    while true do
       timer = 3000
        for k,v in pairs(Config.Coords) do 
            if gum.playerNearCoords(v.x, v.y, v.z, 1.0) then
                timer = 5
                gum.getPrompt(promptData, "Magasin")
                if gum.getPromptButton("Acheter", promptData) then
                    Wait(100)     
                    BuyMenu('buy')
                end
                if gum.getPromptButton("Vendre", promptData) then
                    Wait(100)     
                    BuyMenu('sell')
                end
            end
        end

        Wait(timer)
     end
end)

function playAnim(dict,name)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
	TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, 10000, 0, 0, true, 0, false, 0, false)  
end